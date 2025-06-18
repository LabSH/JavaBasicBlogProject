package idusw.javaweb.ksh_blog.repository;

import idusw.javaweb.ksh_blog.model.Member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// MemberDAOImpl : 소문자 주의
public class MemberDAOImpl extends DAOImpl implements MemberDAO{

    // JDBC Objects 선언
    // 여기 변수 지정은 필수임
    private Connection conn = null;
    private Statement stmt = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    // 생성자 : getConnection 메서드 호출, 이것도 필수
    public MemberDAOImpl(){conn = getConnection();}

    @Override
    public int create(Member member) { // 등록 : registor, post
        int ret = 0;
        String sql = "insert into member(email, pw, username, phone, address, admin) values(?,?,?,?,?,?)";
        try {

            pstmt = conn.prepareStatement(sql); // prepared Statement 객체, 미리 컴파일

            pstmt.setString(1, member.getEmail());
            pstmt.setString(2, member.getPw());
            pstmt.setString(3, member.getUsername());
            pstmt.setString(4, member.getPhone());
            pstmt.setString(5, member.getAddress());
            pstmt.setInt(6, 0);

            ret = pstmt.executeUpdate(); // update
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ret;
    }
    // Resultset(DB 처리 결과 집합)를 Member객체로 변환
    private Member setMemberRs(ResultSet rs) throws SQLException {
        Member retMember = new Member();
        retMember.setSeq(rs.getInt("seq"));
        retMember.setEmail(rs.getString("email"));
        retMember.setPw(rs.getString("pw"));
        retMember.setUsername(rs.getString("username"));
        retMember.setPhone(rs.getString("phone"));
        retMember.setAddress(rs.getString("address"));
        retMember.setAdmin(rs.getInt("admin"));
        return retMember;
    }

    @Override
    public Member read(Member member) {
        Member retMember = null;
        // 지난주 email 조건 -> id 조건으로 조회
        String sql = "select * from member where email=? and pw=?"; // 유일키로(unique key)로 조회
        try {
            pstmt = conn.prepareStatement(sql); // prepared Statement 객체, 미리 컴파일
            pstmt.setString(1, member.getEmail());
            pstmt.setString(2, member.getPw());

            rs = pstmt.executeQuery(); // insert, update, delete문 실행시 사용
            if(rs.next()) { // rs.next()는 반환된 객체에 속한 요소가 있는지를 반환하고, 다름 요소로 접근
                retMember = setMemberRs(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return retMember;
    }



    @Override
    public List<Member> readList() {
        ArrayList<Member> memberList = null;
        String sql = "select * from member where admin=0";
        try{
            stmt = conn.createStatement();  // Statement 객체, SQL 문법에 맞게(문자열화) 사용
            if((rs = stmt.executeQuery(sql)) != null){
                memberList = new ArrayList<Member>();
                while(rs.next()) {
                    Member member = new Member();
                    member = setMemberRs(rs);
                    memberList.add(member); // element 집합체 List
                }
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return memberList;
    }

    @Override
    public int update(Member member) {
        int ret = 0;
        String sql = "update member set pw=?, username=?, phone=?, address=? where email=?";
        try {
            pstmt = conn.prepareStatement(sql); // prepared Statement 객체, 미리 컴파일
            pstmt.setString(1, member.getPw());
            pstmt.setString(2, member.getUsername());
            pstmt.setString(3, member.getPhone());
            pstmt.setString(4, member.getAddress());
            pstmt.setString(5, member.getEmail());
            ret = pstmt.executeUpdate(); // insert, update, delete 문 실행시 사용
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ret; // 질의의 영향을 받은 row 의 수 반환, 0이면 오류, 1이상이면 정상
    }

    @Override
    public int delete(Member member) {
        int ret = 0;
        String sql = "delete from member where seq=?";
        try {
            pstmt = conn.prepareStatement(sql); // prepared Statement 객체, 미리 컴파일
            pstmt.setInt(1, member.getSeq());
            ret = pstmt.executeUpdate(); // insert, update, delete 문 실행시 사용
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ret; // 질의의 영향을 받은 row 의 수 반환, 0이면 오류, 1이상이면 정상
    }
}

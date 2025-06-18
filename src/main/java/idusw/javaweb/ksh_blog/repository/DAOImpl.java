package idusw.javaweb.ksh_blog.repository;

import java.sql.*;


public class DAOImpl implements DAO{ // 상속 중요

    @Override
    public Connection getConnection() {
        Connection conn = null;
        // 연견을 위한 정보
        String jdbcUrl = "jdbc:mysql://localhost:3306/db_last_202012034"; // DB주소 : 톰캣설정에서 확인가능
        String dbUser = "u_last_a202012034"; // DBUser이름
        String dbPw = "1234"; // 유저에 맞는 암호
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로딩
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPw); // DB 연결
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버를 찾을 수 없습니다.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("데이터베이스 연결 오류: " + e.getMessage());
            e.printStackTrace();
        }
        return conn;
    }

    @Override
    public void closeResources(Connection conn, Statement stmt, PreparedStatement pstmt, ResultSet rs) throws SQLException {
        if(conn != null) {   conn.close(); }
        if(stmt != null) {   stmt.close(); }
        if(pstmt != null) {   pstmt.close(); }
        if(rs != null) {   rs.close(); }
    }
}

package idusw.javaweb.ksh_blog.repository;

import java.sql.*;

public interface DAO {
    Connection getConnection(); //연결 객체를 가져오는 메서드 선언
    void closeResources(Connection conn, Statement stmt, PreparedStatement pstmt, ResultSet rs) throws SQLException;
}

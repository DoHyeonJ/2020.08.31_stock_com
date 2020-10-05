package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import DTO.Board_DTO;
import DTO.Comment_DTO;
import common.D;

public class comment_DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성됨.
	public comment_DAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("Comment_DAO 객체 생성, 데이터베이스 연결.");
		//클래스를 찾지 못했을때의 예외처리
		} catch (ClassNotFoundException e) { 
			e.printStackTrace();
		//SQL 에러시의 예외처리
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 자원 반납 메소드
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	//새글 작성 id, 내용 
	//INSERT
	public int insert(Comment_DTO dto) throws SQLException{
		String id = dto.getComment_id();
		String content = dto.getComment_content();
		return this.insert(id, content);
	}
	
	public int insert(String id, String content) throws SQLException{
		int cnt =0;
		try {
			pstmt = conn.prepareStatement(D.SQL_COMMENT_INSERT);
			pstmt.setString(1, id);
			pstmt.setString(2, content);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
} //end class



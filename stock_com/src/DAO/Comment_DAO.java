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

public class Comment_DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성됨.
	public Comment_DAO() {
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
		int boardUid = dto.getComment_boardUid();
		String id = dto.getComment_id();
		String content = dto.getComment_content();
		return this.insert(boardUid, id, content);
	}
	
	public int insert(int boardUid, String id, String content) throws SQLException{
		int cnt =0;
		try {
			pstmt = conn.prepareStatement(D.SQL_COMMENT_INSERT);			
			pstmt.setInt(1, boardUid);
			pstmt.setString(2, id);
			pstmt.setString(3, content);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	//Resultset DTO 배열로 변환 리턴
	public Comment_DTO [] createArray(ResultSet rs) throws SQLException{
		ArrayList<Comment_DTO> list = new ArrayList<Comment_DTO>();
		
		while(rs.next()) {
			int comment_uid = rs.getInt("comment_uid");
			int comment_boardUid = rs.getInt("comment_boardUid");
			String comment_id = rs.getString("comment_id");
			String comment_content = rs.getString("comment_content");
			Date d = rs.getDate("comment_date");
			Time t = rs.getTime("comment_date");
			String comment_date = new SimpleDateFormat("yyyy-MM-dd").format(d) + " " 
			+ new SimpleDateFormat("hh:mm:ss").format(t); 
			Comment_DTO dto = new Comment_DTO(comment_uid, comment_boardUid, comment_id, comment_content, comment_date);
			list.add(dto);
		}
		int size = list.size();
		Comment_DTO [] arr = new Comment_DTO[size];
		list.toArray(arr);
		return arr;
	}
	
	//특정 댓글 불러오기 
	public Comment_DTO [] readByUid (int uid) throws SQLException{
		Comment_DTO arr[] = null;
		
		try {
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(D.SQL_COMMENT_SELECT_BY_BOARDUID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
		}finally{
			close();
		}
		return arr;
	}
	
	// 특정 uid 의 댓글을 삭제하기
	// DELETE
	public int deleteByUid(int uid) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_COMMENT_DELETE_BY_UID);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	
} //end class
















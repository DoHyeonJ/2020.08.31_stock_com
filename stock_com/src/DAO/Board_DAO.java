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
import common.D;

public class Board_DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성됨.
	public Board_DAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("Board_DAO 객체 생성, 데이터베이스 연결.");
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
	
	//새글 작성 <-- 제목,내용 [작성자 따로 추가필요]
	//INSERT
	public int insert(Board_DTO dto) throws SQLException {
		String id = dto.getBoard_id();
		String title = dto.getBoard_title();
		String content = dto.getBoard_content();
		return this.insert(id, title, content);
	}
	
	public int insert(String id, String title, String content) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_BOARD_INSERT);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// Resultset --> DTO 배열로 변환 리턴
	public Board_DTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<Board_DTO> list = new ArrayList<Board_DTO>();
		
		while(rs.next()) {
			int board_uid = rs.getInt("board_uid");
			String board_id = rs.getString("board_id");
			String board_title = rs.getString("board_title");
			String board_content = rs.getString("board_content");
			if(board_content == null) board_content = "";
			int board_viewcnt = rs.getInt("board_viewcnt");
			Date d = rs.getDate("board_date");
			Time t = rs.getTime("board_date");
			String board_date = new SimpleDateFormat("yyyy-MM-dd").format(d)+" "+new SimpleDateFormat("hh:mm:ss").format(t);
			Board_DTO dto = new Board_DTO(board_uid, board_id, board_title, board_content, board_viewcnt, board_date);
			list.add(dto);
		}
		
		int size = list.size();
		Board_DTO [] arr = new Board_DTO[size];
		list.toArray(arr);
		return arr;
	}
	
	// 글 목록 읽어오기
	// SELECT
	public Board_DTO [] select() throws SQLException {
		Board_DTO [] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_BOARD_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	//특정 uid 의 글만 읽어오기
	public Board_DTO [] selectByuid(int uid) throws SQLException {
		Board_DTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_BOARD_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	// 특정 uid 의 글만 읽어오기  + 조회수 증가
	// SELECT, UPDATE
	public Board_DTO[] readByUid (int uid) throws SQLException{
		int cnt =0;
		Board_DTO arr[] = null;
		
		try {
			// 트랜잭션 처리
			conn.setAutoCommit(false);
			
			//쿼리문 실행
			pstmt = conn.prepareStatement(D.SQL_BOARD_VIEWCNT);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			pstmt = conn.prepareStatement(D.SQL_BOARD_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			throw e;
		}finally {
			close();
		}
		
		return arr;
	}
	// 특정 uid 의 글을 삭제하기
	// DELETE
	public int deleteByUid(int uid) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_BOARD_DELETE_BY_UID);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	//특정 uid 의 글을 수정하기 --> 제목,내용
	//UPDATE
	public int update(int uid, String title, String content) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_BOARD_UPDATE);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	
} //end class



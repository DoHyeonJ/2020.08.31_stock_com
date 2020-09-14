package com.lec.beans;

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

import common.D;

public class St_DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성됨.
	public St_DAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("St_DAO 객체 생성, 데이터베이스 연결.");
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
	
	
	//새글 작성 <-- 제목,내용,작성자
	//INSERT
	public int insert(St_DTO dto) throws SQLException {
		String title = dto.getBorad_title();
		String content = dto.getBorad_content();
		String name = dto.getBorad_name();
		
		return this.insert(title, content, name);
	}
	
	public int insert(String title, String content, String name) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_BORAD_INSERT);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, name);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// Resultset --> DTO 배열로 변환 리턴
	public St_DTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<St_DTO> list = new ArrayList<St_DTO>();
		
		while(rs.next()) {
			int borad_uid = rs.getInt("board_uid");
			String borad_name = rs.getString("board_name");
			String borad_title = rs.getString("board_title");
			String borad_content = rs.getString("board_content");
			if(borad_content == null) borad_content = "";
			Date d = rs.getDate("board_date");
			Time t = rs.getTime("board_date");
			int borad_viewCnt = rs.getInt("board_viewcnt");
			String borad_date = new SimpleDateFormat("yyyy-mm-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			
			St_DTO dto = new St_DTO(borad_uid, borad_name, borad_title, borad_content,  borad_date, borad_viewCnt);
			list.add(dto);
		}
		
		int size = list.size();
		St_DTO [] arr = new St_DTO[size];
		list.toArray(arr);
		return arr;
	}
	
	// 글 목록 읽어오기
	// SELECT
	public St_DTO [] select() throws SQLException {
		St_DTO [] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_BORAD_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	//특정 uid 의 글만 읽어오기
	public St_DTO [] selectByuid(int uid) throws SQLException {
		St_DTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_BORAD_SELECT_BY_UID);
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
	public St_DTO[] readByUid (int uid) throws SQLException{
		int cnt =0;
		St_DTO arr[] = null;
		
		try {
			// 트랜잭션 처리
			conn.setAutoCommit(false);
			
			//쿼리문 실행
			pstmt = conn.prepareStatement(D.SQL_BORAD_VIEWCNT);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			pstmt = conn.prepareStatement(D.SQL_BORAD_SELECT_BY_UID);
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
			pstmt = conn.prepareStatement(D.SQL_BORAD_DELETE_BY_UID);
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
			pstmt = conn.prepareStatement(D.SQL_BORAD_UPDATE);
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



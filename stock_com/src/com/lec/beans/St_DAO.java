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
}



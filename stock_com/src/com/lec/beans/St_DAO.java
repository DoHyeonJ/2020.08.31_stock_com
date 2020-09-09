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
	
	// DAO ��ü�� �����ɶ� Connection �� ������.
	public St_DAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("St_DAO ��ü ����, �����ͺ��̽� ����.");
		//Ŭ������ ã�� ���������� ����ó��
		} catch (ClassNotFoundException e) { 
			e.printStackTrace();
		//SQL �������� ����ó��
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB �ڿ� �ݳ� �޼ҵ�
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	// Ư�� uid �� �۸� �о����  + ��ȸ�� ����
	// SELECT, UPDATE
	public St_DTO[] readByUid (int uid) throws SQLException{
		int cnt =0;
		St_DTO arr[] = null;
		
		try {
			// Ʈ����� ó��
			conn.setAutoCommit(false);
			
			//������ ����
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



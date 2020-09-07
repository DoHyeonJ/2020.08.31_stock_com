package com.lec.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.D;

public class St_DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet re;
	
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
		if(re != null) re.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
 
	}
}
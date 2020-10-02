package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import DTO.Member_DTO;
import common.D;

public class Member_DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	//DAO 객체가 생성될때 Connection 도 생성됨.
	public Member_DAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("Member_DAO 객체 생성, 데이터베이스 연결.");
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

// INSERT 회원가입
public int insert(Member_DTO dto) throws SQLException {
	String name = dto.getMember_name();
	String id = dto.getMember_id();
	String pw = dto.getMember_pw();
	String email = dto.getMember_email();
	String gender = dto.getMember_gender();
	String birth = dto.getMember_birth();
	String phone = dto.getMember_phone();
	
	System.out.println("회원가입 버튼눌림");
	return this.insert(name, id, pw, email, gender, birth, phone);
}

public int insert(String name, String id, String pw, String email, String gender, String birth, String phone) throws SQLException {
	int cnt = 0;
	try {
		pstmt = conn.prepareStatement(D.SQL_MEMBER_INSERT);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setString(3, pw);
		pstmt.setString(4, email);
		pstmt.setString(5, gender);
		pstmt.setString(6, birth);
		pstmt.setString(7, phone);
		cnt = pstmt.executeUpdate();
	} finally {
		close();
	}
	
	return cnt;
	}
// Resultset --> DTO 배열로 변환 리턴
public Member_DTO [] createArray(ResultSet rs) throws SQLException {
	ArrayList<Member_DTO> list = new ArrayList<Member_DTO>();
	
	while(rs.next()) {
		int member_uid = rs.getInt("member_uid");
		String member_name = rs.getString("member_name");
		String member_id = rs.getString("member_id");
		String member_pw = rs.getString("member_pw");
		String member_email = rs.getString("member_email");
		String member_gender = rs.getString("member_gender");
		Date d = rs.getDate("Member_birth");
		String member_birth = new SimpleDateFormat("yyyy-MM-dd").format(d);
		String member_phone = rs.getString("member_phone");
		Member_DTO dto = new Member_DTO(member_uid, member_name, member_id, member_pw, member_email, member_gender, member_birth, member_phone);
		list.add(dto);
	}
	
	int size = list.size();
	Member_DTO [] arr = new Member_DTO[size];
	list.toArray(arr);
	return arr;
	}

// 회원가입 id 중복확인
public int idCheck (String id) throws SQLException {
		try {
			pstmt = conn.prepareStatement(D.SQL_MEMBER_IDCHECK);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}else {//아이디 없으면 0반환
				return 0;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		//오류 발생시 -1 반환
		return -1;
	}
}













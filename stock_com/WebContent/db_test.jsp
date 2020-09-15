<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   <%-- JDBC 관련 클래스 import --%>
<%!
	// JDBC 관련 기본 객체 변수들 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // executeQuery(), SELECT 결과 
	int cnt = 0;           // executeUpdate(), DML 결과
	
	// Connection 에 필요한 값 세팅
	String driver = "org.mariadb.jdbc.Driver";	  // JDBC 드라이버 클래스
	String url = "jdbc:mariadb://localhost:3306/mydb";   // DB 접속 URL
	String uid = "myuser";   // DB 접속 계정 정보
	String upw = "1234";
%>    
<%!
	// 쿼리문 준비
	// ex) String sql_xxxx = "INSERT INTO .....";  
%>
<%
	try{
		Class.forName(driver);
		out.println("드라이버 로딩 성공" + "<br>");   // 테스트 출력
		conn = DriverManager.getConnection(url, uid, upw);
		out.println("conn 성공" + "<br>");       // 테스트 출력
		
		// 트랜잭션 실행
		//
		
	} catch(Exception e){
		e.printStackTrace();
		//※ 예외처리를 하든지, 예외 페이지를 설정해주어야 한다.
	} finally {
		// DB 리소스 해제
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	} // end try
%>
<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>


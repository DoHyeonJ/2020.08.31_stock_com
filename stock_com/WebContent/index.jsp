<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//메인페이지에서 로그인 안되어있으면 로그인 버튼 보여주기
	if(session.getAttribute("id")==null){
		out.println("<a href='memberLogin.do'>로그인</a>");
	}
	//메인페이지에서 로그인 되어있으면 반갑습니다 창 띄워주고 로그아웃 버튼 보여주기
	else{
		String id = (String)session.getAttribute("id");
		out.println(id+"님 반갑습니다.<br>");	
		out.println("<a href='memberLogout.do'>로그아웃</a>"); 
		out.println("<a href='boardList.do'>게시글목록</a>");
	}
%>
<%@page import="DTO.Board_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%-- jstl 지시자 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Board_DTO [] arr = (Board_DTO [] )request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<script>
	//로그아웃 버튼을 눌렀을때 실행될 함수
	function logOut() {
	var result = confirm("로그아웃 하시겠습니까?");
	if(result){
		alert("로그아웃 되셨습니다.");
		location.href='memberLogout.do';
	}
}
</script>
<body>
		<hr>
		<h2>리스트</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			<tr>
<%
		for(int i=0; i < arr.length; i++){
			out.println("<tr>");
			out.println("<td>" + arr[i].getBoard_uid() + "</td>");
			out.println("<td><a href='boardView.do?uid=" + arr[i].getBoard_uid() + "'>" + arr[i].getBoard_title() + "</a></td>");
			out.println("<td>" + arr[i].getBoard_id() + "</td>");
			out.println("<td>" + arr[i].getBoard_viewcnt() + "</td>");
			out.println("<td>" + arr[i].getBoard_date() + "</td>");
			out.println("</tr>");
		}
%>
		</table>
		<br>
		<%-- id세션값이 넘어온 경우 로그인,회원가입 버튼 없애주기 (로그인됬을때 보여줄 창들) --%>
<%	if(session.getAttribute("id")==null){%>

		<button onclick="location.href='memberLogin.do'">로그인</button>
		<button onclick="location.href='memberSignUp.do'">회원가입</button>
<%}else{ %>
		<button onclick="location.href='boardWrite.do'">신규등록</button>
		<input type="button" onClick="logOut()" value="로그아웃">
<%} %>
</body>
</html>










<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.*" %>  
<%-- jstl 지시자 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Board_DTO [] boa_arr = (Board_DTO [] )request.getAttribute("list");
	Member_DTO [] mem_arr = (Member_DTO [] )request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
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
		for(int i=0; i <= boa_arr.length; i++){
			out.println("<tr>");
			out.println("<td>" + boa_arr[i].getBoard_uid() + "</td>");
			out.println("<td><a href='boardView.do?uid=" + boa_arr[i].getBoard_uid() + "'>" + boa_arr[i].getBoard_title() + "</a></td>");
			out.println("<td>" + mem_arr[i].getMember_name() + "</td>");
			out.println("<td>" + boa_arr[i].getBoard_viewcnt() + "</td>");
			out.println("<td>" + boa_arr[i].getBoard_date() + "</td>");
			out.println("</tr>");
		}
%>
		</table>
		<br>
		<button onclick="location.href='boardWrite.do'">신규등록</button>
</body>
</html>
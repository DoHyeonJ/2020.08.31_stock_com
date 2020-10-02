<%@page import="DAO.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	Member_DAO dao = new Member_DAO();
	int result = dao.idCheck(id);
	
	if(result == 1){%>
	<center>
	<br /><br />
	<h4>이미 사용중인 ID 입니다.</h4>
	</center>
<% } else { %>
	<center>
	<br /><br />
	<h4>입력하신 <%=id %>는 사용하실 수 있는 ID입니다.</h4>
	</center>
<% } %>
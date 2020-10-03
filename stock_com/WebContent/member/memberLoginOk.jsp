<%@page import="DAO.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	Member_DAO dao = new Member_DAO();
	int result = dao.login(id, pw);
%>	
<% if(result != 1){ %>
	<script>
		alert("로그인 실패! \nID 또는 PW를 확인해주세요.");
		history.back();
	</script>

<%	} else {
	//한글깨짐 방지.
	request.setCharacterEncoding("UTF-8");

	//로그인에 성공하면 사용자 아이디를 세션변수에 저장한다.
	session.setAttribute("id", id);
}
	response.sendRedirect("index.jsp");
%>
<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>







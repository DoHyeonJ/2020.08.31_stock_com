<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ST_COMMUNITY</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
</head>
<body>
<br></br>
<div class="container">
<%
	//메인페이지에서 로그인 안되어있으면 로그인 버튼 보여주기
	if(session.getAttribute("id")==null){
		out.println("<a href='memberLogin.do'>로그인</a>");
	}
	//메인페이지에서 로그인 되어있으면 반갑습니다 창 띄워주고 로그아웃 버튼 보여주기
	else{
		String id = (String)session.getAttribute("id");
		out.println(id+"님 반갑습니다.<br>");	
%>	
		<input type="button" onClick="logOut()" value="로그아웃">
		<%out.println("<button onclick=location.href='boardList.do'>게시글목록</a>");
	}%>
</div>
</body>
</html>





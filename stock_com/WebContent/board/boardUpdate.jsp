<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.*" %>
<%
	// Controller 로부터 결과 데이터 받음 
	Board_DTO [] arr = (Board_DTO []) request.getAttribute("list");
	//int uid = Integer.parseInt(request.getParameter("uid")); //OK
%>
<%
	int uid = arr[0].getBoard_uid();
	String title = arr[0].getBoard_title();
	String content = arr[0].getBoard_content();
	String date = arr[0].getBoard_date();
	int viewcnt = arr[0].getBoard_viewcnt();
%>
<!DOCTYPE html>
<html lang ="ko">
<head>
<meta charset="UTF-8">
<title>수정 <%= title %></title>
</head>
<script>
// form 검증
function chkSubmit() {
	frm = document.forms["frm"];
	
	var title = frm["title"].value.trim();
	
	if(subject == ""){
		alert("제목을 작성하여 주십시오");
		frm["subject"].focus();
		return false;
	}
	
	return true;
}
</script>
<body>
<h2>수정</h2>
<%--내용과 제목만 수정가능. submit 하기전에 검증 --%>
<form name="frm" action="boardUpdateOk.do" 
method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="uid" value="<%= uid%>"/>
작성자 : <br> <%-- 작성자 이름은 변경 불가 --%>
제목 : 
<input type="text" name="title" value="<%=title%>"><br>
내용 :
<textarea name="content"><%= content %></textarea>
<br><br>
<input type="submit" value="수정"/>
</form>

<button onclick="history.back()">이전으로</button>
<button onclick="location.href = 'boardList.do'">목록보기</button>
</body>
</html>












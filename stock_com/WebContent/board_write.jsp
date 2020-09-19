<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<script>
// form 검증 [게시글 제목을 공백으로 하였는지 Check]
function chkSubmit() {
	frm = document.forms["frm"];
	
	var subject = frm["title"].value.trim();
	
	if(title == ""){
		alert("제목을 작성하여 주세요.")
		frm["title"].focus();
		return false;
	}
	
	return true
}
</script>
<body>
<h2>글작성</h2>
<%-- 글 내용이 많을 수 있기 때문에 POST 방식을 사용 --%>
<form name="frm" action="boardOk.do" method="post" onsubmit="return chkSubmit">
제목 : 
<input type="text" name="title"/><br>
내용 :<br>
<textarea name="content"></textarea>
<br><br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='boardList.do'">목록으로</button>
</body>

</html>
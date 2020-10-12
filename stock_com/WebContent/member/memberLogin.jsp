<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지입니다.</title>
</head>
<script>

function chkSubmit(){
	frm = document.forms["frm"]
	
	//검증여부를 위한 변수
	var id = frm["id"].value.trim();
	var pw = frm["pw"].value.trim();
		
	if(id == ""){
		alert("id를 입력해주세요.")
		frm["id"].focus();
		return false
		}
	if(pw == ""){
		alert("pw를 입력해주세요.")
		frm["pw"].focus();
		return false
		}
	
	url = "memberLoginCheck.do?id=&&pw=" + document.frm.id.value + document.frm.pw.value;
	
	return true;
}
</script>
<body>
<form name ="frm" action="memberLoginOk.do" method="post" onsubmit="return chkSubmit()">
id :
<input type="text" name="id"><br>
pw :
<input type="password" name="pw"><br>
<input type="button" onclick="location.href='memberSignUp.do'" value="회원가입">
<input type="submit" value="로그인"/>
</form>
</body>
</html>
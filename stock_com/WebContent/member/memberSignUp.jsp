<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지입니다.</title>
</head>
<script>
// form 검증 [회원정보를 공백으로 하였는지 Check]
function chkSubmit(){
	frm = document.forms["frm"]
	
	var name = frm["name"].value.trim();
	var id = frm["id"].value.trim();
	var pw = frm["pw"].value.trim();
	var email = frm["email"].value.trim();
	var birth = frm["birth"].value.trim();
	var phone = frm["phone"].value.trim();
	
	if(name == ""){
		alert("이름을 입력해주세요.")
		frm["name"].focus();
		return false
	}
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
	if(email == ""){
		alert("email을 입력해주세요.")
		frm["email"].focus();
		return false
	}
	if(birth == ""){
		alert("생일을 입력해주세요.")
		frm["birth"].focus();
		return false
	}
	if(phone == ""){
		alert("휴대폰 번호를 입력해주세요.")
		frm["phone"].focus();
		return false
	}
	
	return true;
}
</script>
<body>
<h2>회원가입</h2>
<%-- action 부분 memberSignOk.do 작성필요 --%>
<form name ="frm" action="memberSignOk.do" method="post" onsubmit="return chkSubmit">
이름 : 
<input type="text" name="name"/><br>
id :
<input type="text" name="id"/><br>
pw :
<input type="password" name="id"/><br>
email :
<input type="text" name="email"/><br>
생일 : 
<input type="text" name="birth"/><br>
휴대폰 번호 : 
<input type="text" name="phone"/><br>
<input type="submit" value="회원가입"/>
</form>
</body>
</html>




















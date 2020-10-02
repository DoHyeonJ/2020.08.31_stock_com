<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지입니다.</title>
</head>
<script>
function confirmId(){
	if(document.frm.id.value == ""){
		alert("ID를 입력하세요");
		return;
	}
	url = "memberConfirmId.jsp?id=" + document.frm.id.value;
	open(url, "confirm",
		"toobar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200"	)
}
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
<form name ="frm" action="memberSignOk.do" method="post" onsubmit="return chkSubmit()">
이름 :
<input type="text" name="name"/><br>
id :
<input type="text" name="id"/>
<input type="button"  value="ID중복체크" onClick="confirmId()"/><br>
pw :
<input type="password" name="pw"/><br>
email :
<input type="text" name="email"/><br>
성별 : 
<input type="radio" name="gender" value="1" checked="checked"/>남자
<input type="radio" name="gender" value="2"/>여자<br>
생일 : 
<input type="text" name="birth"/><br>
휴대폰 번호 : 
<input type="text" name="phone"/><br>
<input type="submit" value="회원가입"/>
</form>
</body>
</html>




















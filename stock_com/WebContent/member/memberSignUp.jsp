<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport " content="width=device-width, initial-scale=1.0 ">
    <link rel="stylesheet " href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css ">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js "></script>
<title>회원가입 페이지입니다.</title>
</head>
<script>
var idCheckOk = 0;
//id 중복확인 
function confirmId(){
	if(document.frm.id.value == ""){
		alert("ID를 입력하세요");
		return;
	}
	url = "memberConfirmId.do?id=" + document.frm.id.value;
	open(url, "confirm",
		"toobar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200"	)
	idCheckOk =1;
}

function chkSubmit(){
	frm = document.forms["frm"]
	
	//검증여부를 위한 변수
	var name = frm["name"].value.trim();
	var id = frm["id"].value.trim();
	var pw = frm["pw"].value.trim();
	var pwCheck = frm["pwCheck"].value.trim();
	var email = frm["email"].value.trim();
	var birth = frm["birth"].value.trim();
	var phone = frm["phone"].value.trim();
	
	//emali 체크를 위한 변수
    var atPos = email.indexOf('@');
    var atLastPos = email.lastIndexOf('@');
    var dotPos = email.indexOf('.'); 
    var spacePos = email.indexOf(' ');
    var commaPos = email.indexOf(',');
    var eMailSize = email.length;
	
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
	if(idCheckOk == 0){
		alert("ID중복체크를 해주세요.")
		frm["id"].focus();
		return false
	}
	if(pw == ""){
		alert("pw를 입력해주세요.")
		frm["pw"].focus();
		return false
	}
	if(pwCheck == ""){
		alert("pw확인을 입력해주세요.")
		frm["pwCheck"].focus();
		return false
	}
	if(pw != pwCheck){
		alert("비밀번호가 일치하지않습니다.")
		frm["pwCheck"].focus();
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
	
//	이메일 주소형식을 검사하는 부분
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!\n ex) ex@ex.com');
          frm["email"].focus();
		  return false;
    }
	return true;
}
</script>
<body>
<br></br>
    <div class="mask rgba-black-light d-flex justify-content-center align-items-center">
        <div class="container">
            <div class="row wow fadeIn">
                <div class="col-md-6 mb-4 white-text text-center text-md-left">
                    <h1 class="display-4 font-weight-bold">Sign UP</h1>
                    <hr class="hr-light">
                    <p>
                        <strong>For the more information</strong>
                    </p>
                    <p class="mb-4 d-none d-md-block">
                        <strong>Quickly get information from new leads and customers by signing up .WIth their information, you can funnel them into new accounts in an instant.Follow us on FACEBOOK</strong>
                    </p>
                    <i class="fa fa-facebook ml-2"></i>
                </div>
                <div class="col-md-6 col-xl-5 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <form name="frm" method="post" action="memberSignOk.do">
                                <p class="h4 text-center mb-4">Sign up</p>
                                <br>
                                <div class="md-form">
                                    <i class="fa fa-user prefix grey-text"></i>
                                    <input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요">
                                </div>
                                <br>
                                <div class="md-form">
                                    <i class="fa fa-exclamation-triangle prefix grey-text"></i>
                                    <input type="text" name="id" class="form-control" placeholder="ID를 입력해주세요">
                                </div>
                                <br>
                                    <input type="button" value="ID중복확인 " class="btn btn-default" style="display:block" onClick="confirmId()">
                                <br>
                                <div class="md-form">
                                    <i class="fa fa-envelope prefix grey-text"></i>
                                    <input type="password" name="pw" class="form-control" placeholder="비밀번호를 입력해주세요 ">
                                </div>
                                <br>
                                <div class="md-form">
                                    <i class="fa fa-exclamation-triangle prefix grey-text"></i>
                                    <input type="password" name="pwCheck" class="form-control" placeholder="비밀번호를 확인합니다 ">
                                </div>
                                <br>
                                <div class="md-form">
                                    <i class="fa fa-exclamation-triangle prefix grey-text"></i>
                                    <input type="email" name="email" class="form-control" placeholder="이메일을 입력해주세요">
                                </div>
                                <br>
                                <label for="materialFormRegisterPasswordEx">성별을 선택하여주세요</label>
                                <br>
                                <div class="custom-control custom-radi">
                                    남성 <input type="radio" name="gender" class="custom-control-input" value="1" checked>
                                    여성 <input type="radio" name="gender" class="custom-control-input" value="2" >
                                 </div>
                                <br>
                                <div class="md-form">
                                    <i class="fa fa-lock prefix grey-text"></i>
                                    <input name="birth" class="form-control" placeholder="생년월일을 입력해주세요 ex) 19950803">
                                </div>
                                <br>
                                <div class="md-form">
                                    <i class="fa fa-lock prefix grey-text"></i>
                                    <input name="phone" class="form-control" placeholder="휴대폰번호를 입력해주세요 [' - '를 제외하고 입력해주세요.]">
                                </div>


                                <br></br>
                                <input type="button" class="btn btn-default" onclick="history.back()" value="이전으로">
                                <input type="submit" class="btn btn-default" value="회원가입 ">
                                <input type="button" class="btn btn-default" onclick="location.href='memberLogin.do'" value="로그인">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- <h2>회원가입</h2> -->
<!-- <form name ="frm" action="memberSignOk.do" method="post" onsubmit="return chkSubmit()">
이름 :
<input type="text" name="name"/><br>
id :
<input type="text" name="id"/>
<input type="button"  value="ID중복체크" onClick="confirmId()"/><br>
pw :
<input type="password" name="pw"/><br>
pw 확인 :
<input type="password" name="pwCheck"/><br> 
email :
<input type="text" name="email"/><br>
성별 : 
<input type="radio" name="gender" value="1" checked="checked"/>남자
<input type="radio" name="gender" value="2"/>여자<br>
생년월일 : 
<input type="text" name="birth"/> [ ex) 19950803 ]<br>
휴대폰 번호 : 
<input type="text" name="phone"/> [ "-"를 제외하고 입력해주세요. ]<br>
<input type="button" onclick="location.href='memberLogin.do'" value="로그인">
<input type="submit" value="회원가입"/>
</form> -->
</body>
</html>




















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet " href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css ">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js "></script>
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
   <br>
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <a href="index.do"><h2>ST_COUNNITY</h2></a>
                <br>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong> 로그인 또는 회원가입을 해주시기바랍니다.</strong>
                    </div>
                    <div class="panel-body">
                        <form name="frm" action="memberLoginOk.do" method="POST" onsubmit="return chkSubmit()">
                            <fieldset>
                                <div class="row">
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-10  col-md-offset-1 ">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                        <i class="glyphicon glyphicon-user"></i>
                                                    </span>
                                                <input class="form-control" placeholder="아이디" name="id" type="text" autofocus>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                        <i class="glyphicon glyphicon-lock"></i>
                                                    </span>
                                                <input class="form-control" placeholder="비밀번호" name="pw" type="password">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-lg btn-primary btn-block" value="로그인">
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    <div class="panel-footer ">
                        ID가없으신가요 ? <a href="memberSignUp.do"> 회원가입 </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
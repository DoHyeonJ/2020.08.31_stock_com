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
        <div class="row">
            <div class="col-xs-12">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="index.do">ST_COMMUNITY
                            </a>
                        </div>
                        <h4 class="navbar-text navbar-right">
                            <a href="boardList.do" class="text-primary">NoticeBoard</a>&nbsp;&nbsp;&nbsp;
                        </h4>
                        <%if(session.getAttribute("id")==null){%>
                        <h4 class="navbar-text navbar-right">Signed in as&nbsp;
                            <a href="memberSignUp.do" class="text-primary">SignUp </a>&nbsp;&nbsp;|&nbsp;
                        </h4>
                        <%}else {%>
                        <h4 class="navbar-text navbar-right">Signed out as&nbsp;
                            <a href="memberLogout.do" class="text-primary">Logout </a>&nbsp;&nbsp;|&nbsp;
                        </h4>
                        <%}	%>
                    </div>
                </nav>
                <br></br>
                <div style="text-align: center;">
                <br><br><br><br><br><br><br><br><br>
                <%if(session.getAttribute("id")==null){%>
                <a href="memberLogin.do">
				<img alt="login" src="icon/login.png" style="width: 15%">      
				</a>
				<h2>LOGIN</h2>
				<%}else {%>
				<a href="memberLogout.do">
				<img alt="login" src="icon/login.png" style="width: 15%">      
				</a>
				<h2>LOGOUT</h2>
				<%}	%>
                </div>
                <footer class="container-fluid navbar-fixed-bottom" style="border-top: 1px solid #e5e5e5">
                <br></br>
                <div class="text-center">
       <a href="https://github.com/DoHyeonJ/2020.08.31_stock_com">
       		<img alt="img-github" src="icon/github.png" width="50">
       </a>
       		<h3>Copyright 2020.&nbsp;<small>DoHyeon All rights reserved.</small></h3>
    			</div>
				</footer>
            </div>
        </div>
    </div>
</body>
</html>





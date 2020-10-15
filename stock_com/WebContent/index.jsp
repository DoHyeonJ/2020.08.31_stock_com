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
    <div class="container ">
        <div class="row ">
            <div class="col-xs-12 ">
                <nav class="navbar navbar-default ">
                    <div class="container-fluid ">
                        <div class="navbar-header ">
                            <a class="navbar-brand " href="index.do ">ST_COMMUNITY
                            </a>
                        </div>
                        <%if(session.getAttribute("id")==null){%>
                        <h4 class="navbar-text navbar-right ">Signed in as&nbsp;
                            <a href="memberLogin.do " class="text-primary">Login</a>&nbsp;&nbsp;&nbsp;
                        </h4>
                        <%}else {%>
                        <h4 class="navbar-text navbar-right ">Signed out as&nbsp;
                            <a href="memberLogout.do " class="text-primary">Logout</a>&nbsp;&nbsp;&nbsp;
                        </h4>
                        <%}	%>
                    </div>
                </nav>
            </div>
        </div>
    <a href="boardList.do">게시판</a>
    </div>
</body>
</html>





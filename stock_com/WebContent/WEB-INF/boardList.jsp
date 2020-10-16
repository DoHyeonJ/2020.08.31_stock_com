<%@page import="DTO.Board_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%-- jstl 지시자 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Board_DTO [] arr = (Board_DTO [] )request.getAttribute("list");

	String seId = (String)session.getAttribute("id");
	
%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet " href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css ">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js "></script>
<title>게시글 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
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
<body>
    <div class="container">
    <br></br>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <h4>자유 게시판</h4>
            </div>
            <div class="panel-body">
                <p>양식 제한없이 자유롭게 글을 작성해주시면 됩니다.</p>
                <div class="navbar-right" >
                    <div class="row">
                        <div class="col-lg-5">
                          <div class="input-group">
                          </div><!-- /input-group -->
                        </div><!-- /.col-lg-6 -->
                      </div><!-- /.row -->
                </div>
            </div>
            <!-- Table -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col"  style="width: 5%" >
                            Bno.
                        </th>
                        <th scope="col"  style="width: 15%">
                            Writer
                        </th>
                        <th scope="col"  style="width: 60%">
                            Title
                        </th>
                        <th scope="col"  style="width: 15%">
                            RegDate
                        </th>
                        <th scope="col"  style="width: 5%">
                            ViewCnt
                        </th>
                    </tr>


                </thead>
                <tbody>
<%
                for(int i=0; i < arr.length; i++){
            out.println("<tr>");
            out.println("<th scope='row'>" + arr[i].getBoard_uid() + "</td>");
			out.println("<td>" + arr[i].getBoard_id() + "</td>");
			out.println("<td><a href='boardView.do?uid=" + arr[i].getBoard_uid() + "'>" + arr[i].getBoard_title() + "</a></td>");
			out.println("<td>" + arr[i].getBoard_date() + "</td>");
			out.println("<td>" + arr[i].getBoard_viewcnt() + "</td>");
			out.println("</tr>");
			}
%>
                </tbody>
            </table>
        </div>
        <!-- pagination -->
        <nav class="nav nav-pills">
        <%-- id세션값이 넘어온 경우 로그인,회원가입 버튼 없애주기 (로그인됬을때 보여줄 창들) --%>
         <%if(seId==null){%>
            <input type="button" class="btn btn-default" onclick="location.href='index.do'" value="메인으로">
            <input type="button" class="btn btn-default" onclick="location.href='memberLogin.do'" value="로그인">
            <input type="button" class="btn btn-default" onclick="location.href='memberSignUp.do'" value="회원가입">
             <%}else{ %>
            <input type="button" class="btn btn-default" onclick="location.href='index.do'" value="메인으로">
            <input type="button" class="btn btn-default" onclick="location.href='boardWrite.do'" value="새 글쓰기">
            <input type="button" class="btn btn-default" onclick="logOut()" value="로그아웃">
            <%} %>
            <ul class="pagination navbar-right">
       		<jsp:include page="pagination.jsp">
			<jsp:param value="${writePages}" name="writePages"/>
			<jsp:param value="${totalPage}" name="totalPage"/>
			<jsp:param value="${page}" name="curPage"/>
			</jsp:include>
            </ul>
          </nav>
    </div> <!-- container end -->

</body>
</html>










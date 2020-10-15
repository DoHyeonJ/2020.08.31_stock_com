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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet " href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css ">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js "></script>
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
<br></br>
    <div class="container">
        <div class="nav nav-tabs">
                <h2>게시글 쓰기</h2>
        </div>
        <br>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <h4>자유 게시판</h4>
            </div>
            <!-- Table -->
            <table class="table table-bordered">
                <tbody>
                <%--내용과 제목만 수정가능. submit 하기전에 검증 --%>
				<form name= "frm" action="boardUpdateOk.do" method="post" onsubmit="return chkSubmit()">   
				<input type="hidden" name="uid" value="<%= uid%>"/>
                    <tr>
                        <th scope="row" style="width: 10%">제목</th>
                        <div class="col-sm-5">
                            <td>
                                <input type="text" class="form-control" name="title" value="<%=title%>">
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td>
                            <textarea rows="25" class="form-control col-sm-5" name="content" ><%= content %></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            <!-- pagination -->
        </div>
        <nav class="nav nav-pills">
            <ul class="pagination navbar-right">
              <li>
                <input type="button" class="btn btn-default" onclick="location.href = 'boardList.do'" value="글목록">
                <input type="button" class="btn btn-default" onclick="history.back()" value="이전으로">
              </li>
              <li>
                <input type="submit" class="btn btn-default" value="등록">
              </li>
            </ul>
          </nav>
          </form>
     </div> <!-- container end -->
</body>
</html>












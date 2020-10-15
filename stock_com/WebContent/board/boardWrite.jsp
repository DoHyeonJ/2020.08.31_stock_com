<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Member_DTO"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet " href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css ">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js "></script>
<title>글쓰기</title>
</head>
<script>
// form 검증 [게시글 제목을 공백으로 하였는지 Check]
function chkSubmit(){
	frm = document.forms["frm"];
	
	var title = frm["title"].value.trim();
	
	if(title == ""){
		alert("제목을 작성하여 주세요.")
		frm["title"].focus();
		return false;
	}
	
	return true
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
				<form name= "frm" action="boardWriteOk.do" method="post" onsubmit="return chkSubmit()">   
				<input type="hidden" name="id" value="<%=id%>">          
                    <tr>
                        <th scope="row" style="width: 10%">제목</th>
                        <div class="col-sm-5">
                            <td>
                                <input type="text" class="form-control" name="title" >
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td>
                            <textarea rows="25" class="form-control col-sm-5" name="content" ></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            <!-- pagination -->
        </div>
        <nav class="nav nav-pills">
            <ul class="pagination navbar-right">
              <li>
                <input type="button" class="btn btn-default" onclick="location.href='boardList.do'" value="글목록">
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














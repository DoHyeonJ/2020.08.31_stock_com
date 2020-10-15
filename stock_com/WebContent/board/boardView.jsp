<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//Controller 로부터 결과 데이터를 받아옴
	Board_DTO [] arr = (Board_DTO []) request.getAttribute("list");
	Comment_DTO [] comArr = (Comment_DTO []) request.getAttribute("comList");
	
	String seId = null;
	
	//세션값 id 받아와서 seId 변수에 저장
	try{
	Object oJseId = session.getAttribute("id");
	seId = (String)oJseId;		
	}catch (Exception e){
		e.printStackTrace();
	}
	
%>    

<% if(arr == null || arr.length == 0){ %>
		<script>
			alert("존재하지 않는 게시글 입니다.")
			history.back();
		</script>
<%
		return;
	}
%>
<%
	//게시글 변수
	int uid = arr[0].getBoard_uid();
	String id = arr[0].getBoard_id();
	String title = arr[0].getBoard_title();
	String content = arr[0].getBoard_content();
	String date = arr[0].getBoard_date();
	int viewCnt = arr[0].getBoard_viewcnt();
	
	//댓글변수 초기화
	int comUid = 0;
	int comBoardUid = 0;
	String comId = "";
	String comContent = "";
	String comDate = "";
	int comChk = 0;
	
	//댓글값이 들어와있을경우 배열값 대입 배열의길이만큼 출력
	if(comArr != null && comArr.length !=0){
		comUid = comArr[0].getComment_uid();
		comBoardUid = comArr[0].getComment_boardUid();
		comId = comArr[0].getComment_id();
		comContent = comArr[0].getComment_content();
		comDate = comArr[0].getComment_date();		
	}
%>
<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet " href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css ">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js "></script>
<title>읽기 <%= title %></title>
</head>
<script>
//최초 1회만 새로고침(댓글삭제시에 새로고침필요)
if (self.name != 'reload') {
    self.name = 'reload';
    self.location.reload(true);
} else self.name = '';

// 삭제 여부 확인
function chkDelete(uid){
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'boardDeleteOk.do?uid=' + uid;
	}
	
}
// 댓글삭제 여부 확인
function comChkDelete(uid){
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href ="commentDeleteOk.do?uid=" + uid;
	}
	
}
//form 검증 [게시글 제목을 공백으로 하였는지 Check]
function chkSubmit(){
	frm = document.forms["frm"];
	
	var content = frm["content"].value.trim();
	
	if(content == ""){
		alert("내용을 작성하여 주세요.")
		frm["content"].focus();
		return false;
	}
	
	return true
}
</script>
<body>
<br></br>
    <div class="container">
        <div class="nav nav-tabs">
                <h2><%= title %></h2>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4>자유 게시판</h4>
            </div>
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        
                        <th scope="row" style="width: 10%">글 내용</th>
                        <div class="col-sm-5">
                        <td>
                          	 <%= content %>
                        </td>
                        </div>
                    </tr>
                    <tr>
                        <th scope="row">작성자</th>
                        <td><%= id %></td>
                    </tr>
                    <tr>
                        <th scope="row">작성일</th>
                        <td><%= date %></td>
                    </tr>
                     <tr>
                        <th scope="row">조회수</th>
                        <td><%= viewCnt %></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <nav class="nav nav-pills">
            <input type="button" class="btn btn-default" onclick="location.href='index.do'" value="메인으로">
            <ul class="pagination navbar-right">
              <li>
                <input type="button" class="btn btn-default" onclick="location.href='boardList.do'" value="글목록">
              </li>
              <%-- 세션값과 현재보고있는 글의 id값이 일치할때 수정하기, 삭제하기 권한부여 예외사항 발생할 수 있기때문에 try catch 문 사용  ex)로그인안하고 게시글볼때 예외발생 --%>
<%if(id.equals(seId)){%>
              <li>
                <input type="button" class="btn btn-default" onclick="location.href='boardUpdate.do?uid=<%=uid%>'" value="수정">
              </li>
              <li>
                <input type="button" class="btn btn-default" onclick="chkDelete(<%=uid%>)" value="삭제">
              </li>        		  
              <%}%>       	  
            </ul>
          </nav>
          <div class="comment">
            <div class="nav nav-tabs">
                <h3>Comment</h3>
            </div>
            <br>
                     <form name="frm" action="commentWriteOk.do" method="post" onsubmit="return chkSubmit()">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="input-group">
						<input type="hidden" name="boardUid" value="<%=uid%>">
						<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
                        <input type="text" class="form-control" name="content" placeholder="댓글을 작성할 수 있습니다.">
                       <span class="input-group-btn">
                        <button type="submit" class="btn btn-default">등록</button>
                       </span>
                    </div>
                </div>
            </div>
                     </form>     
<%if (comDate != "") {
	for(int i=0; i < comArr.length; i++){%>
            <div class="panel panel-default">
                <div class="panel-heading"><%out.print(comArr[i].getComment_id());%></div>
                <div class="panel-body">
                <%out.print(comArr[i].getComment_content());%>
                <%if(comArr[i].getComment_id().equals(seId)){%>
                  <input type="button" class="btn btn-default navbar-right" onclick="comChkDelete(<%out.print(comArr[i].getComment_uid());%>)" value="댓글삭제">
                <%} %>
                </div>
            </div>
<%}
}%>
     </div>
    </div><!-- container end -->
</body>
</html>
























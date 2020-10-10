<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//Controller 로부터 결과 데이터를 받아옴
	Board_DTO [] arr = (Board_DTO []) request.getAttribute("list");
	Comment_DTO [] comArr = (Comment_DTO []) request.getAttribute("comList");
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
		location.href = 'commentDeleteOk.do?uid=' + uid;
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
<h2>읽기 <%= title %></h2>
<br>
작성자명 : <%= id %><br>
제목 : <%= title %><br>
등록일 : <%= date %><br>
조회수 : <%= viewCnt %><br>
내용 : <br>
<% out.println(session.getAttribute("id")); %>
<hr>
<div>
<%= content %>
</div>
<hr>
<br>
<%-- 댓글이 존재할때만 댓글을 view단에 보여줌 --%>
<%if (comDate != "") {%> 
		<%for(int i=0; i < comArr.length; i++){
			out.println("<td>" + comArr[i].getComment_id() + "</td>");
			out.println("<td>" + comArr[i].getComment_content() + "</td>");
			out.println("<td>" + comArr[i].getComment_date() + "</td>");
			out.println("<td>" + "<button onClick = comChkDelete("+comArr[i].getComment_uid()+")>삭제</button>");
			out.println("</br>");%>
<%} 
}%>
<form name="frm" action="commentWriteOk.do" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="boardUid" value="<%=uid %>">
<input type="hidden" name="id" value="<%=id %>">
<textarea name="content"></textarea>
<input type="submit" value="등록"/>
</form>
<a></a>
<%-- 세션값과 현재보고있는 글의 id값이 일치할때 수정하기, 삭제하기 권한부여 --%>
<%if(session.getAttribute("id").equals(id)){%>
<button onClick="location.href = 'boardUpdate.do?uid=<%=uid%>'">수정하기</button>
<button onClick="chkDelete(<%=uid%>)">삭제하기</button>
<%}%>
<button onClick="location.href = 'boardList.do'">목록보기</button>
<button onClick="location.href = 'boardWrite.do'">신규등록</button>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
























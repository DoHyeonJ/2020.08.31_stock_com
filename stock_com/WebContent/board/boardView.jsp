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
	
	//댓글값이 들어와있을경우 배열값 대입
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
function chkDelete(id){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'boardDeleteOk.do?uid=' + id;
	}
	
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
<hr>
<div>
<%= content %>
</div>
<hr>
<br>
<%-- 댓글이 존재할때만 댓글을 view단에 보여줌 --%>
<%if (comDate != "") {%> 
	댓글 uid : <%=comUid %><br>
	댓글 게시글 uid : <%=comBoardUid %><br>
	댓글 id : <%=comId %><br>
	댓글 내용 : <%=comContent %><br>
	댓글 날짜 : <%=comDate %><br>
<%} %>
<%-- 세션값과 현재보고있는 글의 id값이 일치할때 수정하기, 삭제하기 권한부여 --%>
<%if(session.getAttribute("id").equals(id)){%>
<button onclick="location.href = 'boardUpdate.do?uid=<%= uid%>'">수정하기</button>
<button onclick="chkDelete(<%= uid%>)">삭제하기</button>
<%} %>
<button onclick="location.href = 'boardList.do'">목록보기</button>
<button onclick="location.href = 'boardWrite.do'">신규등록</button>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
























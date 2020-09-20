<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	//Controller 로부터 결과 데이터를 받아옴
	St_DTO [] arr = (St_DTO []) request.getAttribute("list");
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
	int uid = arr[0].getBoard_uid();
	String title = arr[0].getBoard_title();
	String content = arr[0].getBoard_content();
	String date = arr[0].getBoard_date();
	int viewCnt = arr[0].getBoard_viewcnt();
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
id : <%= uid %><br>
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
<button onclick="location.href = 'boardUpdate.do?uid=<%= uid%>'">수정하기</button>
<button onclick="location.href = 'boardList.do'">목록보기</button>
<button onclick="chkDelete(<%= uid%>)">삭제하기</button>
<button onclick="location.href = 'boardWrite.do'">신규등록</button>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
























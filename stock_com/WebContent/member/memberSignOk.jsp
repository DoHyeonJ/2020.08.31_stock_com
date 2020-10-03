<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//Controller로부터 결과를 받아옴.
	int cnt = (Integer)request.getAttribute("result");
%>

<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<% if(cnt == 0){ %>
	<script>
		alert("회원가입 실패!! 다시 시도해 주세요.");
		history.back();
	</script>
<%} else { %>
	<script>
		alert("회원가입 성공!!");
		<%-- 메인페이지 넣어주기 --%>
		location.href = "boardList.do";
	</script>
<% } %>
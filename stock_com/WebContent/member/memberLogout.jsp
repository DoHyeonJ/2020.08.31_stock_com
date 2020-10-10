<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 로그아웃 버튼 눌렀을 시 세션 제거 밑 index 페이지로 이동 --%>
<%
	session.invalidate();
%>
<script>
	location.href="index.do"
</script>
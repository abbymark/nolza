<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
header.jsp<br>
	
	<c:if test="${mem_id==null }">
		<a href="/nolza/mem_login.do" style="text-decoration: none;">로그인</a>
	</c:if>
	<c:if test="${mem_id!=null }">
		${mem_nick }님 환영합니다.
		<a href="/nolza/mem_logout.do" style="text-decoration: none;">로그아웃</a>
	</c:if>
	<a href="/nolza/main.do" style="text-decoration: none;">메인으로</a>
	<a href="/nolza/book_list.do" style="text-decoration: none;">게시판</a>
	<a href="/nolza/mem_insertForm.do" style="text-decoration: none;">회원가입</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm.jsp</title>
<style type="text/css">
body{background-color: #7fffd4;}
table{margin:auto; 
	line-height:25px;}
</style>
</head>
<body>


<div class="text-center"><h2>글쓰기</h2></div>
	<form method="post" name="camja_writeForm" action="camja_writePro.do">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="camja_no" value="${camja_no}">
		<input type="hidden" name="camja_group" value="${camja_group}">
		<input type="hidden" name="camja_step" value="${camja_step}">
		<input type="hidden" name="camja_indent" value="${camja_indent}">
	
	<table border="1">
		<tr>
			<td colspan="2" align="right">
				<a href="camja_list.do">리스트</a>
			</td>
		</tr>
		
		<tr>
			<td>작성자</td>
			<td><input type="text" name="mem_nick" size="30" value="${CamjaBoardDTO.mem_nick}"></td>
		</tr>		
		<tr>
			<td>글제목</td>
			<td>
			<c:if test="${camja_no ==0}">
			<input type="text" name="camja_title" size="30">
			</c:if>
			
			<c:if test="${camja_no !=0}">
			<input type="text" name="camja_title" size="30" value="[답변]">
			</c:if>		
			</td>
		</tr>		
		
		<tr>
			<td>글내용</td>
			<td><textarea name="camja_content" rows="10" cols="60"></textarea></td>
		</tr>		
		
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="글쓰기">
			<input type="reset" value="다시작성">
			<input type="button" value="글목록보기" onclick="documemt.location.href='camja_list.do'">
			</td>
		</tr>
		
	</table>
	</form>
	
</body>
</html>
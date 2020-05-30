<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>updateForm.jsp</title>
		<style type="text/css">
			body{background-color:white;}
			table{margin:auto; line-height:25px; width:70%;}
		</style>
		
		<script  src="//code.jquery.com/jquery-3.2.1.min.js">
		</script>
		
</head>
<body>
	<center><h2>글수정</h2></center>
	<form method="post" name="fb_writeForm" action="fb_updatePro.do?pageNum=${pageNum }">
		
		<table border="1">
		
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mem_id" id="mem_id" size="30" value="${dto.mem_id}"></td>
				<td><input type="hidden" name="fb_no" value="${dto.fb_no }"></td>
			</tr>


			<tr>
				<td>글제목</td>
				<td><input type="text" name="fb_title" id="fb_title" size="30" value="${dto.fb_title}"></td>
			</tr>

			<tr>
				<td>글내용</td>
				<td>
				<textarea name="fb_content" id="fb_content" rows="10" cols="60">${dto.fb_content }</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록" onClick="document.location.href='list.do?pageNum=${pageNum}'">
				</td>
			</tr>
		
		
		</table>
		
	</form>
	
</body>
</html>
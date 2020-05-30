<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>updateForm.jsp</title>
		<style>
		body{background-color: #ffffcc;}
		table{margin:auto; line-height: 25px; width:"70%"}
		</style>
		
		<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>
		
		<script type="text/javascript">
		function check(){
			if($('#cam_title').val()==''){
				alert("제목을 입력하세요");
				$('#cam_title').focus();
				return false;
			}
			if($('#cam_content').val()==''){
				alert("내용을 입력하세요");
				$('#cam_content').focus();
				return false;
			}
			return true;
		}
		</script>
</head>
<body>
<center><h2>글수정</h2></center>
<form method="post" name="cam_writeForm" action="cam_updatePro.do?pageNum=${pageNum}">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td>
			<input type="text" name="cam_id" id="cam_id" size="30" value="${dto.cam_id}">
			<input type="hidden" name="cam_no" value="${dto.cam_no}">
			</td>
		</tr>
		
		<tr>
			<td>글제목</td>
			<td><input type="text" name="cam_title" id="cam_title" size="30" value="${dto.cam_title}"></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea name="cam_content" id="cam_content" rows="10" cols="60">${dto.cam_content}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록" onclick="document.location.href='cam_list.do?pageNum=${pageNum}'">
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>
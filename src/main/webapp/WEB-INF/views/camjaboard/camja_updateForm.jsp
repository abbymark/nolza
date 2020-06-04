<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>camja_updateForm.jsp</title>
		
		
		<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>
		
		<script type="text/javascript">
		function check(){
			if($('#camja_title').val()==''){
				alert("제목을 입력하세요");
				$('#camja_title').focus();
				return false;
			}
			if($('#camja_content').val()==''){
				alert("내용을 입력하세요");
				$('#camja_content').focus();
				return false;
			}
			return true;
		}
		</script>
</head>
<body>
<div class="container list"><h2>자유게시판 글수정</h2></div>
<form method="post" name="camja_writeForm" action="camja_updatePro.do?pageNum=${pageNum}">
	<table class="table">
		<tr>
			<td>작성자</td>
			<td>
			<input type="text" name="mem_nick" id="mem_nick" size="30" value="${dto.mem_nick}">
			<input type="hidden" name="camja_no" value="${dto.camja_no}">
			</td>
		</tr>
		
		<tr>
			<td>글제목</td>
			<td><input type="text" name="camja_title" id="camja_title" size="30" value="${dto.camja_title}"></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea name="camja_content" id="camja_content" rows="10" cols="60">${dto.camja_content}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록" onclick="document.location.href='camja_list.do?pageNum=${pageNum}'">
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>
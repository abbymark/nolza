<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateForm.jsp</title>
	<style type="text/css">
		body {background-color:#ffffcc;}
		table{margin:auto; line-height:25px; width:70%;}
	
	</style>
	
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<script type="text/javascript">
		function check(){
			if($('id').val()==''){
				alert("이름을 입력하시오");
				$('id').focus();
				return false;
			}
			return true;
		}
	</script>

</head>
<body>
	<center><h2>글수정</h2></center>
	<form method="post" name="mat_writeForm" action="updatePro?pageNum=${pageNum}" onsubmit="return check()">
		
		<table border="1">
			<tr>
				<td>이름</td>
				<td>
				<input type="text" name="id" id="id" size="30" value="${dto.id}">
				<input type="hidden" name="no" id="no" value="${dto.no}">
				</td>
			</tr>
			
			<tr>
				<td>글제목</td>
				<td><input type="text" name="title" id="title" size="30" value="${dto.title}"></td>
			</tr>
			
			<tr>
				<td>글내용</td>
				<td><textArea name="content" id="content" rows="10" cols="60">${dto.content}</textArea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록보기" onClick="document.location.href='mat_list?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
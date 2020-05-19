<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	function check(){
		if($('#mem_id').val()==''){
			alert("이름을 입력 하세요");
			$("#writer").focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<center><h2>글수정</h2></center>
	<form method="post" name="book_writeForm" action="book_updatePro.do?pageNum=${pageNum}" onsubmit="return check()">
		<table border="1">
		
			<tr>
				<td>이름</td>
				<td>
					${mem_nick }
					<input type="hidden" name="mem_id" id="mem_id" size="30" value="${mem_id }">
					<input type="hidden" name="book_no" value="${book_dto.book_no }">
				</td>
			</tr>
			
			<tr>
				<td>글 종류</td>
				<td>
					<select name="book_type" id="book_type">
						<option value="${book_dto.book_type }">${book_dto.book_type }</option>
						<option value="자유게시판">자유게시판</option>
						<option value="비소설 추천">비소설 추천</option>
						<option value="소설 추천">소설 추천</option>
						<option value="독서 모임">독서 모임</option>
						<option value="토론">토론</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>글제목</td>
				<td><input type="text" name="book_title" id="book_title" size="30" value="${book_dto.book_title }"></td>
			</tr>
			
			<tr>
				<td>글내용</td>
				<td>
					<textarea name="book_content" id="book_content" rows="10" cols="60">${book_dto.book_content }</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록" onclick="document.location.href='book_list.do?pageNum=${pageNum}'">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>
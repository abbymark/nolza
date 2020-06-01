<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: auto;
	line-height: 25px;
}
</style>

</head>
<body>
	<center>
		<h2>글쓰기</h2>
	</center>
	
	<form method="post" name="mat_writeForm" action="writePro">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<!-- BoardController에 writeForm 메서드  -->
		<input type="hidden" name="no" value="${no}"> 
		<input type="hidden" name="ggroup" value="${ggroup}"> 
		<input type="hidden" name="step" value="${step}"> 
		<input type="hidden" name="indent" value="${indent}">

		<table border="1">
			<tr>
				<td colspan="2" align="right"><a href="mat_list">리스트</a></td>
			</tr>

			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" name="mem_nick" size="30" readonly=TRUE value="${mem_nick}">
					<input type="hidden" name="mem_id" size="30" value="${mem_id}">
				</td>
				
			</tr>

			<tr>
				<td>글제목</td>
				<td>
					<c:if test="${no==0}">
						<input type="text" name="title" size="30">
					</c:if> 
					
					<c:if test="${no!=0}">
						<input type="text" name="title" size="30" value="[답변]">
					</c:if>
				</td>
			</tr>

			<tr>
				<td>글내용</td>
				<td><textArea name="content" rows="10" cols="60"></textArea>
			</tr>
		
			<tr>
				<td colspan="2" align="center"><input type="submit" value="글쓰기">
					<input type="reset" value="다시작성"> <input type="button"
					value="글목록 보기" onClick="document.location.href='mat_list'">
				</td>
			</tr>

		</table>
	</form>
</body>
</html>
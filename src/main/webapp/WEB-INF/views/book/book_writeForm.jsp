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
	<center><h2></h2></center>
	<form method="post" name="book_writeForm" action="book_writePro.do">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="book_no" value="${book_no }">
		<input type="hidden" name="book_group" value="${book_group }">
		<input type="hidden" name="book_step" value="${book_step }">
		<input type="hidden" name="book_indent" value="${book_indent }">
		
		<table border="1">
			<tr>
				<td colspan="2" align="right">
					<a href="book_list.do">리스트</a>
				</td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="book_id" size="30">
				</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>
					<c:if test="${book_no==0 }">
						<input type="text" name="book_title" size="30">
					</c:if>
					
					<c:if test="${book_no != 0 }">
						<input type="text" name="book_title" size="30" value="[답변]">
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td>글 종류</td>
				<c:set var="book_type" value="${book_type }"/>
				<c:choose>
					<c:when test="${book_type eq 'free'}">
						<c:set var="book_type" value="자유게시판"/>
					</c:when>
					<c:when test="${book_type eq 'recommendNonFiction'}">
					 	<c:set var="book_type" value="비소설 추천"/>
					</c:when>
					<c:when test="${book_type eq 'recommendFiction'}">
					 	<c:set var="book_type" value="소설 추천"/>
					</c:when>
					<c:when test="${book_type eq 'readingGroup'}">
					 	<c:set var="book_type" value="독서 모임"/>
					</c:when>
					<c:when test="${book_type eq 'debate'}">
					 	<c:set var="book_type" value="토론"/>
					</c:when>
				</c:choose>
				<td>
					<select name="book_type" id="book_type">
						<option value="${book_type }">${book_type }</option>
						<option value="자유게시판">자유게시판</option>
						<option value="비소설 추천">비소설 추천</option>
						<option value="소설 추천">소설 추천</option>
						<option value="독서 모임">독서 모임</option>
						<option value="토론">토론</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>글내용</td>
				<td>
					<textarea name="book_content" rows="10" cols="60"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록보기" onclick="document.location.href='book_list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>



















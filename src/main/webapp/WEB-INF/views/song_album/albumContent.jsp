<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctxpath" value="<%=request.getContextPath()%>"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-8">				
				<p><img src="${ctxpath }/resources/imgUpload/${dto.a_picture}" style="max-width:300px; max-height:300px" ></p>
				<br>
				<h1 class="mt-4">${dto.a_title}</h1>
				<br>
				
				<p class="lead">아티스트 &emsp;${dto.a_artist}</p>
				<p class="lead">장르/스타일 &emsp;${dto.a_style}</p>
				<p class="lead">발매사 &emsp;${dto.a_sales}</p>
				<p class="lead">기획사 &emsp;${dto.a_manage}</p>
				<p class="lead">발매일 &emsp;${dto.a_date}</p>
				<hr>
				<p class="lead">앨범소개</p>
				<h3>${dto.a_content}</h3>
				<hr>
				
			</div>
			
			<table class="table">
				<blockquote class="blockquote">
					<h4 class="mt-4">조회</h4>
					<p>${dto.a_readcount}</p>
					<h4 class="mt-4">작성일</h4>
					<p><fmt:formatDate value="${dto.date}" pattern="yyyy-MM-dd HH:mm:ss" /></p><hr>
					<p class="lead">타이틀곡</p>
					<h3>${dto.a_main}</h3>
				</blockquote>
			</table>
			
			<tr>
				<td colspan="4" align="center">
				<c:if test="${sessionScope.mem_grade=='admin'}">
					<input type="button" value="글수정" onclick="document.location.href='albumUpdateForm.do?a_no=${dto.a_no}&pageNum=${pageNum}'">
					<input type="button" value="글삭제" onclick="document.location.href='deletealbum.do?a_no=${dto.a_no}&pageNum=${pageNum}'">
					<input type="button" value="글쓰기" onclick="document.location.href='albumWriteForm.do'">
				</c:if>			
				<input type="button" value="글목록" onclick="document.location.href='albumMainList.do?pageNum=${pageNum}'">
				</td>
			</tr>
		</div>
	</div>
</body>
</html>
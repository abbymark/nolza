<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<p><img src="${ctxpath }/resources/imgUpload/${dto.ss_picture}" style="max-width:300px; max-height:300px"></p>
				<br>
				<h1 class="mt-4">${dto.ss_artist}</h1>
				<br>
				
				<p class="lead">활동유형&emsp;${dto.ss_style}</p>
				<p class="lead">활동연대&emsp;${dto.ss_active}</p>
				<p class="lead">데뷔&emsp;${dto.ss_date}</p>
				<p class="lead">국적&emsp;${dto.ss_nation}</p>
				<p class="lead">멤버&emsp;${dto.ss_person}</p>
				<p class="lead">데뷔곡&emsp;${dto.ss_title}</p>
				<p class="lead">소속사&emsp;${dto.ss_manage}</p>
				<hr>

			</div>
			
			<table class="table">
				<blockquote class="blockquote">
					<h4 class="mt-4">조회</h4>
					<p>${dto.ss_readcount}</p>
					<hr>
					
					<p class="lead">아티스트 소개</p>
					<h3>${dto.ss_content}</h3>
					<hr>
				</blockquote>
			</table>
			
			<tr>
				<td colspan="4" align="center">
				<c:if test="${sessionScope.mem_grade=='admin' }">
					<input type="button" value="글수정" onclick="document.location.href='singerUpdateForm.do?ss_no=${dto.ss_no}&pageNum=${pageNum}'">
					<input type="button" value="글삭제" onclick="document.location.href='deletesinger.do?ss_no=${dto.ss_no}&pageNum=${pageNum}'">
					<input type="button" value="글쓰기" onclick="document.location.href='singerWriteForm.do'">
				</c:if>
				<input type="button" value="글목록" onclick="document.location.href='singerMainList.do?pageNum=${pageNum}'">
				</td>
				
			</tr>
		</div>
	</div>
</body>
</html>
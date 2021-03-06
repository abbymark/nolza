<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<h1 class="mt-4">${dto.n_title}</h1>
				<p class="lead">by <cite title="Source Title">${dto.mem_id}</cite></p>
				<hr>

				<p><fmt:formatDate value="${dto.n_date}" pattern="yyyy-MM-dd hh:mm:ss" /></p>
				<hr>

				<p class="lead">${dto.n_content}</p>
				<hr>
			</div>
			
			<table class="table">
				<blockquote class="blockquote">
					<h4 class="mt-4">글머리</h4>
					<p class="mb-0">${dto.n_type}</p><hr>
					<h4 class="mt-4">글번호</h4>
					<p class="mb-0">${dto.n_no}</p><hr>
					<h4 class="mt-4">조회</h4>
					<p class="mb-0">${dto.n_readcount}</p>
				</blockquote>
			</table>
			
			<tr>
				<td colspan="4" align="center">
					<c:if test="${sessionScope.mem_grade=='admin' }">
						<input type="button" value="글수정" onclick="document.location.href='noticeUpdateForm.do?n_no=${dto.n_no}&pageNum=${pageNum}'">
						<input type="button" value="글삭제" onclick="document.location.href='noticeDelete.do?n_no=${dto.n_no}&pageNum=${pageNum}'">
						<input type="button" value="글쓰기" onclick="document.location.href='noticeWriteForm.do'">
					</c:if>
					<input type="button" value="글목록" onclick="document.location.href='nmainList.do?pageNum=${pageNum}'">
				</td>
				
				
			</tr>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 리스트</title>

</head>
<body>
	<h2>
		<center>회원 리스트</center>
	</h2>

<!-- 스타일 시트 적용 -->

	<!-- 본문 -->

	<table>


		<thead>
			<tr>
				<th id="no">아이디</th>
				<th id="head">닉네임</th>
				<th id="title">비밀번호</th>
				<th id="nick">이메일</th>
				<th id="date">회원 등급</th>
				<th id="date">글 개수</th>
				<th id="read">댓글 갯수</th>
				<th id="like">로그인 횟수</th>
				<th id="like">수정</th>
			</tr>
		</thead>

		<tbody>

			<!-- 내용 -->
			<c:forEach var="dto" items="${selectList}">
				<tr>
					<td>${dto.mem_id}</td>

					<td>${dto.mem_nick}</td>

					<td>${dto.mem_pw}</td>

					<td>${dto.mem_email}</td>

					<td>${dto.mem_grade}</td>

					<td>${dto.mem_article_cnt}</td>

					<td>${dto.mem_reply_cnt}</td>

					<td>${dto.mem_login_cnt}</td>

					<td><input type="button"
						onclick="document.location.href='admin_updateForm?mem_id=${dto.mem_id}'"
						value="수정"></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>


	<table class="button">

	<tr align="center">
			<td >
				<c:if test="${count>0 }">
					<%--이전페이지 --%>
					<c:if test="${startPage > 10 }">
						<a href="admin_list?pageNum=${startPage-10}">[이전]</a>
					</c:if>

					<%--페이지처리 --%>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="admin_list?pageNum=${i}">[${i}]</a>
					</c:forEach>

					<%--다음 페이지 --%>
					<c:if test="${endPage < pageCount }">
						<a href="admin_list?pageNum=${startPage+10}">[다음]</a>
					</c:if>
				</c:if>
			</td>
		</tr>
</table>

</body>
</html>

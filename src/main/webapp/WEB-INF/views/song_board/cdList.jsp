<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	
</head>
<body>
	<center><h2>음반게시판</h2></center>
	<div class="container">
		<table class="table">
		
		<div>
			<ul class="nav nav-tabs">
				<li><a href="list.do">전체</a>||		</li>
				<li><a href="noList.do">일반</a>||	</li>
				<li><a href="songList.do">음원</a>|| </li>
				<li><a href="cdList.do">음반</a>||  	</li>
				<li><a href="chartList.do">차트</a>||	</li>
				<li><a href="comeList.do">컴백</a>||	</li>
				<li><a href="etcList.do">기타</a>		</li>
			</ul>
			
			<tr align="right">
				<c:if test="${sessionScope.mem_id!=null||sessionScope.mem_grade=='admin' }">
					<td><input type="button" value="글쓰기" onclick="document.location.href='writeForm.do'"></td>
				</c:if>
			</tr>
		</div>

		<tr>
			<td>
				<c:if test="${count==0 }">
      				저장된 글이 없습니다
     			</c:if>
     			<c:if test="${count>0 }">
					<table class="table">
						<tr>
							<td>글번호</td>
							<td>글머리</td>
							<td>글제목</td>
							<td>글쓴이</td>
							<td>작성일</td>
							<td>조회</td>
						</tr>

						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.no}</td>

								<td>${dto.s_type}</td>

								<td>
									<a href="content.do?no=${dto.no}&pageNum=${pageNum}">${dto.title}</a>
								</td>

								<td>${dto.mem_id}</td>

								<td><fmt:formatDate value="${dto.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

								<td>${dto.readcount}</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</td>
		</tr>
		
		

		<tr align="center">
			<td>
				<c:if test="${count>0 }">
					<%--이전페이지 --%>
					<c:if test="${startPage > 10 }">
						<a href="cdList.do?pageNum=${startPage-10}">[이전]</a>
					</c:if>

					<%--페이지처리 --%>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="cdList.do?pageNum=${i}">[${i}]</a>
					</c:forEach>

					<%--다음 페이지 --%>
					<c:if test="${endPage < pageCount }">
						<a href="cdList.do?pageNum=${startPage+10}">[다음]</a>
					</c:if>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>
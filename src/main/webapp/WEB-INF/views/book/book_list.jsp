<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center><b>전체 글 갯수:${count }</b></center>
	
	<table border="1">
		<tr>
			<td align="right" colspan="2">
				<a href="book_writeForm.do?book_type=${book_type }">글쓰기</a>
			</td>
		</tr>
		
		<tr>
			<td>
				<c:if test="${count>0 }">
					<table border="1">
						<tr>
							<td>글번호</td>
							<td>글 종류</td>
							<td>글제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회</td>
							<td>추천</td>
							<td>ip</td>
						</tr>
						
						<c:forEach var="book_dto" items="${list }">
							<tr>
								<td>
									<c:out value="${number }"/>
									<c:set var="number" value="${number-1 }"/>
								</td>
								<td>
									${book_dto.book_type }
								</td>
								<td>
									<c:if test="${book_dto.book_indent>0}">
										<img src="resources/imgs/level.gif" width="${5*book_dto.book_indent }" height="16">
										<img src="resources/imgs/re.gif">
									</c:if>
									
									<c:if test="${book_dto.book_indent==0 }">
										<img src="resources/imgs/level.gif" width="${5*book_dto.book_indent }" height="16">
									</c:if>
									
									<a href="book_content.do?book_no=${book_dto.book_no }&pageNum=${pageNum}">${book_dto.book_title }</a>
									<c:if test="${book_dto.book_readcount>=20 }">
										<img src="resources/imgs/hot.gif" border="0">
									</c:if>
								</td>
								
								<td>
									${book_dto.book_id }
								</td>
								
								
								<td>
									<fmt:formatDate value="${book_dto.book_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
								
								<td>${book_dto.book_readcount }</td>
								<td>${book_dto.book_like }</td>
								<td>${book_dto.book_ip }</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td>
				<c:if test="${count>0 }">
					<%-- 이전페이지 --%>
					<c:if test="${startPage > 10}">
						<a href="book_list.do?pageNum=${startPage-10}">[이전]</a>
					</c:if>
					
					<%-- 페이지처리 --%>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<a href="book_list.do?pageNum=${i }">[${i }]</a>
					</c:forEach>
					
					<%-- 다음페이지 --%>
					<c:if test="${endPage < pageCount}">
						<a href="book_list.do?pageNum=${startPage+10}">[다음]</a>
					</c:if>
				</c:if>
			</td>
		</td>
	</table>
</body>
</html>























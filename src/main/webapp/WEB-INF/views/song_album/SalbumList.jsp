<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctxpath" value="<%=request.getContextPath()%>"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	
</head>
<body>
	<center><h2>가요앨범 리스트</h2></center>
	<div class="container">
		<table class="table">
			
			<div>
				<ul class="nav nav-tabs">
					<li><a href="albumMainList.do">전체</a>||</li>
					<li><a href="SalbumList.do">가요</a>||</li>
					<li><a href="PalbumList.do">POP</a>||</li>
					<li><a href="OalbumList.do">OST</a>||</li>
					<li><a href="TalbumList.do">트롯</a>||</li>
					<li><a href="JalbumList.do">JAZZ</a>||</li>
					<li><a href="CalbumList.do">CLASSIC</a>||</li>
					<li><a href="EalbumList.do">EDM</a>||</li>
					<li><a href="ETCalbumList.do">기타</a></li>
				</ul>
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
								<td></td>
								<td>곡정보</td>
								<td></td>
								<td>기타</td>								
							</tr>
							<c:forEach var="dto" items="${list}">
								<tr>								
									<td>${dto.a_no}</td>
	
									<td>
										<a href="${ctxpath }/albumContent.do?a_no=${dto.a_no}&pageNum=${pageNum}">
											<img src="${ctxpath }/resources/imgUpload/${dto.a_picture}">
										</a>
									</td>
	
									<td>
										<h4 class="mt-4">앨범제목</h4>
										<p>${dto.a_title}</p><hr>
										<h4 class="mt-4">아티스트</h4>
										<p>${dto.a_artist}</p><hr>
									</td>
									<td>
										<h4 class="mt-4">타이틀곡</h4>
										<p>${dto.a_main}</p><hr>
										<h4 class="mt-4">장르</h4>
										<p>${dto.a_style}</p><hr>
									</td>
									<td>
										<h4 class="mt-4">조회</h4>
										<p>${dto.a_readcount}</p><hr>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</td>
			</tr>

			<tr align="right">
			<c:if test="${sessionScope.mem_grade=='admin'}">
				<td><input type="button" value="글쓰기" onclick="document.location.href='albumWriteForm.do'"></td>
			</c:if>
			</tr>

			<tr align="center">
				<td>
					<c:if test="${count>0 }">
						<%--이전페이지 --%>
						<c:if test="${startPage > 10 }">
							<a href="SalbumList.do?pageNum=${startPage-10}">[이전]</a>
						</c:if>

						<%--페이지처리 --%>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="SalbumList.do?pageNum=${i}">[${i}]</a>
						</c:forEach>

						<%--다음 페이지 --%>
						<c:if test="${endPage < pageCount }">
							<a href="SalbumList.do?pageNum=${startPage+10}">[다음]</a>
						</c:if>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>

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
	<center><h2>1960년대</h2></center>
	<div class="container">
		<table class="table">
			
			<div>
				<ul class="nav nav-tabs">
					<li><a href="singerMainList.do">전체</a>||</li>
					<li><a href="StwosingerList.do">2020년대</a>||</li>
					<li><a href="SonesingerList.do">2010년대</a>||</li>
					<li><a href="SzerosingerList.do">2000년대</a>||</li>
					<li><a href="NinesingerList.do">1990년대</a>||</li>
					<li><a href="EightsingerList.do">1980년대</a>||</li>
					<li><a href="SevensingerList.do">1970년대</a>||</li>
					<li><a href="SixsingerList.do">1960년대</a>||</li>
					<li><a href="FivesingerList.do">1950년대</a>||</li>
					<li><a href="ETCsingerList.do">그 외 활동연대</a></li>
				</ul>
							
				<tr align="right">
					<c:if test="${sessionScope.mem_grade=='admin'}">
						<td><input type="button" value="글쓰기" onclick="document.location.href='singerWriteForm.do'"></td>
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
								<td></td>
								<td>아티스트</td>
								<td>활동연대</td>					
								<td>조회</td>								
							</tr>
							<c:forEach var="dto" items="${list}">
								<tr>								
									<td>${dto.ss_no}</td>
	
									<td>
										<a href="${ctxpath }/singerContent.do?ss_no=${dto.ss_no}&pageNum=${pageNum}">
											<img src="${ctxpath }/resources/imgUpload/${dto.ss_picture}" style="max-width:200px; max-height:200px">
										</a>
									</td>
	
									<td>
										<a href="${ctxpath }/singerContent.do?ss_no=${dto.ss_no}&pageNum=${pageNum}">
											${dto.ss_artist}
										</a>
									</td>
									<td>
										<p>${dto.ss_active}</p>
									</td>
									<td>
										<p>${dto.ss_readcount}</p>
									</td>
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
							<a href="singMainList.do?pageNum=${startPage-10}">[이전]</a>
						</c:if>

						<%--페이지처리 --%>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="singMainList.do?pageNum=${i}">[${i}]</a>
						</c:forEach>

						<%--다음 페이지 --%>
						<c:if test="${endPage < pageCount }">
							<a href="singMainList.do?pageNum=${startPage+10}">[다음]</a>
						</c:if>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>

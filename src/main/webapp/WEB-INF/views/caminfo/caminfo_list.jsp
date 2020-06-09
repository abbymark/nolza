<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</head>

<body>
	<c:if test="${caminfo_type== null}">
		<center>
			<h2>캠핑 정보 전체 게시판</h2>
		</center>
	</c:if>
	<c:if test="${caminfo_type=='equip'}">
		<center>
			<h2>캠핑 장비 정보</h2>
		</center>
	</c:if>

	<c:if test="${caminfo_type=='food'}">
		<center>
			<h2>캠핑 음식 정보</h2>
		</center>
	</c:if>

	<c:if test="${caminfo_type=='backpack'}">
		<center>
			<h2>백패킹 정보</h2>
		</center>
	</c:if>

	<c:if test="${caminfo_type=='install'}">
		<center>
			<h2>장비 설치 관련 영상</h2>
		</center>
	</c:if>

	<div class="container">
		<table class="table" width="70%">
			
				<tr>
					<td align="center" colspan="4"><b>전체 ${count}개의 게시물이 있습니다.</b></td>
				</tr>
				<tr>
					<c:if test="${mem_grade=='admin'}">
					<td align="right" colspan="4"><a href="caminfo_writeForm.do?caminfo_type=${caminfo_type}">글쓰기</a></td>
				    </c:if>
				
				<td colspan="6" align="center">
			<c:if test="${count==0 }">저장된 글이 없습니다 </c:if> 
			
    		<c:if test="${count>0 }">
		
			<tr>
				<td id="caminfo_no" width="15%">글 번호</td>
				<td id="caminfo_type" width="20%">글 분류</td>
				<td id="caminfo_title" width="50%">제 목</td>
				<td id="caminfo_readcount" width="15%">조 회</td>	
			</tr>
	
			<c:forEach var="caminfo" items="${list}">
				<tr>
					<td id="caminfo_no">
					<c:out value="${number}" /> 
					<c:set	var="number" value="${number-1}" />
					</td>
	
					<td id="caminfo_type">${caminfo.caminfo_type}</td>
	
					<td id="caminfo_title">
					<c:if test="${caminfo.caminfo_indent>0}">
							<img src="resources/imgs/level.gif"	width="${5*caminfo.caminfo_indent}" height="16">
							<img src="resources/imgs/re.gif">
					</c:if>
					<c:if test="${caminfo.caminfo_indent==0}">
							<img src="resources/imgs/level.gif"	width="${5*caminfo.caminfo_indent}" height="16">
					</c:if> 
					<a href="caminfo_content.do?caminfo_no=${caminfo.caminfo_no}&pageNum=${pageNum}&caminfo_type=${caminfo_type}">${caminfo.caminfo_title}</a>
					<c:if test="${caminfo.caminfo_readcount>=20 }">
							<img src="resources/imgs/hot.png" border="0" height="16">
					</c:if>
					</td>
	
					<td id="caminfo_readcount">${caminfo.caminfo_readcount}</td>
				</tr>
			</c:forEach>
			</c:if><br>

				</td>
			</tr>

			<tr >
				<td align="center" colspan="4"><c:if test="${count>0 }">

						<%--이전페이지 --%>
						<c:if test="${startPage > 10 }">
							<a	href="caminfo_list.do?pageNum=${startPage-10}&caminfo_type=${caminfo_type}">[이전]</a>
						</c:if>

						<%--페이지처리 --%>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a	href="caminfo_list.do?pageNum=${i}&caminfo_type=${caminfo_type}">[${i}]</a>
						</c:forEach>

						<%--다음 페이지 --%>
						<c:if test="${endPage < pageCount }">
							<a	href="caminfo_list.do?pageNum=${startPage+10}&caminfo_type=${caminfo_type}">[다음]</a>
						</c:if>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
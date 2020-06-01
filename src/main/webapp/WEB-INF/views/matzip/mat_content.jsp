<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>





<!-- 스타일 시트 적용 -->
<link rel="stylesheet" type="text/css" href="resources/css/freeBoardt3.css">

<!-- 본문 -->
<body>
	
	<center>
		<h2>글내용보기</h2>
	</center>
	
	<table class="freeboard_list">
		<tr>
			<td>글번호</td>
			<td>${dto.no}</td>
			<td>조회수</td>
			<td>${dto.readcount}</td>
		</tr>

		<tr>
			<td>닉네임</td>
			<td>${dto.mem_nick}</td>
			<td>작성일</td>
			<td>${dto.date} <%-- 
				<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				--%>
			</td>
		</tr>

		<tr>
			<td>글제목</td>
			<td colspan="3">${dto.title}</td>
		</tr>
		<tr>
			<td>글내용</td>
			<td colspan="3"><textArea rows="10" cols="60" readOnly>${dto.content}</textArea>
			</td>
		</tr>

		<tr>
			<td colspan="4" align="center">
				
			<c:if test="${mem_id != null}">
			
				<c:if test="${mem_id == dto.mem_id || mem_id == 'admin'}" >
					<input type="button" value="글수정"
						onclick="document.location.href='mat_updateForm?no=${dto.no}&pageNum=${pageNum}'">

					<input type="button" value="글삭제"
						onclick="document.location.href='delete?no=${dto.no}&pageNum=${pageNum}'">
						
				</c:if>
					
				<c:if test="${mem_id != dto.mem_id}" >
							
					<input type="button" value="답글쓰기" 
					onclick="document.location.href='mat_writeForm?no=${dto.no}&ggroup=${ggroup}&step=${step}&indent=${indent}'" >
					
				</c:if>
				
				
			</c:if>
			
			<c:if test="${mem_id == null}">	
				<c:if test="${mem_id != dto.mem_id || mem_id != 'admin'}" >
					<input type="button" value="글수정" disabled=true
						onclick="document.location.href='mat_updateForm?no=${dto.no}&pageNum=${pageNum}'"  >

					<input type="button" value="글삭제" disabled=true
						onclick="document.location.href='delete?no=${dto.no}&pageNum=${pageNum}'" >
				
					<input type="button" value="답글쓰기" disabled=true
					onclick="document.location.href='mat_writeForm?no=${dto.no}&ggroup=${ggroup}&step=${step}&indent=${indent}'" >
					
				
				</c:if>
			</c:if>	
			
				
				<input type="button" value="글목록"
				onclick="document.location.href='mat_list?pageNum=${pageNum}'">
			</td>
		</tr>
	</table>
</body>
</html>



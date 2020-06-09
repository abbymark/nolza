<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>caminfo_content.jsp</title>
	
</head>
<body >
<div class="container list"><h2>${dto.caminfo_title}</h2>
<table class="table" width="70%">
	<tr>
		<td>글번호</td>
		<td>${dto.caminfo_no}</td>
		<td>조회수</td>
		<td>${dto.caminfo_readcount }</td>
		<td>작성일</td>
		<td>
		<fmt:formatDate value="${dto.caminfo_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</td>
	</tr>
	<tr>
		<td colspan="6" id="content">${caminfo_content}  <!-- ******************** -->
		</td>
	</tr>
	<tr align="center">
		<td colspan="6" align="center">
		<c:if test="${mem_grade == 'admin'}">
		<input type="button" value="글수정" onclick="document.location.href='caminfo_updateForm.do?caminfo_no=${dto.caminfo_no}&pageNum=${pageNum}'"/>
		<input type="button" value="글삭제" onclick="document.location.href='caminfo_delete.do?caminfo_no=${dto.caminfo_no}&pageNum=${pageNum}'"/>
		</c:if>
		<input type="button" value="답글쓰기" onclick="document.location.href='caminfo_writeForm.do?caminfo_no=${dto.caminfo_no}&caminfo_group=${dto.caminfo_group}&caminfo_step=${dto.caminfo_step}&caminfo_indent=${dto.caminfo_indent}'"/>
		<input type="button" value="글목록" onclick="document.location.href='caminfo_list.do?pageNum=${pageNum}'"/>
		</td>
	</tr>
</table>
</div>
</body>
</html>
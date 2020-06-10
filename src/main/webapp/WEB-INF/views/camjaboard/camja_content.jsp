<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>camja_content.jsp</title>
</head>
<body >
<div class="container list"><h2>${dto.camja_title}</h2>
<table class="table" width="70%">
	<tr>
		<td>글번호</td>
		<td>${dto.camja_no}</td>
		<td>조회수</td>
		<td>${dto.camja_readcount }</td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td>${dto.mem_nick}</td>
		<td>작성일</td>
		<td>		
		<fmt:formatDate value="${dto.camja_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</td>
	</tr>
	<tr >
		<td colspan="2" >글제목</td>
		<td colspan="2" align="left">${dto.camja_title}</td>
	</tr>
	<tr >
		<td colspan="2">글내용</td>
		<td colspan="2" id="content"   align="left">
		${camja_content}  <!-- ******************** -->
		</td>
	</tr>
	
	<tr>
		<td colspan="4" align="center">
		<c:if test="${mem_grade == 'admin'}">
		<input type="button" value="글수정" onclick="document.location.href='camja_updateForm.do?camja_no=${dto.camja_no}&pageNum=${pageNum}'"/>
		<input type="button" value="글삭제" onclick="document.location.href='camja_delete.do?camja_no=${dto.camja_no}&pageNum=${pageNum}'"/>
		</c:if>
		<input type="button" value="답글쓰기" onclick="document.location.href='camja_writeForm.do?camja_no=${dto.camja_no}&camja_group=${dto.camja_group}&camja_step=${dto.camja_step}&camja_indent=${dto.camja_indent}'"/>
		<input type="button" value="글목록" onclick="document.location.href='camja_list.do?pageNum=${pageNum}'"/>
		</td>
	</tr>
	
	
</table>
</div>
</body>
</html>
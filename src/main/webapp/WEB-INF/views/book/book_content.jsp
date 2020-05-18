<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${book_title }</title>
<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
//---------------------
//ajax 이용하여 id사용 여부 체크
//---------------------
function likeCheck(){
	//alert("likeCheck():"+$("#book_no").val()+"\n"+ $("#book_id").val())
	
	
	$.ajax({
		type:'POST',
		url:'book_likeCheck.do',
		data:"book_no="+$("#book_no").val()+"&book_likeState="+1+"&book_id="+ $("#book_id").val(),
		dataType:'JSON',
		success:function(data){
			//alert(data.likeValue);
			$("#likeCount").text(data.likeValue);
		}//success end
	});//ajax end
	
}//idCheck() end
</script>
</head>
<body>
	<center><h2>글 내용 보기</h2></center>
	<form>
	<table border="1">
		
		<tr>
			<td>글번호</td>
			<td>${book_dto.book_no }
				<input type="hidden" id="book_id" value="3">
		    	<input type="hidden" id="book_no" value="${book_dto.book_no }">
			</td>
			<td>조횟수</td>
			<td>${book_dto.book_readcount }</td>
		</tr>
		
		<tr>
			<td>글쓴이</td>
			<td>${book_dto.book_id }</td>
			<td>작성일</td>
			<td>
				<%-- ${dto.regdate } --%>
				<fmt:formatDate value="${book_dto.book_date }" pattern="yyyy-MM-dd hh:mm:ss"/>
			</td>
		</tr>
		
		<tr>
			<td>글 종류</td>
			<td colspan="3">${book_dto.book_type }</td>
		</tr>
		
		<tr>
			<td>글제목</td>
			<td colspan="3">${book_dto.book_title }</td>
		</tr>
		<tr>
			<td>글내용</td>
			<td colspan="3">
				<textArea rows="10" cols="60" readonly>${book_content }</textArea>
				<table border="1">
					<tr>
						<td>
							<input type="button" id="book_like" value="좋아요" onClick="likeCheck()">
							<input type="button" id="book_dislike" value="싫어요" onClick="dislikeCheck()">
						</td>
					</tr>
					<tr align="center">
						<td>
							<span id="likeCount" style="display:inline-block">${book_dto.book_like }</span>			
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="글수정" onclick="location.href='book_updateForm.do?book_no=${book_dto.book_no}&pageNum=${pageNum}'">
				<input type="button" value="글삭제" onclick="document.location.href='book_delete.do?book_no=${book_dto.book_no}&pageNum=${pageNum}'">
				<input type="button" value="글쓰기" onclick="document.location.href='book_writeForm.do'">
				<input type="button" value="답글쓰기" onclick="document.location.href='book_writeForm.do?book_no=${book_dto.book_no}&book_group=${book_dto.book_group}&book_step=${book_dto.book_step }&book_indent=${book_dto.book_indent }'">
				<input type="button" value="글목록" onclick="location.href='book_list.do?pageNum=${pageNum}'">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>























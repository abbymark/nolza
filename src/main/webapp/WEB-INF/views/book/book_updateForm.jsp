<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxpath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	function check(){
		if($('#mem_id').val()==''){
			alert("이름을 입력 하세요");
			$("#writer").focus();
			return false;
		}
		
		return true;
	}
	
	//이미지 추가
	function insertImg(){
		var html='';
		html +="<tr>"
		html +="<td>"
		html +="<input type='file' name='img_title'>"
		html +="</td>"
		html +="<td>"
		html +="<input type='button' value='X' onClick='deleteImg(this)'>"
		html +="</td>"
		html +="</tr>"
		
		$("#images").append(html);
			
	}

	//이미지 삭제
	function deleteImg(id){
		
		$(id).closest("tr").remove();
	}

	function deleteDbImg(img){
		$.ajax({
		type:'POST',
		url:'book_deleteDbImg.do',
		async:false,
		data:"img_no="+img
		})
	}
</script>
</head>
<body>
	<center><h2>글수정</h2></center>
	<form method="post" name="book_writeForm" action="book_updatePro.do?pageNum=${pageNum}"  encType="multipart/form-data" onsubmit="return check()">
	<div class="container list">
		<table border="1" class="table">
		
			<tr>
				<td>이름</td>
				<td>
					${mem_nick }
					<input type="hidden" name="mem_id" id="mem_id" size="30" value="${mem_id }">
					<input type="hidden" name="book_no" value="${book_dto.book_no }">
				</td>
			</tr>
			
			<tr>
				<td>글 종류</td>
				<td>
					<select name="book_type" id="book_type">
						<option value="${book_dto.book_type }">${book_dto.book_type }</option>
						<option value="자유게시판">자유게시판</option>
						<option value="비소설 추천">비소설 추천</option>
						<option value="소설 추천">소설 추천</option>
						<option value="독서 모임">독서 모임</option>
						<option value="토론">토론</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>글제목</td>
				<td><input type="text" name="book_title" id="book_title" size="30" value="${book_dto.book_title }"></td>
			</tr>
			
			<tr>
				<td>글내용</td>
				<td>
					<textarea name="book_content" id="book_content" rows="10" cols="60">${book_dto.book_content }</textarea>
				</td>
			</tr>
			
			<c:forEach var="imgs" items="${book_imgs }">
			<tr>
				<td colspan="2">
					<img src="${ctxpath }/resources/book_imgs/${imgs}" style="max-width:500px; max-height:500px" id="image">
					<input type='button' value='X' onClick='deleteImg(this); deleteDbImg("${imgs}");'>
				</td>
				
			</tr>
			</c:forEach>
			
			<tr>
				<td>이미지</td>
				<td>
					<input type="button" onClick="insertImg()" value="이미지 추가">
				</td>
			</tr>
			<tr>
				<td>이미지 파일</td>
				<td>
					
					<table id="images">

					</table>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록" onclick="document.location.href='book_list.do?pageNum=${pageNum}'">
				</td>
			</tr>
			
		</table>
		</div>
	</form>
</body>
</html>
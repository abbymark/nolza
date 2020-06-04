<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function openDaumPostcode(){
	//alert("A");
	new daum.Postcode({
		oncomplete:function(data){
			//document.getElementById('zipcode').value=data.zonecode;
			document.getElementById('book_location').value=data.address;
		}
	}).open();
}

var typeCheckVal=0;
function typeCheck(){
	if($('#book_type').val()=='독서 모임'){
        $('#location').show();
        typeCheckVal=1;
  	}else{
  		$('#location').hide();
  		typeCheckVal=0;
  	}
	
	if($('#book_type').val()=='비소설 추천'||$('#book_type').val()=='소설 추천'){
        $('#rating').show();
        typeCheckVal=1;
  	}else{
  		$('#rating').hide();
  		typeCheckVal=0;
  	}
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
</script>
<link rel="stylesheet" href="resources/imgs/star.css">

</head>
<body onload="typeCheck()">
	<center><h2></h2></center>
		<input type="hidden" name="book_type" value="${book_type }">
	<form method="post" name="book_writeForm" action="book_writePro.do" encType="multipart/form-data">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="book_no" value="${book_no }">
		<input type="hidden" name="book_group" value="${book_group }">
		<input type="hidden" name="book_step" value="${book_step }">
		<input type="hidden" name="book_indent" value="${book_indent }">
		<input type="hidden" name="mem_id" value="${mem_id }">
		<input type="hidden" name="mem_nick" value="${mem_nick }">
		<div class="list container">
		<table border="1" class="table">
			<tr>
				<td colspan="2" align="right">
					<a href="book_list.do">리스트</a>
				</td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td>
					${mem_nick }
				</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>
					<c:if test="${book_no==0 }">
						<input type="text" name="book_title" size="30">
					</c:if>
					
					<c:if test="${book_no != 0 }">
						<input type="text" name="book_title" size="30" value="[답변]">
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td>글 종류</td>
				<c:set var="book_type" value="${book_type }"/>
				<c:choose>
					<c:when test="${book_type eq 'free'}">
						<c:set var="book_type" value="자유게시판"/>
					</c:when>
					<c:when test="${book_type eq 'recommendNonFiction'}">
					 	<c:set var="book_type" value="비소설 추천"/>
					</c:when>
					<c:when test="${book_type eq 'recommendFiction'}">
					 	<c:set var="book_type" value="소설 추천"/>
					</c:when>
					<c:when test="${book_type eq 'readingGroup'}">
					 	<c:set var="book_type" value="독서 모임"/>
					</c:when>
					<c:when test="${book_type eq 'debate'}">
					 	<c:set var="book_type" value="토론"/>
					</c:when>
				</c:choose>
				<td>
					<select name="book_type" id="book_type" onchange="typeCheck()">
						<option value="${book_type }">${book_type }</option>
						<option value="자유게시판">자유게시판</option>
						<option value="비소설 추천">비소설 추천</option>
						<option value="소설 추천">소설 추천</option>
						<option value="독서 모임">독서 모임</option>
						<option value="토론">토론</option>
					</select>
				</td>
			</tr>
			
			
			<tbody id=rating style="display:none;">
				<tr>
					<td>
						평점
					</td>
					<td>
						<span class="starRating">
						  <input id="rating5" type="radio" name="book_rating" value="5">
						  <label for="rating5">5</label>
						  <input id="rating4" type="radio" name="book_rating" value="4">
						  <label for="rating4">4</label>
						  <input id="rating3" type="radio" name="book_rating" value="3">
						  <label for="rating3">3</label>
						  <input id="rating2" type="radio" name="book_rating" value="2">
						  <label for="rating2">2</label>
						  <input id="rating1" type="radio" name="book_rating" value="1">
						  <label for="rating1">1</label>
						</span>
					</td>
				</tr>
			</tbody>
			
			
			
			<tr>
				<td>글내용</td>
				<td>
					<textarea style="width:100%" name="book_content" rows="10" cols="60"></textarea>
				</td>
			</tr>
			
			
			<tbody id=location style="display:none;">
				<tr>
					<td>위치</td>
					<td>
						<input type="text" name="book_location" id="book_location">
						<input type="button" value="주소찾기" onclick="openDaumPostcode()">
					</td>
				</tr>
			</tbody>
			
			
			
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
				<td colspan="2">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록보기" onclick="document.location.href='book_list.do'">
				</td>
			</tr>
		</table>
		</div>
	</form>
</body>
</html>



















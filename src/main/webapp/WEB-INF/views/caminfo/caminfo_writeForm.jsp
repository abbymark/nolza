<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm.jsp</title>

<script type="text/javascript"	src="http://code.jquery.com/jquery-1.11.3.js"></script>

<script src="resources/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
            $(document).ready(function(){
            	
            	CKEDITOR.replace( 'caminfo_content' );
            	CKEDITOR.config.height = 500;
            	            	
            	$("#save").click(function check(){
            		
            		//에디터 내용 가져옴
            		var content = CKEDITOR.instances.content.getData();
            		
            		//널 검사
                    if($("#caminfo_title").val().trim() == ""){
                    	alert("제목을 입력하세요.");
                    	$("#caminfo_title").focus();
                    	return false;
                    }
            		
                    if($("#mem_id").val().trim() == ""){
                    	alert("작성자를 입력하세요.");
                    	$("mem_id").focus();
                    	return false;
                    }

            		//ajax 호출
            		$.ajax({
            			url			:	"caminfo_writePro.do",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code == "OK") {
            					alert(retVal.message);
            					location.href = "/caminfo_board/caminfo_list.do";	
            				} else {
            					alert(retVal.message);
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            			}
            		});
            		            		
            	});
            	
            });
        </script>
</head>
<body>
<div class="container">
	<h2>글쓰기</h2>

	<form method="post" name="caminfo_writeForm" action="caminfo_writePro.do" onSubmit="return check()">
		<input type="hidden" name="pageNum" value="${pageNum}"> 
		<input type="hidden" name="caminfo_no" value="${caminfo_no}"> 
		<input type="hidden" name="caminfo_group" value="${caminfo_group}"> 
		<input type="hidden" name="caminfo_step" value="${caminfo_step}"> 
		<input type="hidden" name="caminfo_indent" value="${caminfo_indent}">

		<%-- <input type="hidden" id="mem_id" name="mem_id" value="${mem_id}" /> --%>
		<div align="center"  class="container">
			</br> </br>
			<table width="1200px" class="table">

				<tr>
					<td>제목: <input type="text" id="caminfo_title" name="caminfo_title"
						style="width: 600px;" placeholder="제목" value="${caminfo_title}" />
					</td>
				</tr>

				<tr>
					<td>카테고리 <c:set var="caminfo_type" value="${caminfo_type }" /> 
						<c:choose>
							<c:when test="${caminfo_type eq 'equip'}">
								<c:set var="caminfo_type" value="캠핑 장비 정보" />
							</c:when>
							<c:when test="${caminfo_type eq 'food'}">
								<c:set var="caminfo_type" value="캠핑 음식 정보" />
							</c:when>
							<c:when test="${caminfo_type eq 'backpack'}">
								<c:set var="caminfo_type" value="백패킹 정보" />
							</c:when>
							<c:when test="${caminfo_type eq 'install'}">
								<c:set var="caminfo_type" value="장비 설치 관련 영상" />
							</c:when>
						</c:choose> 
						<select name="caminfo_type" id="caminfo_type">
							<option value="${caminfo_type }">${caminfo_type }</option>
							<option value="캠핑 장비 정보">캠핑 장비 정보</option>
							<option value="캠핑 음식 정보">캠핑 음식 정보</option>
							<option value="백패킹 정보">백패킹 정보</option>
							<option value="장비 설치 관련 영상">장비 설치 관련 영상</option>
						</select>
					</td>

				<tr>
					<td>
					<textarea name="caminfo_content" id="caminfo_content" rows="10"	cols="80">${caminfo_content}</textarea>
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="글쓰기" id="save"> 
					<input type="reset" value="다시작성"> 
					<input type="button" value="글목록보기" onClick="document.location.href='caminfo_list.do'"></td>
				</tr>

			</table>
		</div>

	</form>
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>글 수정 게시판</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<script type="text/javascript">
            $(document).ready(function(){
            	
            	CKEDITOR.replace( 'caminfo_content'{
            		allowedContent:true,
            		width:640,
            		height:600
            		
            	} );
            	CKEDITOR.config.height = 500;
            	            	
            	$("#save").click(function(){
            		
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
                    	$("#mem_id").focus();
                    	return false;
                    }
/*                                 		
            		//값 셋팅
            		var objParams = {
            				<c:if test="${mem_id != null}"> //있으면 수정 없으면 등록
            				mem_id			: $("#mem_id").val(),
            				</c:if>
            				title		: $("#caminfo_title").val(),
            				mem_id		: $("#mem_id").val(),
            				caminfo_content		: caminfo_content
    				};
            		
 */
 								//ajax 호출
            		$.ajax({
            			url			:	"caminfo_updatePro.do",
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
	<center>
		<h2>글수정</h2>
	</center>
	<form method="post" name="caminfo_writeForm" action="caminfo_updatePro.do?pageNum=${pageNum }">
		<div align="center">
			</br> </br>
			<table width="1200px">
				<tr>
					<td>제목: 
					<input type="text" id="caminfo_title" name="caminfo_title"style="width: 600px;" placeholder="제목" value="${dto.caminfo_title}" />
					</td>
				</tr>
				
				<tr>
					<td>아이디: 
					<input type="hidden" id="mem_id" name="mem_id"style="width: 170px;" maxlength="10" placeholder="아이디"	value="${dto.mem_id}" readonly/>${dto.mem_id}
					</td>
					
					<td><input type="hidden" name="caminfo_no" value="${dto.caminfo_no }"></td>
				</tr>
				<tr>
					<td>닉네임: 
					<input type="hidden" id="mem_nick" name="mem_nick"style="width: 170px;" maxlength="10" placeholder="닉네임" value="${dto.mem_nick}" readonly/>${dto.mem_nick}
					</td>
				</tr>

				<tr>
					<td>카테고리 <c:set var="caminfo_type" value="${dto.caminfo_type }" /> <c:choose>
							<c:when test="${caminfo_type eq 'equip'}">
								<c:set var="caminfo_type" value="캠핑 장비 정보" />
							</c:when>
							<c:when test="${caminfo_type eq 'info'}">
								<c:set var="caminfo_type" value="캠핑 음식 정보" />
							</c:when>
							<c:when test="${caminfo_type eq 'solo'}">
								<c:set var="caminfo_type" value="백패킹 정보" />
							</c:when>
							<c:when test="${caminfo_type eq 'team'}">
								<c:set var="caminfo_type" value="장비 설치 영상" />
							</c:when>

						</c:choose> <select name="caminfo_type" id="caminfo_type">
							<option value="${caminfo_type }">${dto.caminfo_type }</option>
							<option value="캠핑 장비 정보">캠핑 장비 정보</option>
							<option value="캠핑 음식 정보">캠핑 음식 정보</option>
							<option value="백패킹 정보">백패킹 정보</option>
							<option value="장비 설치 관련 영상">장비 설치 관련 영상</option>
					</select>
					</td>

				<tr>
					<td><textarea name="caminfo_content" id="caminfo_content" rows="10"
							cols="80">${dto.caminfo_content}</textarea></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="글쓰기"> <input type="reset" value="다시작성"> <input
						type="button" value="글목록보기"
						onClick="document.location.href='caminfo_list.do'"></td>
				</tr>

			</table>
		</div>

	</form>


</body>
</html>
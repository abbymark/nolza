<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
<%@ page session="false" %>
 --%>
<html>
<head>
<title>게시판</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<script type="text/javascript">
            $(document).ready(function(){
            	
            	CKEDITOR.replace( 'fb_content' );
            	CKEDITOR.config.height = 500;
            	            	
            	$("#save").click(function(){
            		
            		//에디터 내용 가져옴
            		var content = CKEDITOR.instances.content.getData();
            		
            		//널 검사
                    if($("#fb_title").val().trim() == ""){
                    	alert("제목을 입력하세요.");
                    	$("#fb_title").focus();
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
            				title		: $("#fb_title").val(),
            				mem_id		: $("#mem_id").val(),
            				fb_content		: fb_content
    				};
            		
 */
 								//ajax 호출
            		$.ajax({
            			url			:	"fb_updatePro.do",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code == "OK") {
            					alert(retVal.message);
            					location.href = "/fb_board/fb_list.do";	
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
	<form method="post" name="fb_writeForm" action="fb_updatePro.do?pageNum=${pageNum }">

		<%-- <input type="hidden" id="mem_id" name="mem_id" value="${mem_id}" /> --%>
		<div align="center">
			</br> </br>
			<table width="1200px">

				<tr>
					<td>제목: 
					<input type="text" id="fb_title" name="fb_title"style="width: 600px;" placeholder="제목" value="${dto.fb_title}" />
					</td>
				</tr>
				
				<tr>
					<td>아이디: 
					<input type="hidden" id="mem_id" name="mem_id"style="width: 170px;" maxlength="10" placeholder="아이디"	value="${dto.mem_id}" readonly/>${dto.mem_id}
					</td>
					
					<td><input type="hidden" name="fb_no" value="${dto.fb_no }"></td>
				</tr>
				<tr>
					<td>닉네임: 
					<input type="hidden" id="mem_nick" name="mem_nick"style="width: 170px;" maxlength="10" placeholder="닉네임" value="${dto.mem_nick}" readonly/>${dto.mem_nick}
					</td>
				</tr>

				<tr>
					<td>카테고리 <c:set var="fb_category" value="${dto.fb_category }" /> <c:choose>
							<c:when test="${fb_category eq 'free'}">
								<c:set var="fb_category" value="자유게시판" />
							</c:when>
							<c:when test="${fb_category eq 'info'}">
								<c:set var="fb_category" value="정보게시판" />
							</c:when>
							<c:when test="${fb_category eq 'solo'}">
								<c:set var="fb_category" value="용병신청&구함" />
							</c:when>
							<c:when test="${fb_category eq 'team'}">
								<c:set var="fb_category" value="팀원신청&구함" />
							</c:when>

						</c:choose> <select name="fb_category" id="fb_category">
							<option value="${fb_category }">${fb_category }</option>
							<option value="자유게시판">자유게시판</option>
							<option value="정보게시판">정보게시판</option>
							<option value="용병신청&구함">용병신청&구함</option>
							<option value="팀원신청&구함">팀원신청&구함</option>
					</select>
					</td>
				<tr>
					<td>축구/풋살 <select name="fb_type" id="fb_type">
							<option value="${fb_type }">${fb_type }</option>
							<option value="축구">축구</option>
							<option value="풋살">풋살</option>
					</select>
					</td>
				</tr>

				<tr>
					<td><textarea name="fb_content" id="fb_content" rows="10"
							cols="80">${dto.fb_content}</textarea></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="글쓰기"> <input type="reset" value="다시작성"> <input
						type="button" value="글목록보기"
						onClick="document.location.href='fb_list.do'"></td>
				</tr>

			</table>
		</div>

	</form>


</body>
</html>
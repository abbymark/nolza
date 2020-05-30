<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>writeForm.jsp</title>

	<style type="text/css">
		table{margin:auto;
					line-height:25px;
		}
	</style>
	
		<script type="text/javascript">
			function check() {
					if($('#fb_title').val()==''){
							alert("제목을 입력 하세요");
							$('#fb_title').focus();
							return false;
					}//if
			
				return true;
			}//function check() end 

			
		</script>

</head>
<body>
	<center><h2>글쓰기</h2></center>
	<form method="post" name="fb_writeForm" action="fb_writePro.do">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="fb_no" value="${fb_no}">
		<input type="hidden" name="fb_group" value="${fb_group}">
		<input type="hidden" name="fb_step" value="${fb_step}">
		<input type="hidden" name="fb_indent" value="${fb_indent}">
	
	<table border="1">

		<tr>
			<td colspan="2" align="right">
				<a href="fb_list.do">리스트</a>
			</td>
		</tr>

		<tr>
			<td>아이디</td>
			<td><input type="hidden" name="mem_id" size="30" value="${mem_id}">${mem_id}</td>
		</tr>

		<tr>
			<td>닉네임</td>
			<td><input type="hidden" name="mem_nick" size="30" value="${mem_nick}">${mem_nick}</td>
		</tr>

		<tr>
			<td>제목</td>
			<td>
			<c:if test="${fb_no==0 }">
				<input type="text" name="fb_title" size="30">
			</c:if>

			<c:if test="${fb_no!=0 }">
				<input type="text" name="fb_title" size="30" value="[답변]">
			</c:if>
			</td>
		</tr>

		<tr>
			<td>카테고리</td>
			<c:set var="fb_category" value="${fb_category }"/>
			<c:choose>
				<c:when test="${fb_category eq 'free'}">
					<c:set var="fb_category" value="자유게시판"/>
				</c:when>
				<c:when test="${fb_category eq 'info'}">
					<c:set var="fb_category" value="정보게시판"/>
				</c:when>
				<c:when test="${fb_category eq 'solo'}">
					<c:set var="fb_category" value="용병신청&구함"/>
				</c:when>
				<c:when test="${fb_category eq 'team'}">
					<c:set var="fb_category" value="팀원신청&구함"/>
				</c:when>
				
			</c:choose>
			
			
			<td>
			<select name="fb_category" id="fb_category">
				<option value="${fb_category }">${fb_category }</option>
				<option value="자유게시판">자유게시판</option>
				<option value="정보게시판">정보게시판</option>
				<option value="용병신청&구함">용병신청&구함</option>
				<option value="팀원신청&구함">팀원신청&구함</option>
			</select>
			</td>

			
		</tr>
		
		<tr>
			<td>축구/풋살</td>
			<td>
			<select name="fb_type" id="fb_type">
				<option value="${fb_type }">${fb_type }</option>
				<option value="축구">축구</option>
				<option value="풋살">풋살</option>
			</select>
			</td>
		</tr>
			
		<tr>
			<td>내용</td>
			<td>
			<textarea name="fb_content" rows="10" cols="60"></textarea>			
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록보기" onClick="document.location.href='fb_list.do'">
			</td>
		</tr>
		
	</table>
	
	</form>
</body>
</html>
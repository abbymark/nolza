<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>content.jsp</title>
		<style type="text/css">
			body{background-color:white;}
			table{margin:auto;
			line-height:25px;
			width:60%;
			}
			
			a{text-decoration:none; color:#6c6c6c;}
			a:hover{color:#f2216b;}



  @media ( max-width: 720px ){
   #no{
  display: none;	
   }
  #category{
  display: none;	
  }
	#title{
	display: none;
	}
	#mem_nick{
  display: none;	
	}
	#date{
  display: none;	
	}
	#readcount{
  display:10%;	
	}
	#ip{
	display: none;
	}
	#content{
	display: none;
	}
	iframe{
	position : relative;
	width : 100vw;
	height : 100vh;
	padding-bottom : 56.25%;
	}
}
  
</style>   
		
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>


</head>
<body>
	<center><h2>글 내용 보기</h2></center>

<div class="container">
	<table  class="table">
		<tr height="30">
			<td id="no" align="center">글번호</td>
			<td id="no" align="center">${fb.fb_no}</td>
			
			<td id="readcount" align="center">조회수</td>
			<td align="center">${fb.fb_readcount}</td>
		</tr>

		<tr height="30">
			<td id="mem_nick" align="center">글쓴이</td>
			<td align="center">${fb.mem_id}</td>
			
			<td id="date" align="center">작성일</td>
			<td align="center">
				<fmt:formatDate value="${fb.fb_date }" pattern="yyyy-MM-dd hh:mm"/>
			</td>
		</tr>
	
		
		<tr height="30">
			<td id="title" align="center">글제목</td>
			<td align="center" colspan="3">${fb.fb_title }</td>
		</tr>

		<tr height="30">
			<td id="content" align="center">글내용</td>
			<td align="center" colspan="3">${fb_content }
				<!-- <textarea rows="10" cols="60" readOnly></textarea> -->
			</td>
		</tr>
	
		<tr height="30">
			<td colspan="4" align="right">
		<c:if test="${sessionScope.mem_id==fb.mem_id||sessionScope.mem_grade=='admin' }">	
			<input type="button" value="글수정" onClick="document.location.href='fb_updateForm.do?fb_no=${fb.fb_no}&pageNum=${pageNum }'">
			<input type="button" value="글삭제" onClick="document.location.href='fb_delete.do?fb_no=${fb.fb_no}&pageNum=${pageNum }'">
		</c:if>
		<c:if test="${sessionScope.mem_id!=null}">				
			<input type="button" value="답글" onClick="document.location.href='fb_writeForm.do?fb_no=${fb.fb_no}&fb_group=${fb.fb_group }&fb_step=${fb.fb_step }&fb_indent=${fb.fb_indent }&fb_category=${fb_category}'">
		</c:if>
			<input type="button" value="목록" onClick="document.location.href='fb_list.do?pageNum=${pageNum }'">
			</td>
		</tr>
		
	
	
	</table>
</div>

		<div>
			<p>
				<%@ include file="/WEB-INF/views/fb_board/fb_cmt.jsp" %> 			
			</p>
		</div>		
		
</body>
</html>
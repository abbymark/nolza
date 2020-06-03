  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8"/>
    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
   
  
<style type="text/css">
  @media ( max-width: 720px ){
   #no{
   display: none;
   }
  #category{
  display: none;	
  }
	#title{
	display: 90%;
	}
	#mem_nick{
	display: 10%;
	}
	#date{
	display: none;	
	}
	#readcount{
	display: none;
	}
	#ip{
	display: none;
	}
	
}
 

</style>   
   
</head>
<body>
	
     <c:if test="${fb_category=='free'}">
 			<center><h2>자유게시판</h2></center>    	
		 </c:if>

     <c:if test="${fb_category=='info'}">
 			<center><h2>정보게시판</h2></center>    	
		 </c:if>

     <c:if test="${fb_category=='media'}">
 			<center><h2>축&풋 동영상</h2></center>    	
		 </c:if>

     <c:if test="${fb_category=='solo'}">
 			<center><h2>용병신청&구함</h2></center>    	
		 </c:if>

     <c:if test="${fb_category=='team'}">
 			<center><h2>팀원신청&구함</h2></center>    	
		 </c:if>
 
 
	<center><b>전체/ ${count}게시물</b></center>
	<div class="container list" style="text-align:center;">

   <table class="table">
     <c:if test="${fb_category!=null||sessionScope.mem_grade=='admin'}">
	     <tr>
	      <td align="right" colspan="2" width="20%">
	        <a href="fb_writeForm.do?fb_category=${fb_category}">글쓰기</a>
	     	 </td>
	     </tr>
	   </c:if>
     
     <tr>
     	<td>
     <c:if test="${count==0 }">
      	저장된 글이 없습니다
     </c:if>
     
     <c:if test="${count>0 }">
      <table class="table" align="center" width="100%" style=TABLE-layout:fixed>
       <tr>
         <td id="no" width="5%">No</td>
         <td id="category" width="15%">카테고리</td>
         <td id="title" width="40%">제목</td>
         <!-- <td id="mem_id" width="5%">아이디</td> -->
         <td id="mem_nick" width="10%">작성자</td>
         <td id="date" width="15%">작성일</td>
         <td id="readcount" width="10%">조회</td>
         
       <c:if test="${sessionScope.mem_grade=='admin'}">  
         <td id="ip" width="10%">ip</td>
       </c:if>
        </tr>
        
        <c:forEach var="fb" items="${list}">
           <tr>
             <td id="no">
               <c:out value="${number}"/>
               <c:set var="number" value="${number-1}"/>
             </td>
             
             <td id="category">${fb.fb_category}</td>
             
             <td id="title" style="text-overflow:ellipsis; overflow:hidden;white-space:nowrap;">
             <c:if test="${fb.fb_indent>0}">
               <img src="resources/imgs/level.gif" width="${5*fb.fb_indent}" height="16">
               <img src="resources/imgs/re.gif">
             </c:if>
             
             <c:if test="${fb.fb_indent==0}">
               <img src="resources/imgs/level.gif" width="${5*fb.fb_indent}" height="16">
             </c:if>
             
             &nbsp;[${fb.fb_type }]
             <a href="fb_content.do?fb_no=${fb.fb_no}&pageNum=${pageNum}&fb_category=${fb_category}">${fb.fb_title}</a>
             <c:if test="${fb.fb_readcount>=20 }">
               <img src="resources/imgs/hot.gif" border="0">
             </c:if>
             
             &nbsp;&nbsp;(&nbsp;${fb.fb_cmt_cnt}&nbsp;)
             </td>
             
             <%-- <td>${fb.mem_id}</td> --%>
             <td id="mem_nick"><em>${fb.mem_nick}</em></td>
             
             
             <td id="date">
               <fmt:formatDate value="${fb.fb_date}" pattern="yyyy-MM-dd HH:mm"/>
             </td>
             
             <td id="readcount"> ${fb.fb_readcount}</td>
             
             <c:if test="${sessionScope.mem_grade=='admin'}">
             	<td id="ip"> ${fb.fb_ip}</td>
             </c:if>
             
           </tr>
           
        </c:forEach>
      </table>
    
     </c:if>
     </td>
     </tr>

<tr>
<td>
 <form method="post" action="fb_search.do?fb_category=${fb_category}" align="center">
 	<select name="searchType">
		<option value="mem_id">작성자</option>
		<option value="fb_title">글 제목</option>		
		<option value="fb_type">축구/풋살</option>		
	</select>
	<input type="text" name="searchValue">
	<input type="submit" value="검색">
 </form>

     </td>
     </tr>
     
     
     
     
	<tr>
	<td align="center">
	 <c:if test="${count>0 && searchType==null}">	   
	     
	     <%--이전페이지 --%>
	     <c:if test="${startPage > 10 }">
				<a href="fb_list.do?pageNum=${startPage-10}&fb_category=${fb_category}">[이전]</a>
		 	 </c:if>
	     
	     <%--페이지처리 --%>
	     <c:forEach var="i" begin="${startPage}"  end="${endPage}">
	      <a href="fb_list.do?pageNum=${i}&fb_category=${fb_category}">[${i}]</a>
	     </c:forEach>
	    
	     <%--다음 페이지 --%>
	     <c:if test="${endPage < pageCount }">
			  <a href="fb_list.do?pageNum=${startPage+10}&fb_category=${fb_category}">[다음]</a>
			 </c:if>
	    
	 </c:if>

	 <c:if test="${count>0 && searchType!=null}">	   
	     
	     <%--이전페이지 --%>
	     <c:if test="${startPage > 10 }">
				<a href="fb_search.do?pageNum=${startPage-10}&fb_category=${fb_category}&searchType=${searchType}&searchValue=${searchValue}">[이전]</a>
		 	 </c:if>
	     
	     <%--페이지처리 --%>
	     <c:forEach var="i" begin="${startPage}"  end="${endPage}">
	      <a href="fb_search.do?pageNum=${i}&fb_category=${fb_category}&searchType=${searchType}&searchValue=${searchValue}">[${i}]</a>
	     </c:forEach>
	    
	     <%--다음 페이지 --%>
	     <c:if test="${endPage < pageCount }">
			  <a href="fb_search.do?pageNum=${startPage+10}&fb_category=${fb_category}&searchType=${searchType}&searchValue=${searchValue}">[다음]</a>
			 </c:if>
	    
	 </c:if>
	 
	</td>
	</tr>
     
     
   </table>
   </div>
</body>
</html>
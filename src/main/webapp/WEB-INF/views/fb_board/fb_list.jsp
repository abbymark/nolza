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
   
   
   <style type="text/css">
	   body{background-color:white;}
	   a{text-decoration:none; color:blue;}
	   a:hover{color:red;}
	   
	   table{margin:auto; line-height:25px;}
   </style>
   
</head>
<body>
   <center><b>전체 글 갯수 :${count}</b></center>
   
   <table>
     <c:if test="${fb_category!=null}">
     <tr>
      <td align="right" colspan="2">
        <a href="fb_writeForm.do?fb_category=${fb_category}">글쓰기</a>
      </td>
     </tr>
     </c:if>
     
     <tr><td>
     <c:if test="${count==0 }">
      	저장된 글이 없습니다
     </c:if>
     
     <c:if test="${count>0 }">
      <table border="1">
       <tr>
         <td>글번호</td>
         <td>카테고리</td>
         <td>제목</td>
         <td>아이디</td>
         <td>닉네임</td>
         <td>작성일</td>
         <td>조회</td>
         <td>ip</td>
        </tr>
        
        <c:forEach var="fb" items="${list}">
           <tr>
             <td>
               <c:out value="${number}"/>
               <c:set var="number" value="${number-1}"/>
             </td>
             
             <td>${fb.fb_category}</td>
             
             <td>
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
             
             <td>${fb.mem_id}</td>
             <td>${fb.mem_nick}</td>
             
             
             <td>
               <fmt:formatDate value="${fb.fb_date}" pattern="yyyy-MM-dd HH:mm"/>
             </td>
             
             <td> ${fb.fb_readcount}</td>
             <td> ${fb.fb_ip}</td>
           </tr>
           
        </c:forEach>
      </table>
    
     </c:if>

     <br>

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
</body>
</html>
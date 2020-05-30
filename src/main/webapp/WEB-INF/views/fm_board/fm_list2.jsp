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
     <tr>
      <td align="right" colspan="2">
        <a href="fm_writeForm.do?fm_category=${fm_category}">글쓰기</a>
      </td>
     </tr>
     
     <tr><td>
     <c:if test="${count==0 }">
      	저장된 글이 없습니다
     </c:if>
     
     <c:if test="${count>0 }">
      <table border="1">
        
        <c:forEach var="fb" items="${list}">
           <tr>
             <td>
               <c:out value="${number}"/>
               <c:set var="number" value="${number-1}"/>
             </td>
              
             <td>
              <a href="fm_detail.do?fm_no=${fb.fm_no}&pageNum=${pageNum}&fm_category=${fm_category}">${fb.fm_time}</a>
             </td>
             
             <td>
              <a href="fm_detail.do?fm_no=${fb.fm_no}&pageNum=${pageNum}&fm_category=${fm_category}">${fb.fm_category}</a>
             </td>
             
             <td>
              <a href="fm_detail.do?fm_no=${fb.fm_no}&pageNum=${pageNum}&fm_category=${fm_category}">${fb.fm_type}</a>
             </td>
             
             <td>
              <a href="fm_detail.do?fm_no=${fb.fm_no}&pageNum=${pageNum}&fm_category=${fm_category}">${fb.fm_place}</a>
             </td>
             
             <td>
              <a href="fm_detail.do?fm_no=${fb.fm_no}&pageNum=${pageNum}&fm_category=${fm_category}">${fb.fm_teamhome}</a>
             </td>
             
             <td>VS</td>
             
             <td>
              <a href="fm_detail.do?fm_no=${fb.fm_no}&pageNum=${pageNum}&fm_category=${fm_category}">${fb.fm_teamaway}</a>
             </td>
						
						<c:if test="${fm_category=='result'}">
             <td>
              <a href="fm_detail.do?fm_no=${fb.fm_no}&pageNum=${pageNum}&fm_category=${fm_category}">${fb.fm_score}</a>
             </td>
            </c:if>

						<c:if test="${fm_category!='result'}">
             <td>
							비고
             </td>
            </c:if>
                        
           </tr>
        </c:forEach>
      </table>
    
     </c:if>
     </td>
     </tr>
     
	<tr>
	<td>
	 <c:if test="${count>0 }">	   
	     
	     <%--이전페이지 --%>
	     <c:if test="${startPage > 10 }">
				<a href="fm_list.do?pageNum=${startPage-10}">[이전]</a>
		 	 </c:if>
	     
	     <%--페이지처리 --%>
	     <c:forEach var="i" begin="${startPage}"  end="${endPage}">
	      <a href="fm_list.do?pageNum=${i}">[${i}]</a>
	     </c:forEach>
	    
	     <%--다음 페이지 --%>
	     <c:if test="${endPage < pageCount }">
			  <a href="fm_list.do?pageNum=${startPage+10}">[다음]</a>
			 </c:if>
	    
	    
	 </c:if>
	</td>
	</tr>
     
     
   </table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8"/>
    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>cam_list.jsp</title>  
   <style>
	body .h4 {
	  margin-top: 0px;
	}
  </style> 
</head>
<body>
<section id="cam_list">
  <center><b>전체 글 갯수 :${count}</b></center>
   
   <table width="70%">
     <tr>
      <td align="right" colspan="2">
        <a href="cam_writeForm.do">글쓰기</a>
      </td>
     </tr>
     
     <tr><td>
     <c:if test="${count==0 }">
      	저장된 글이 없습니다
     </c:if>
     
     <c:if test="${count>0 }">
      <table border="1" >
       <tr align="center">
         <td width="7%" >글넘버</td>
         <td width="30%">글의 제목</td>
         <td width="13%">글쓴이</td>
         <td width="25%">언제썼나</td>
         <td width="8%">조회수</td>
         <td width="17%">아이피</td>
        </tr>
        
        <c:forEach var="dto" items="${list}">
           <tr align="center">
             <td >
               <c:out value="${number}"/>
               <c:set var="number" value="${number-1}"/>
             </td>           
             <td align="left" >
             <c:if test="${dto.cam_step>0}">
               <img src="resources/imgs/level.gif" width="${5*dto.cam_indent}" height="16">
               <img src="resources/imgs/re.gif">
             </c:if>
             
             <c:if test="${dto.cam_step==0}">
               <img src="resources/imgs/level.gif" width="${5*dto.cam_indent}" height="16">
             </c:if>
             
             <a href="cam_content.do?cam_no=${dto.cam_no}&pageNum=${pageNum}">${dto.cam_title}</a>
             
             <c:if test="${dto.cam_readcount>=20 }">
               <img src="resources/imgs/hot.png" border="0" height="18">
             </c:if>   
             </td>
             
             <td >${dto.cam_id}</td>
                          
             <td >
               <fmt:formatDate value="${dto.cam_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
             </td>    
                      
             <td > ${dto.cam_readcount}</td>
             
             <td > ${dto.cam_ip}</td>
             
            
           </tr>
           
           
        </c:forEach>
        
      </table>
     </c:if>
     </td>
     </tr>
     
	<tr align="center">
	<td>
	 <c:if test="${count>0 }">     
	     <%--이전페이지 --%>
	     <c:if test="${startPage > 10 }">
				<a href="cam_list.do?pageNum=${startPage-10}">[이전]</a>
		 </c:if>
	     
	     <%--페이지처리 --%>
	    <c:forEach var="i" begin="${startPage}"  end="${endPage}">
	      <a href="cam_list.do?pageNum=${i}">[${i}]</a>
	    </c:forEach>
	    
	    <%--다음 페이지 --%>
	    <c:if test="${endPage < pageCount }">
			<a href="cam_list.do?pageNum=${startPage+10}">[다음]</a>
		</c:if> 	    
	 </c:if>
	</td>
	</tr>
	     
   </table>
  
  
</body>
</html>
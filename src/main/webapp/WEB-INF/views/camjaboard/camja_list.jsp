<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cam_content.jsp</title>
<style>
body .h4 {
  margin-top: 0px;
}

</style>
</head>
<body>
<section id="camja_list">
<div><h4>캠핑 자유게시판</h4> 전체 글 갯수 : ${count}건</div>
   <form>
   <table  width="70%">
     <tr>
      <td align="right" colspan="2">
        <a href="camja_writeForm.do"><b>글쓰기</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
     </tr>
     
     <tr>
     	<td>
	     <c:if test="${count==0 }">
	      	저장된 글이 없습니다
	     </c:if>     
    	 <c:if test="${count>0 }">
     <table align="center">
       <tr height="70px">
         <td align="center" width="15%">글번호</td>
         <td align="center"width="25%">글제목</td>
         <td align="center" width="15%">글쓴이</td>
         <td align="center" width="15%">작성일</td>
         <td align="center" width="15%">조회</td>
         <td align="center" width="15%">IP</td>
       </tr>
        
        <c:forEach var="dto" items="${list}">
           <tr height="40px">
             <td align="center">
               <c:out value="${number}"/>
               <c:set var="number" value="${number-1}"/>
             </td>           
             <td>
             <c:if test="${dto.camja_step>0}">
               <img src="imgs/level.gif" width="${5*dto.camja_indent}" height="16">
               <img src="imgs/re.gif">
             </c:if>
             
             <c:if test="${dto.camja_step==0}">
               <img src="imgs/level.gif" width="${5*dto.camja_indent}" height="16">
             </c:if>
             
             <a href="camja_content.do?camja_no=${dto.camja_no}&pageNum=${pageNum}">${dto.camja_title}</a>
             
             <c:if test="${dto.camja_readcount>=20 }">
               <img src="imgs/hot.png" border="0" height="18">
             </c:if>   
             </td>
             
             <td align="center">${dto.mem_nick}</td>
                          
             <td align="center">
               <fmt:formatDate value="${dto.camja_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
             </td>    
                      
             <td align="center"> ${dto.camja_readcount}</td>
             
             <td align="center"> ${dto.camja_ip}</td>
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
				<a href="camja_list.do?pageNum=${startPage-10}">[이전]</a>
		 </c:if>
	     
	     <%--페이지처리 --%>
	    <c:forEach var="i" begin="${startPage}"  end="${endPage}">
	      <a href="camja_list.do?pageNum=${i}">[${i}]</a>
	    </c:forEach>
	    
	    <%--다음 페이지 --%>
	    <c:if test="${endPage < pageCount }">
			<a href="camja_list.do?pageNum=${startPage+10}">[다음]</a>
		</c:if> 	    
	 </c:if>
	</td>
	</tr>
	     
   </table>
  </form>
  
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8"/>
    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>cam_list.jsp</title>  
</head>
<body>
<div class="container list"><b><h4><a href="cam_list.do">캠핑장 리스트</a></h4>전체 글 갯수 :${count}</b><br/>

   <table width="70%" class="table">
     <tr>
     <c:if test="${mem_id=='admin'}">
      <td align="right" colspan="3">
        <a href="cam_writeForm.do">캠핑장 등록</a>
      </td>
      </c:if>
     </tr>     
     <c:if test="${count==0 }">
      	저장된 글이 없습니다
     </c:if>
     
     <c:if test="${count>0 }">     
    
       <tr align="center">
         <td width="15%" >캠핑장 번호</td>
         <td width="35%">캠핑장 구분</td>
          <td width="50%">캠핑장 이름 </td>
       </tr>
        <c:forEach var="dto" items="${list}">
           <tr align="center">
             <td >
               <c:out value="${number}"/>
               <c:set var="number" value="${number-1}"/>
             </td>        
                             
             <td >${dto.gdsCat}</td>                       
           
             <td align="left" >             
             <a href="cam_content.do?gdsNo=${dto.gdsNo}&pageNum=${pageNum}">${dto.gdsName}</a>
             </td>
             
           </tr>
        </c:forEach>
        </c:if>
     		
     	</table>  	
     </div>

       <div class="container list">
       <table class="table"> 
        <tr align="center">
			<td align="center">
				<form method="post" action="campsearch.do" >
					<div style='display:inline;'>
					<select name="searchType" style='display:inline;'>
						<option value="gdsName">검색어를 입력해주세요</option>
						<option value="gdsCat">야영장, 자동차야영장 중 입력해주세요</option>		
					</select>
					<input type="text" name="searchValue" >
					<input type="submit" value="검색" >
					<input type="hidden" name="gdsCat" value="${gdsCat_search}" >
					</div>	
				</form>
			</td>
		</tr>
		</table>
   
    
     
     <table class="table">
	<tr align="center">
	<td>
	 <c:if test="${count>0 && searchType==null}">     
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
	 
	 <c:if test="${count>0 && searchType!=null}">     
	     <%--이전페이지 --%>
	     <c:if test="${startPage > 10 }">
				<a href="campsearch.do?pageNum=${startPage-10}&gdsCat=${gdsCat_search}&searchType=${searchType}&searchValue=${searchValue}">[이전]</a>
		 </c:if>
	     
	     <%--페이지처리 --%>
	    <c:forEach var="i" begin="${startPage}"  end="${endPage}">
	      <a href="campsearch.do?pageNum=${i}&gdsCat=${gdsCat_search}&searchType=${searchType}&searchValue=${searchValue}">[${i}]</a>
	    </c:forEach>
	    
	    <%--다음 페이지 --%>
	    <c:if test="${endPage < pageCount }">
			<a href="campsearch.do?pageNum=${startPage+10}&gdsCat=${gdsCat_search}&searchType=${searchType}&searchValue=${searchValue}">[다음]</a>
		</c:if> 	    
	 </c:if>
	</td>
	</tr>
	
   </table>
  </div>
</body>
</html>
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
 

   <!-- <link rel="stylesheet" href="https://plab-football.s3.amazonaws.com/static/css/styles.css?1589871263"> -->
   <!-- <link rel="stylesheet" href="resources/css/flab.css"> -->
				<link rel="stylesheet" href="resources/assets/css/flab2.css">

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>

   <style type="text/css">
	   	   
	 	img {display:block; margin: 0px auto; width:50%;}
	   
  
		#matchDate{
    padding:0px;
    border-radius: 60px;
    text-align: center;
		background:yellow;
		width: 80px;
}  

		#matchReply {
    padding: 0px;
    border-radius: 80px;
		background:silver;		
    text-align: center;
		width: 30px;
}

		.matchStatus {
    padding: 5px;
    border-radius: 10px;
    text-align: center;
		background: #5FD080;
		color: white;
}


  @media ( max-width: 720px ){
   #time{
   display: 10%;
   }
	#place{
	display: 30%;
	}
	#mem_nick{
	display: none;
	}
	#team{
	display: 30%;	
	}
	#ball{
	display: 20%;
	}
	
}
  
</style>   
   

   
   
</head>
<body>

     <c:if test="${fm_category=='match'}">
 			<center><h2>경기매치</h2></center>    	
		 </c:if>

     <c:if test="${fm_category=='result'}">
 			<center><h2>경기결과</h2></center>    	
		 </c:if>



	<center><b>전체/ ${count}게시물</b></center>

<c:if test="${fm_category=='match'||fm_category=='result'||fm_category==null}">   
   
    <c:if test="${fm_category!=null&&mem_id!=null||sessionScope.mem_grade=='admin'}">
      <div align="right">
        <a href="fm_writeForm.do?fm_category=${fm_category}">글쓰기</a>
      </div>
 		</c:if>
       
       <c:forEach var="dto" items="${list}">

            <li class="list match">
                
                  <div class="listCol2 tac" id="time">
                    <p class="txt2">${dto.fm_mdate}</p>
                    <p class="txt3 w700" >${dto.fm_time}</p>
                  </div>
                  
                  <div class="listCol3" id="place">
                                      
                    <div class="matchTitle">
                      <p class="txt3" >${dto.fm_place} </p>
                    </div>
                    
                    <div class="tag match">
                      <p class="tagList  male ">남성매치</p>
                      <p class="level  every ">일반</p>
                    </div>
                  </div>
 
                   <div class="listCol3" id="team">
                   
                     	<div class="matchDate" >
                      	<p class="txt3 w700">${dto.fm_teamhome}&nbsp;VS&nbsp;${dto.fm_teamaway}
                    	</div>
                   
                      <c:if test="${fm_category=='result'||fm_category==null}">                                  
		                    <div id="matchDate">
    		                  <p class="txt2 w700" >결과 ${dto.fm_score}</p>
        		            </div>
                      </c:if>
                   
 									 </div>                 
                  
                  
                  <div class="listCol1">
                    <div id="matchReply">
                      <p class="txt2 w700">                	
												${dto.fm_cmt_cnt}
                    	</p>
                    </div>
                  </div>

                  <div class="listCol1">
                    <div class="matchTitle ">
                      <p class="txt2">                	
												 ${dto.fm_type}
                    	</p>
                    </div>
                  </div>


                  <div class="listCol1" id="ball">
                    <div class="matchStatus "> 
                      <p class="txt2" > 
 					             <a href="fm_detail.do?fm_no=${dto.fm_no}&pageNum=${pageNum}&fm_category=${fm_category}"><img src="resources/imgs/sball.png"></a>
                    	</p>
                    </div>
                  </div>
               
                
                <hr>
            

            </li>
            

   </c:forEach>
 </c:if>
  
  <br>
  
	<form method="post" action="fm_search.do?fm_category=${fm_category}">
 	<select name="searchType">
		<option value="fm_teamhome">홈팀</option>
		<option value="fm_teamaway">어웨이팀</option>
		<option value="fm_place">장소</option>		
		<option value="fm_type">축구/풋살</option>		
	</select>
	<input type="text" name="searchValue">
	<input type="submit" value="검색">
  </form>
  
     
 <table>  
	<tr>
	<td>
	 <c:if test="${count>0 && searchType==null}">	   
	     
	     <%--이전페이지 --%>
	     <c:if test="${startPage > 10 }">
				<a href="fm_list.do?pageNum=${startPage-10}&fm_category=${fm_category}">[이전]</a>
		 	 </c:if>
	     
	     <%--페이지처리 --%>
	     <c:forEach var="i" begin="${startPage}"  end="${endPage}">
	      <a href="fm_list.do?pageNum=${i}&fm_category=${fm_category}">[${i}]</a>
	     </c:forEach>
	    
	     <%--다음 페이지 --%>
	     <c:if test="${endPage < pageCount }">
			  <a href="fm_list.do?pageNum=${startPage+10}&fm_category=${fm_category}">[다음]</a>
			 </c:if>
	    
	    
	 </c:if>

	 <c:if test="${count>0 && searchType!=null}">	   
	     
	     <%--이전페이지 --%>
	     <c:if test="${startPage > 10 }">
				<a href="fm_search.do?pageNum=${startPage-10}&fm_category=${fm_category}&searchType=${searchType}&searchValue=${searchValue}">[이전]</a>
		 	 </c:if>
	     
	     <%--페이지처리 --%>
	     <c:forEach var="i" begin="${startPage}"  end="${endPage}">
	      <a href="fm_search.do?pageNum=${i}&fm_category=${fm_category}&searchType=${searchType}&searchValue=${searchValue}">[${i}]</a>
	     </c:forEach>
	    
	     <%--다음 페이지 --%>
	     <c:if test="${endPage < pageCount }">
			  <a href="fm_search.do?pageNum=${startPage+10}&fm_category=${fm_category}&searchType=${searchType}&searchValue=${searchValue}">[다음]</a>
			 </c:if>
	    
	    
	 </c:if>
	 
	</td>
	</tr>
     
     
   </table>
</body>
</html>
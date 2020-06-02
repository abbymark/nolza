<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
   #rate{
   display: none;
   }
   #location{
   display: none;
   }
   #like{
   display: none;
   }
   
}
  
</style>   
</head>
<body>
	<c:choose>
		<c:when test="${book_type_eng==null }">
			<h1>전체게시판</h1>
		</c:when>
		<c:when test="${book_type_eng =='free'}">
			<h1>자유게시판</h1>
		</c:when>
		<c:when test="${book_type_eng =='recommendNonFiction'}">
			<h1>비소설 추천</h1>
		</c:when>
		<c:when test="${book_type_eng =='recommendFiction'}">
			<h1>소설 추천</h1>
		</c:when>
		<c:when test="${book_type_eng =='readingGroup'}">
			<h1>독서 모임</h1>
		</c:when>
		<c:when test="${book_type_eng =='debate'}">
			<h1>토론</h1>
		</c:when>
	</c:choose>
	
	<center><b>전체 글 갯수:${count }</b></center>
	<div class="container list" style="text-align:center;">
	<table class="table">
		<c:if test="${mem_id!=null && book_type!=null}">
			<tr>
				<td align="right" colspan="2">
					<a href="book_writeForm.do?book_type=${book_type }">글쓰기</a>
				</td>
			</tr>
		</c:if>
		<tr>
			<td>
				<c:if test="${count>0 }">
					<table align="center" width="100%">
						<tr>
							<td id="no">글번호</td>
							<td id="category">글 종류</td>
							<td id="title">글제목</td>
							<c:if test="${book_type_eng =='recommendNonFiction' || book_type_eng =='recommendFiction'}">
								<td id="rate">평점</td>
							</c:if>
							<c:if test="${book_type_eng =='readingGroup'}">
								<td id="location">장소</td>
							</c:if>
							<td id="mem_nick">작성자</td>
							<td id="date">작성일</td>
							<td id="readcount">조회</td>
							<td id="like">추천</td>
							<c:if test="${mem_grade=='admin' }">
								<td id="ip">ip</td>
							</c:if>
						</tr>
						
						<c:forEach var="book_dto" items="${list }">
							<tr>
								<td id="no">
									<c:out value="${number }"/>
									<c:set var="number" value="${number-1 }"/>
								</td>
								<td id="category">
									${book_dto.book_type }
								</td>
								<td>
									<c:if test="${book_dto.book_indent>0}">
										<img src="resources/imgs/level.gif" width="${5*book_dto.book_indent }" height="16">
										<img src="resources/imgs/re.gif">
									</c:if>
									
									<c:if test="${book_dto.book_indent==0 }">
										<img src="resources/imgs/level.gif" width="${5*book_dto.book_indent }" height="16">
									</c:if>
									
									<a href="book_content.do?book_no=${book_dto.book_no }&pageNum=${pageNum}">${book_dto.book_title } 
									<c:if test="${book_dto.book_cmt_cnt !=0}">
									[${book_dto.book_cmt_cnt }]
									</c:if>
									</a>
									<c:if test="${book_dto.book_readcount>=20 }">
										<img src="resources/imgs/hot.gif" border="0">
									</c:if>
								</td>
								
								<c:if test="${book_type_eng =='recommendNonFiction' || book_type_eng =='recommendFiction'}">
								<td id="rate">
									<c:choose>
										<c:when test="${book_dto.book_rating == 1}">
											<img src="resources/imgs/star-on.svg">
										</c:when>
										<c:when test="${book_dto.book_rating == 2}">
											<img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg">
										</c:when>
										<c:when test="${book_dto.book_rating == 3}">
											<img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg">
										</c:when>
										<c:when test="${book_dto.book_rating == 4}">
											<img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg">
										</c:when>
										
										<c:when test="${book_dto.book_rating == 5}">
											<img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg">
										</c:when>
									</c:choose>
									
								</td>
								</c:if>
								
								<c:if test="${book_type_eng =='readingGroup'}">
									<td id="location">
										${book_dto.book_location }
									</td>
								</c:if>
								
								<td id="mem_nick">
									${book_dto.mem_nick }
								</td>
								
								
								<td id="date">
									<fmt:formatDate value="${book_dto.book_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
								
								<td id="readcount">${book_dto.book_readcount }</td>
								<td id="like">${book_dto.book_like }</td>
								<c:if test="${mem_grade='admin' }">
									<td id="ip">${book_dto.book_ip }</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td>
				<form method="post" action="book_search.do" align="center">
					<select name="searchType">
						<option value="mem_nick">작성자</option>
						<option value="book_title">글 제목</option>		
					</select>
					<input type="text" name="searchValue">
					<input type="submit" value="검색">
					<input type="hidden" name="book_type" value="${book_type_eng}">
				</form>
			</td>
		</tr>
		
		<tr>
			<td>
				<c:if test="${count>0 && searchType==null}">
					<%-- 이전페이지 --%>
					<c:if test="${startPage > 10}">
						<a href="book_list.do?pageNum=${startPage-10}&book_type=${book_type_eng }">[이전]</a>
					</c:if>
					
					<%-- 페이지처리 --%>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<a href="book_list.do?pageNum=${i }&book_type=${book_type_eng }">[${i }]</a>
					</c:forEach>
					
					<%-- 다음페이지 --%>
					<c:if test="${endPage < pageCount}">
						<a href="book_list.do?pageNum=${startPage+10}&book_type=${book_type_eng }">[다음]</a>
					</c:if>
				</c:if>
				
				
				<c:if test="${count>0 && searchType!=null}">
					<%-- 이전페이지 --%>
					<c:if test="${startPage > 10}">
						<a href="book_search.do?pageNum=${startPage-10}&book_type=${book_type_eng }&searchType=${searchType}&searchValue=${searchValue}">[이전]</a>
					</c:if>
					
					<%-- 페이지처리 --%>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<a href="book_search.do?pageNum=${i }&book_type=${book_type_eng }&searchType=${searchType}&searchValue=${searchValue}">[${i }]</a>
					</c:forEach>
					
					<%-- 다음페이지 --%>
					<c:if test="${endPage < pageCount}">
						<a href="book_search.do?pageNum=${startPage+10}&book_type=${book_type_eng }&searchType=${searchType}&searchValue=${searchValue}">[다음]</a>
					</c:if>
				</c:if>
			</td>
		</td>
	</table>
	</div>
</body>
</html>























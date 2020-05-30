<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		
	
<!DOCTYPE html>
<html lang="en">
<head>
<title>CSS Website Layout</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
   
}

/* Style the header */
.header {
  background-color: #f1f1f1;
  padding: 20px;
  text-align: center;
}

/* Style the top navigation bar */
.topnav {
  overflow: hidden;
  background-color: #333;
}

/* Style the topnav links */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Create three unequal columns that floats next to each other */
.column {
  float: left;
  padding: 10px;
}

/* Left column */
.column.left {
  width: 25%;
}

/* middle column */
.column.middle {
  width: 3%;
}

/* right column */
.column.right {
  width: 70%;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .column.side, .column.middle {
    width: 100%;
  }
}
</style>
</head>

<!-- 나중에 스타일 시트 적용하기 -->

<body>

<div class="header">
  <h1>Header</h1>
  <p>Resize the browser window to see the responsive effect.</p>
</div>

<div class="topnav">
  <a href="#">Link</a>
  <a href="#">Link</a>
  <a href="#">Link</a>
</div>

<div class="row">
 
  <div class="column middle">
	
	<!-- 내용 들어가는 부분 -->
		
  </div>

  <div class="column left">
	<!-- 내용 들어가는 부분 -->
	
	<!-- bread_name이 찍힌다, 따라서 c:if절 돌려 줘서 출력 가능하다 -->
	
	<c:if test="${bread_name == '어글리베이커리'}">
			<jsp:include page="location1.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${bread_name == '아우어베이커리가로수길점'}">
			<jsp:include page="location2.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${bread_name == '홍철책빵'}">
			<jsp:include page="location3.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${bread_name == '타르틴베이커리도산점'}">
			<jsp:include page="location4.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${bread_name == '쟝블랑제리'}">
			<jsp:include page="location5.jsp"></jsp:include>
	</c:if>
	
  </div>
  
   <div class="column middle">
	
	<!-- 내용 들어가는 부분 -->
		
  </div>
  
  
  <div class="column right">
	
	<!-- 내용 들어가는 부분 -->
	
	
	
		
		<jsp:include page="content_right.jsp"></jsp:include>
		
  </div>
  
 
  
</div>
  
</body>
</html>
  
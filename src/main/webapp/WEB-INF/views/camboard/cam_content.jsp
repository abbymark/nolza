<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cam_content.jsp</title>
<!-- Favicons -->
  <link href="assets/img/go.png" rel="icon">
  <link href="assets/img/go.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Mentor - v2.0.0
  * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>
<section id="cam_content" class="d-flex justify-content-center align-items-center">
<div><h2>글 내용 보기</h2></div><br/>
<table align="center" width=70%>
	<tr>
		<td>글번호</td>
		<td>${dto.cam_no}</td>
		<td>조회수</td>
		<td>${dto.cam_readcount }</td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td>${dto.cam_id}</td>
		<td>작성일</td>
		<td>
		
		<fmt:formatDate value="${dto.cam_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</td>
	</tr>
	<tr>
		<td>글제목</td>
		<td colspan="3">${dto.cam_title}</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3">
		<pre>
		${cam_content}  <!-- ******************** -->
		</pre>
		</td>
	</tr>
	<tr>
		<td>
		</td>
	</tr>
	
	
	
	<tr>
		<td colspan="4" align="center">
		<input type="button" value="글수정" onclick="document.location.href='cam_updateForm.do?cam_no=${dto.cam_no}&pageNum=${pageNum}'"/>
		<input type="button" value="글삭제" onclick="document.location.href='cam_delete.do?cam_no=${dto.cam_no}&pageNum=${pageNum}'"/>
		<input type="button" value="답글쓰기" onclick="document.location.href='cam_writeForm.do?cam_no=${dto.cam_no}&cam_group=${dto.cam_group}&cam_step=${dto.cam_step}&cam_indent=${dto.cam_indent}'"/>
		<input type="button" value="글목록" onclick="document.location.href='cam_list.do?pageNum=${pageNum}'"/>
		</td>
	</tr>
</table>
</section>

<!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="assets/vendor/counterup/counterup.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
</html>
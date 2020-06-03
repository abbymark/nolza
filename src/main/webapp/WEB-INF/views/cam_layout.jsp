<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cam_layout.jsp</title>
 <link href="resources/assets/img/go.png" rel="icon">
  <link href="resources/assets/img/go.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">


<style>
#footer  {
    position: relative;
    left: 0;
    bottom: 0;
    width: 100%;
	padding: 15px 0;
}
/* #header
{
    position: absolute;
    left: 0;
    
    width: 100%;
	padding: 15px;
} */
</style>
<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<table  style="width: 100%; height:933px; border-collapse: collapse; ">
		<tr>
			<td colspan="2" height="20px" align="right" id="header">
				<tiles:insertAttribute name="cam_header"/>&nbsp;<!-- header.jsp -->
			</td>
		</tr>
		
		<tr>
			<td  align="center" >
				<tiles:insertAttribute name="cam_content"/><!-- 중앙에 표시 -->
			</td>
		</tr>
		<tr>
			<td colspan="2" height="83px" id="footer">
				<tiles:insertAttribute name="cam_footer"/><!--footer.jsp -->
			</td>
		</tr>
	</table>
	 <!-- Vendor JS Files -->
	  <script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	  <script src="resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	  
	  <script src="resources/assets/vendor/php-email-form/validate.js"></script>
	  <script src="resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	  
	  <script src="resources/assets/vendor/counterup/counterup.min.js"></script>
	  <script src="resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	  <script src="resources/assets/vendor/aos/aos.js"></script>
	  
		
	  <!-- Template Main JS File -->
	  <script src="resources/assets/js/main.js"></script>
</body>
</html>

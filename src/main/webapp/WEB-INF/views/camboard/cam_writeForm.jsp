<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>cam_write</title>
 
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
</head>
<body>


	<center><h2>글쓰기</h2></center>
	<!-- <form name="frm" action="action.do" method="post" encType="multipart/form-data"> -->
	<form method="post" name="cam_writeForm" action="action.do" encType="multipart/form-data">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="cam_no" value="${cam_no}">
		<input type="hidden" name="cam_group" value="${cam_group}">
		<input type="hidden" name="cam_step" value="${cam_step}">
		<input type="hidden" name="cam_indent" value="${cam_indent}">
	<div id="container_box">
			<h2>상품 등록</h2>
			
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
			
			<div class="inputArea">
				<label for="gdsNo">캠핑장번호</label>
				<input type="text" id="gdsNo" name="gdsNo" />
			</div>
			
			<div class="inputArea">
				<label for="gdsName">캠핑장명</label>
				<input type="text" id="gdsName" name="gdsName" />
			</div>
			
			
			<div class="inputArea">
				<label for="gdsPrice">캠핑장 종류</label>
				<input type="text" id="gdsCat" name="gdsCat" />
			</div>
			
			<div class="inputArea">
				<label for="gdsNewadd">도로명 주소</label>
				<input type="text" id="gdsNewadd" name="gdsNewadd" />
			</div>
			
			<div class="inputArea">
				<label for="gdsOldadd">구 주소</label>
				<input type="text" id="gdsOldadd" name="gdsOldadd" />
			</div>
			<div class="inputArea">
				<label for="gdsOldadd">전화번호</label>
				<input type="text" id="gdsOldadd" name="gdsOldadd" />
			</div>
			<div class="inputArea">
				<label for="gdsOldadd">사이트 수</label>
				<input type="text" id="gdsOldadd" name="gdsOldadd" />
			</div>
			<div class="inputArea">
				<label for="gdsOldadd">주자가능 대수</label>
				<input type="text" id="gdsOldadd" name="gdsOldadd" />
			</div>
			<div class="inputArea">
				<label for="gdsOldadd">구 주소</label>
				<input type="text" id="gdsOldadd" name="gdsOldadd" />
			</div>
			<div class="inputArea">
				<label for="gdsCon">편의시설</label>
				<input type="text" id="gdsCon" name="gdsCon" />
			</div>
			<div class="inputArea">
				<label for="gdsSafe">안전시설</label>
				<input type="text" id="gdsSafe" name="gdsSafe" />
			</div>
			<div class="inputArea">
				<label for="gdsEtc">기타 부대시설</label>
				<input type="text" id="gdsEtc" name="gdsEtc" />
			</div>
			<div class="inputArea">
				<label for="gdsUtime">이용기준시간</label>
				<input type="text" id="gdsUtime" name="gdsUtime" />
			</div>
			<div class="inputArea">
				<label for="gdsPrice">이용요금</label>
				<input type="text" id="gdsPrice" name="gdsPrice" />
			</div>
			
			<div class="inputArea">
				<label for="gdsImg">이미지</label>
				<input type="file" id="gdsImg" name="file" />
				<div class="select_img"><img src="" /></div>
				
				<script>
					$("#gdsImg").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src", data.target.result).width(500);								
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				</script>
				
				<%=request.getRealPath("/") %>
				
			</div>
			
			<div class="inputArea">
				<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
			</div>
			
			</form>
			
		</div>
	</form>
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
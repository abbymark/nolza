<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Nolza</title>
 
  <!-- Favicons -->
  <link href="assets/img/nolza.png" rel="icon">
  <link href="assets/img/nolza.png" rel="apple-touch-icon">

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
<!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="/nolza/">Nolza</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li><a href="/nolza/">Main</a></li>
          <li class="drop-down"><a href="">도서</a>
            <ul>
              <li class="drop-down"><a href="#">도서1</a>
                <ul>
                  <li ><a href="#">1-1</a></li>
                  <li><a href="#">1-2</a></li>
                  <li><a href="#">1-3</a></li>
                </ul>
              </li>
              <li class="drop-down"><a href="#">도서2</a>
              <ul>
                  <li><a href="#">2-1</a></li>
                  <li><a href="#">2-2</a></li>
                  <li><a href="#">2-3</a></li>
               </ul></li>
              <li><a href="#">도서3</a></li>
              <li><a href="#">도서4</a></li>
            </ul>
          </li>
          
          <li class="drop-down"><a href="">맛집</a>
            <ul>
              <li class="drop-down"><a href="#">1</a>
                <ul>
                  <li><a href="#">1-1</a></li>
                  <li><a href="#">1-2</a></li>
                  <li><a href="#">1-3</a></li>
                </ul>
              </li>
              <li class="drop-down"><a href="#">2</a>
              <ul>
                  <li><a href="#">2-1</a></li>
                  <li><a href="#">2-2</a></li>
                  <li><a href="#">2-3</a></li>
               </ul></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
            </ul>
          </li>
          
          <li class="drop-down"><a href="">음악</a>
            <ul>
              <li class="drop-down"><a href="#">1</a>
                <ul>
                  <li><a href="#">1-1</a></li>
                  <li><a href="#">1-2</a></li>
                  <li><a href="#">1-3</a></li>
                </ul>
              </li>
              <li class="drop-down"><a href="#">2</a>
              <ul>
                  <li><a href="#">2-1</a></li>
                  <li><a href="#">2-2</a></li>
                  <li><a href="#">2-3</a></li>
               </ul></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
            </ul>
          </li>
          
          <li class="drop-down"><a href="">축구</a>
            <ul>
              <li class="drop-down"><a href="#">1</a>
                <ul>
                  <li><a href="#">1-1</a></li>
                  <li><a href="#">1-2</a></li>
                  <li><a href="#">1-3</a></li>
                </ul>
              </li>
              <li class="drop-down"><a href="#">2</a>
              <ul>
                  <li><a href="#">2-1</a></li>
                  <li><a href="#">2-2</a></li>
                  <li><a href="#">2-3</a></li>
               </ul></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
            </ul>
          </li>
          
          
          <li class="drop-down"><a href="/nolza/">캠핑</a>
            <ul>
              <li><a href="cam_list.do">캠핑장 검색</a></li>
              <li class="drop-down"><a href="#">캠핑정보</a>
	              <ul>
	                  <li><a href="#">캠핑장비 정보</a></li>
	                  <li><a href="#">캠핑요리 정보</a></li>
	                  <li><a href="#">캠핑 유투버</a></li>
	               </ul>
               </li>
              <li><a href="camja_list.do">자유게시판</a></li>
            </ul>
          </li>
          
          <li><a href="insertForm.do">가입하기</a></li>
        </ul>
      </nav><!-- .nav-menu -->

      <a href="login.do" class="get-started-btn">로그인</a>

    </div>
  </header>
  
  <!--  End Header -->
  
  
  <style>
#footer {
    position:absolute;
    bottom:0;
    width:100%;
    padding : 0;
}

</style>
</head>

<body>
<br/><br/><br/><br/><br/>
   
    <!-- ======= Features Section ======= -->
    <section id="features" class="features">
      <div class="container" data-aos="fade-up">

        <div class="row" data-aos="zoom-in" data-aos-delay="100">
          <div class="col-lg-3 col-md-4">
            <div class="icon-box">
              <i class="ri-book-3-fill" style="color: #ffbb2c;"></i>
              <h3><a href="">도서</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="ri-restaurant-line" style="color: #5578ff;"></i>
              <h3><a href="">맛집</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="ri-music-2-line" style="color: #e80368;"></i>
              <h3><a href="">음악</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 mt-4 mt-lg-0">
            <div class="icon-box">
              <i class="ri-football-fill" style="color: #e361ff;"></i>
              <h3><a href="">축구</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 mt-4">
            <div class="icon-box">
              <i class="ri-landscape-line" style="color: #47aeff;"></i>
              <h3><a href="">캠핑 등산 백패킹</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 mt-4">
            <div class="icon-box">
              <i class="ri-gradienter-line" style="color: #ffa76e;"></i>
              <h3><a href="">뭐 하고 노니?</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 mt-4">
            <div class="icon-box">
              <i class="ri-file-list-3-line" style="color: #11dbcf;"></i>
              <h3><a href="">놀때 머해?</a></h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 mt-4">
            <div class="icon-box">
              <i class="ri-price-tag-2-line" style="color: #4233ff;"></i>
              <h3><a href="">같이 놀자</a></h3>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Features Section --></br/>
    

    


  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      
    <div class="container d-md-flex py-4">

      <div class="mr-md-auto text-center text-md-left">
        <div class="copyright">
          &copy; Copyright<br/>
          <strong><span>경영기술개발교육원 2020년 1차 스마트웹앱컨텐츠 개발자 과정  <br/>
           A team : 권지환, 김명운, 안명철, 이상현, 황가연. </span></strong><br/>All Rights Reserved.
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/ -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer><!-- End Footer -->
  

  <a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>
  <div id="preloader"></div>

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
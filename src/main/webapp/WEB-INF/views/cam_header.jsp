<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>놀자 Nolza</title>
 


</head>

<body>

   <!-- ======= Header ======= -->
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="/nolza/">Nolza</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block ">
        <ul>
          <li class="drop-down"><a href="book_list.do">도서</a>
            <ul>              
              <li><a style="cursor:pointer;" onclick="location.href='book_list.do'">전체게시판</a></li>
              <li><a style="cursor:pointer;" onclick="location.href='book_list.do?book_type=free'">자유게시판</a></li>
              <li><a style="cursor:pointer;" onclick="location.href='book_list.do?book_type=recommendNonFiction'">비소설추천</a></li>
              <li><a style="cursor:pointer;" onclick="location.href='book_list.do?book_type=recommendFiction'">소설추천</a></li>
              <li><a style="cursor:pointer;" onclick="location.href='book_list.do?book_type=readingGroup'">독서 모임</a></li>
              <li><a style="cursor:pointer;" onclick="location.href='book_list.do?book_type=debate'">토론</a></li>
              <li><a style="cursor:pointer;" onclick="location.href='book_info.do'">책정보</a></li>
            </ul>
          </li>
          
           <li class="drop-down">
             <a href="map_main">맛집</a>
            <ul>
              <li><a href="mat_list">전체게시판</a></li>
              <li><a href="mat_list2">자유게시판</a></li>
              <li><a href="mat_list3">맛집추천게시판</a></li>
                <li><a href="map_main">빵지 순례도</a></li>
            </ul>
          </li>
          
          <li class="drop-down"><a href="">음악</a>
            <ul>
              	<li><a href="/nolza/albumMainList.do">앨범</a></li>
				<li><a href="/nolza/singerMainList.do">가수</a></li>
				<li><a href="/nolza/list.do">커뮤니티</a></li>
				<li><a href="/nolza/nmainList.do">공지사항</a></li>
            </ul>
          </li>
          
          <li class="drop-down"><a href="">축구</a>
            <ul>
              <li class="drop-down"><a href="#">커뮤니티</a>
                <ul>
                  <li><a onClick="location.href='fb_list.do'">전체게시판</a></li>
                  <li><a onClick="location.href='fb_list.do?fb_category=free'">자유게시판</a></li>
                  <li><a onClick="location.href='fb_list.do?fb_category=info'">정보게시판</a></li>
                  <li><a onClick="location.href='fb_list.do?fb_category=media'">축&풋 동영상</a></li>
                  <li><a onClick="location.href='fb_list.do?fb_category=solo'">용병신청&구함</a></li>
                  <li><a onClick="location.href='fb_list.do?fb_category=team'">팀원신청&구함</a></li>
                </ul>
              </li>

              <li class="drop-down"><a href="#">매치게시판</a>
              	<ul>
                  <li><a onClick="location.href='fm_list.do?fm_category=match'">경기매치</a></li>
                  <li><a onClick="location.href='fm_list.do?fm_category=result'">경기결과</a></li>
               	</ul>
         		 </li>
          	</ul>
          </li>
          
          
          <li class="drop-down"><a href="/nolza/">캠핑</a>
            <ul>
              <li><a href="cam_list.do">캠핑장 검색</a></li>
              <!-- <li class="drop-down"><a href="#">2</a>
                 <ul>
                     <li><a href="#">2-1</a></li>
                     <li><a href="#">2-2</a></li>
                     <li><a href="#">2-3</a></li>
                  </ul> 
               </li>-->
              <li><a href="camja_list.do">자유게시판</a></li>
            </ul>
          </li>
         
        </ul>
      </nav><!-- .nav-menu -->
	
	   <c:if test="${mem_id==null }">
         	<a href="mem_insertForm.do" class="get-started-btn">가입하기</a>
	        <a href="mem_login.do" class="get-started-btn">로그인</a>
	   </c:if>
   
   <c:if test="${mem_id !=null}">
      
      <c:if test="${mem_id != 'admin'}" >
         <a href="mem_editForm.do?mem_id=${mem_id}" class="get-started-btn">마이페이지</a>
         <a href="mem_logout.do" class="get-started-btn">로그아웃</a>
      </c:if>
      
      <c:if test="${mem_id == 'admin'}" >
         <a href="admin_list" class="get-started-btn">회원관리 리스트</a>
         <a href="mem_logout.do" class="get-started-btn">로그아웃</a>
      </c:if>
      
      
      
   </c:if>
    </div>
  <!-- End Header -->
  </body>
  </html>
  
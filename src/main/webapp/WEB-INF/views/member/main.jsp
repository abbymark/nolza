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
  <script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>

</head>

<body>
<!-- main -->
<table border="1">
	<tr>
		<td>
			<h3>도서 게시판</h3>
		</td>
		<td>
			<h3>축구 게시판</h3>
		</td>
	</tr>
	<tr>
		<td>
			<table align="center" width="100%">
				<tr>
					<td>글 종류</td>
					<td>글제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회</td>
					<td>추천</td>
					<c:if test="${mem_grade=='admin' }">
						<td>ip</td>
					</c:if>
				</tr>
				
				<c:forEach var="book_dto" items="${list }">
					<tr>
						<td>
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

						<td>
							<em>${book_dto.mem_nick }</em>
						</td>
						
						
						<td>
							<fmt:formatDate value="${book_dto.book_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						
						<td>${book_dto.book_readcount }</td>
						<td>${book_dto.book_like }</td>
						<c:if test="${mem_grade='admin' }">
							<td>${book_dto.book_ip }</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</td>
		
		
		
		
		
		
		<td>
			<table border="1">
		       <tr>
		         <td>카테고리</td>
		         <td>제목</td>
		         <td>아이디</td>
		         <td>닉네임</td>
		         <td>작성일</td>
		         <td>조회</td>
		         <td>ip</td>
		        </tr>
		        
		        <c:forEach var="fb" items="${list2}">
		           <tr>             
		             <td>${fb.fb_category}</td>
		             
		             <td>
		             <c:if test="${fb.fb_indent>0}">
		               <img src="resources/imgs/level.gif" width="${5*fb.fb_indent}" height="16">
		               <img src="resources/imgs/re.gif">
		             </c:if>
		             
		             <c:if test="${fb.fb_indent==0}">
		               <img src="resources/imgs/level.gif" width="${5*fb.fb_indent}" height="16">
		             </c:if>
		             
		             &nbsp;[${fb.fb_type }]
		             <a href="fb_content.do?fb_no=${fb.fb_no}&pageNum=${pageNum}&fb_category=${fb_category}">${fb.fb_title}</a>
		             <c:if test="${fb.fb_readcount>=20 }">
		               <img src="resources/imgs/hot.gif" border="0">
		             </c:if>
		             
		             &nbsp;&nbsp;(&nbsp;${fb.fb_cmt_cnt}&nbsp;)
		             </td>
		             
		             <td>${fb.mem_id}</td>
		             <td><em>${fb.mem_nick}</em></td>
		             
		             
		             <td>
		               <fmt:formatDate value="${fb.fb_date}" pattern="yyyy-MM-dd HH:mm"/>
		             </td>
		             
		             <td> ${fb.fb_readcount}</td>
		             <td> ${fb.fb_ip}</td>
		           </tr>
		           
		        </c:forEach>
		      </table>
		</td>
	</tr>
	
	
	<tr>
		<td>
			<h3>맛집 게시판</h3>
		</td>
		<td>
			<h3>캠핑 게시판</h3>
		</td>
	</tr>
	
	<tr>
		<td>
			<table class="table">
			
			
				<thead>
					<tr>
						<th>번호</th>
						<th>말머리</th>
						<th>제목</th>
						<th>닉네임</th>
						<th>작성일</th>
						<th>조회</th>
						<th>추천</th>
					</tr>
				</thead>
			
				<tbody>
					<!--상단 공지사항-->
					<tr class="ub-content us-post" data-type="icon_notice">
						<td class="gall_num">196828</td>
						<td class="gall_subject"><b>공지</b></td>
						<td class="gall_tit ub-word"><a href="#"><em
								class="icon_img icon_notice"></em> <b>자유 게시판 가이드 모음집</b> </a> <a
							class="reply_numbox" href="#"> <span class="reply_num">[17]</span>
								<!-- 위치 수정하기 -->
						</a></td>
						<td class="gall_writer ub-writer" data-uid="davidd3" data-ip=""
							data-loc="list"><span class="nickname in"><em>admin</em></span>
							<a class="writer_nikcon"> <img
								src="https://nstatic.dcinside.com/dc/w/images/fix_nik.gif"
								border="0" width="12" height="11"
								style="margin-left: 2px; cursor: pointer;"
								alt="갤로그로 이동합니다."> <!-- 위치 수정하기 -->
						</a></td>
						<td class="gall_date">19.03.03</td>
						<td class="gall_count">20253</td>
						<td class="gall_recommend">22</td>
					</tr>
			
					<!-- 내용 -->
					<c:forEach var="dto" items="${mat_list3}">
						
						
						<!-- 리스트 -->
						<tr>
							<td>
								<!-- 글 번호 --> <c:out value="${number}" /> <c:set var="number"
									value="${number-1}" />
							</td>
			
							<td>맛집</td>
			
							<td>
								<!-- 글 내용 보기 --> <a
								href="../nolza/mat_content?no=${dto.no}&pageNum=${pageNum}"> <em
									class="icon_img icon_txt"></em>${dto.title}
							</a> <!-- 댓글 개수 --> <a class="reply_numbox" href="#"> <span
									class="reply_num">[${dto.indent}]</span>
							</a>
							</td>
			
							<td>
								<!-- 닉네임 --> <span class="nickname"><em>${dto.mem_nick}</em></span>
							</td>
			
							<td>
								<!-- 날짜 --> ${dto.date}
							</td>
			
							<td>
								<!-- 조회수 --> ${dto.readcount}
							</td>
			
							<td>
								<!-- 좋아요 --> ${dto.tolike}
							</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
		</td>
	</tr>
</table>
   
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
   
</body>

</html>
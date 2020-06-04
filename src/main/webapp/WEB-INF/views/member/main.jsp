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
<div class="container list">
<table class="table">
	<tr>
		<td width="50%">
			<h3>도서 게시판</h3>
		</td>
		<td width="50%">
			<h3>축구 게시판</h3>
		</td>
	</tr>
	<tr>
		<td>
			<table align="center" width="100%" class="table">

				
				<c:forEach var="book_dto" items="${list }">
					<tr>

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
						
						<td align="right">${book_dto.book_readcount }</td>
						
					</tr>
				</c:forEach>
			</table>
		</td>
		
		
		
		
		
		
		<td>
			<table class="table">
		       
		        
		        <c:forEach var="fb" items="${list2}">
		           <tr>             
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
		             <td align="right"> ${fb.fb_readcount}</td>
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
			
			
			
				<tbody>
					<!--상단 공지사항-->
					<tr class="ub-content us-post" data-type="icon_notice">

						<td class="gall_tit ub-word"><a href="#"><em
								class="icon_img icon_notice"></em> <b>자유 게시판 가이드 모음집</b> </a> <a
							class="reply_numbox" href="#"> <span class="reply_num">[17]</span>
								<!-- 위치 수정하기 -->
						</a></td>
						
						<td class="gall_count">20253</td>
					</tr>
			
					<!-- 내용 -->
					<c:forEach var="dto" items="${mat_list3}">
						
						
						<!-- 리스트 -->
						<tr>

							<td>
								<!-- 글 내용 보기 --> <a
								href="../nolza/mat_content?no=${dto.no}&pageNum=${pageNum}"> <em
									class="icon_img icon_txt"></em>${dto.title}
							</a> <!-- 댓글 개수 --> <a class="reply_numbox" href="#"> <span
									class="reply_num">[${dto.indent}]</span>
							</a>
							</td>
			
							
							<td align="right">
								<!-- 조회수 --> ${dto.readcount}
							</td>

						</tr>
						
					</c:forEach>
				</tbody>
			</table>
		</td>
		
		
		
		<td>
			<table  width="70%" class="table">
			        
			        <c:forEach var="dto" items="${list4}">
			           <tr height="40px">       
			             <td>
			             <c:if test="${dto.camja_step>0}">
			               <img src="imgs/level.gif" width="${5*dto.camja_indent}" height="16">
			               <img src="imgs/re.gif">
			             </c:if>
			             
			             <c:if test="${dto.camja_step==0}">
			               <img src="imgs/level.gif" width="${5*dto.camja_indent}" height="16">
			             </c:if>
			             
			             <a href="camja_content.do?camja_no=${dto.camja_no}&pageNum=${pageNum}">${dto.camja_title}</a>
			             
			             <c:if test="${dto.camja_readcount>=20 }">
			               <img src="imgs/hot.png" border="0" height="18">
			             </c:if>   
			             </td>  
			                      
			             <td align="right"> ${dto.camja_readcount}</td>
			           </tr>
			        </c:forEach>     
			 </table>
		</td>
	</tr>
	
	
	
	
	
	<tr>
		<td>
			<h3>음악 게시판</h3>
		</td>
		
		<td rowspan="2">
			
		</td>
	</tr>
	
	
	
	<tr>
		<td>
			<table class="table">
				

				<c:forEach var="dto" items="${list5}">
					<tr>

						<td>
							<a href="content.do?no=${dto.no}&pageNum=${pageNum}">${dto.title}</a>
						</td>

						<td align="right">${dto.readcount}</td>
					</tr>
				</c:forEach>
			</table>
		</td>
		
		

	</tr>
</table>
</div>
  
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<head>
<meta charset="UTF-8">

<title>취미</title>

<!-- 스타일 시트 적용 -->
<link rel="stylesheet" type="text/css" href="resources/css/freeBoard.css">

<link rel="stylesheet" href="https://nstatic.dcinside.com/dc/w/css/minor.css" type="text/css" charset="utf-8">

<link rel="shortcut icon" href="//nstatic.dcinside.com/dc/w/images/logo_icon.ico">
<link rel="apple-touch-icon" href="//nstatic.dcinside.com/dc/m/img/dcinside_icon.png">
<link rel="apple-touch-icon-precomposed" href="//nstatic.dcinside.com/dc/m/img/dcinside_icon.png">
<link rel="stylesheet" type="text/css" href="//nstatic.dcinside.com/dc/w/css/reset.css?v=1">
<link rel="stylesheet" type="text/css" href="https://nstatic.dcinside.com/dc/w/css/common.css?v=2004211415">
<link rel="stylesheet" type="text/css" href="https://nstatic.dcinside.com/dc/w/css/contents.css?200323">
<link rel="stylesheet" type="text/css" href="https://nstatic.dcinside.com/dc/w/css/popup.css?ver=200327">
<link rel="stylesheet" type="text/css" href="//nstatic.dcinside.com/dc/w/css/editor_20141223.css?v=2">
<link rel="stylesheet" type="text/css" href="https://nstatic.dcinside.com/dc/w/css/research.css?v=12">
<link rel="manifest" href="/manifest.json">

<link rel="prefetch" href="https://026cf5a63950162c1a2baa6d28b0a794.safeframe.googlesyndication.com/safeframe/1-0-37/html/container.html">
<link rel="prefetch" href="https://tpc.googlesyndication.com/safeframe/1-0-37/html/container.html">

<!-- 자바스크립트 -->
<script src="https://cdn.ampproject.org/rtv/012005012256000/amp4ads-host-v0.js"></script>
<script src="https://www.googletagservices.com/activeview/js/current/osd.js?cb=%2Fr20100101"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async="" src="https://ssl.google-analytics.com/ga.js"></script>
<script type="text/javascript" async="" src="https://ssl.google-analytics.com/ga.js"></script>
<script charset="UTF-8" type="text/javascript" src="https://cdn.taboola.com/libtrc/impl.20200517-9-RELEASE.js"></script>
<script async="" src="//cdn.taboola.com/libtrc/dcinside/loader.js" id="tb_loader_script"></script>
<script type="text/javascript" src="//nstatic.dcinside.com/dc/w/js/html5shiv.min.js"></script>
<script type="text/javascript" src="//nstatic.dcinside.com/dgn/gallery/js/ctr_cookie.min.js"></script>
<script type="text/javascript" src="//nstatic.dcinside.com/dgn/gallery/js/cross_domain.js"></script>

<script src="//nstatic.dcinside.com/dgn/gallery/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript" src="//nstatic.dcinside.com/dgn/gallery/js/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="//nstatic.dcinside.com/dgn/gallery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/_js/jquery/jquery.matchHeight.js"></script>
<script type="text/javascript" src="/_js/common.js?v=200207"></script> 
<script type="text/javascript" src="/_js/favorite.js?v=180106"></script>
<script type="text/javascript" src="/_js/gallery_top.js?190513"></script>
<script type="text/javascript" src="/_js/user_block.js"></script>
<script type="text/javascript" src="/_js/crossDomainStorage.js?1"></script>
<script type="text/javascript" src="/_js/globalSearch.js?190513"></script>
<script type="text/javascript" src="/_js/fcm/app.js?2"></script>
<script type="text/javascript" src="/_js/navigation.js"></script>
	
<script src="/_js/list.js" type="text/javascript" charset="utf-8"></script>
<script src="/_js/total_singo.js?v=190213" type="text/javascript" charset="utf-8"></script>
<script src="/_js/dccon/dccon.js?v=190513" type="text/javascript" charset="utf-8"></script>
<script src="/_js/search.js?v=190213" type="text/javascript" charset="utf-8"></script>
<script src="/_js/gallery_bottom.js" type="text/javascript" charset="utf-8"></script>
<script src="/_js/minor_notify.js" type="text/javascript" charset="utf-8"></script>
<script src="/_js/minor_gallery.js?v=180105" type="text/javascript" charset="utf-8"></script>
	<!-- Taboola -->
	<script type="text/javascript">
      window._taboola = window._taboola || [];
      _taboola.push({category:'auto'});
      !function (e, f, u, i) {
        if (!document.getElementById(i)){
          e.async = 1;
          e.src = u;
          e.id = i;
          f.parentNode.insertBefore(e, f);
        }
      }(document.createElement('script'),
      document.getElementsByTagName('script')[0],
      '//cdn.taboola.com/libtrc/dcinside/loader.js',
      'tb_loader_script');
      if(window.performance && typeof window.performance.mark == 'function')
      {window.performance.mark('tbl_ic');}
	</script>
    <!-- Taboola -->
    <script src="https://neon.netinsight.co.kr/persona.js" async=""></script>
    <script src="//neon.netinsight.co.kr/head/NOQjLbkMUqYiKK8Qfs62SLPCzWlxfL9tkLtWrzs05IuEAM4qWzAZAbZMaUZnU0ZnMlFtS1VIMG94MHlVUVNBAstB16bzwaCqXgPLQdem88Ggql4.js?url=https%3A%2F%2Fgall.dcinside.com%2Fmgallery%2Fboard%2Flists%2F%3Fid%3Drsg&amp;ref=http%3A%2F%2Fgall.dcinside.com%2Fmgallery%2Fboard%2Flists%2F%3Fid%3Drsg"></script><link rel="preload" href="https://adservice.google.co.kr/adsid/integrator.js?domain=gall.dcinside.com" as="script"><script type="text/javascript" src="https://adservice.google.co.kr/adsid/integrator.js?domain=gall.dcinside.com"></script><link rel="preload" href="https://adservice.google.com/adsid/integrator.js?domain=gall.dcinside.com" as="script"><script type="text/javascript" src="https://adservice.google.com/adsid/integrator.js?domain=gall.dcinside.com"></script><script src="https://securepubads.g.doubleclick.net/gpt/pubads_impl_2020050602.js" async=""></script>

</head>


<article>
<form name="frm">
		  	<input type="hidden" id="current_type" name="current_type" value="list">
			<input type="hidden" id="list_url" name="list_url" value="https://gall.dcinside.com/mgallery/board/lists?id=rsg">
			<input type="hidden" id="current_params" name="current_params" value="&amp;search_head=0&amp;page=1">
			<input type="hidden" id="exception_mode" name="exception_mode" value="all">
			<input type="hidden" id="list_num" name="list_num" value="50">
			<input type="hidden" id="page" name="page" value="1">
			<input type="hidden" id="sort_type" name="sort_type" value="N">
			<input type="hidden" id="board_type" name="board_type" value="list">
			<input type="hidden" id="search_head" name="search_head" value="0">
			<input type="hidden" id="gallery_id" name="gallery_id" value="rsg">
			<input type="hidden" id="no" name="gallery_no" value="">
			<input type="hidden" id="s_type" name="s_type" value="">
			<input type="hidden" id="s_keyword" name="s_keyword" value="">
			<input type="hidden" id="e_s_n_o" name="e_s_n_o" value="3eabc219ebdd65fe3eef86e3">
</form>
		

<div class="list_array_option clear">
<div class="array_tab left_box">
  <button type="button" class="on" onclick="listKindTab('all','list');return false;">전체글</button>
  
    <button type="button" class="" onclick="listKindTab('recommend','list');return false;">개념글</button>
    
    <button type="button" class="" onclick="listKindTab('notice','list');return false;">공지</button>
    
</div>
<div class="center_box" style="">
	<div class="inner">
		<ul>
			<li><a href="../nolza/viewAll" onclick="listSearchHead('all')" class="on">전체</a></li>
         	<li><a href="../nolza/viewFreeBoard" onclick="listSearchHead(0)" class="">맛집</a></li>
         	<li><a href="javascript:;" onclick="listSearchHead(10)" class="">게시판1</a></li>
         	<li><a href="javascript:;" onclick="listSearchHead(20)" class="">게시판2</a></li>
         	<li><a href="javascript:;" onclick="listSearchHead(30)" class="">게시판3</a></li>
         	<li><a href="javascript:;" onclick="listSearchHead(40)" class="">게시판4</a></li>
        </ul>
    </div>
</div>

<div class="right_box">
<div class="output_array clear" style="display:block">
  <div class="select_box array_num">
	<select name="numbers" id="sarray_numbers">
	  	  <option value="30">30개</option>
	  <option value="50">50개</option>
	  <option value="100">100개</option>
	 </select>
	<div class="select_area"><a href="#" onclick="showLayer(this, 'listSizeLayer');return false;">50개
	<span class="blind">페이지당 게시물 노출 옵션</span><em class="sp_img icon_option_more"></em></a></div>
	<ul id="listSizeLayer" class="option_box" style="left:0;top:20px;display:none">
	  	  <li><a href="javascript:listDisp(30)">30개</a></li>
		  <li><a href="javascript:listDisp(50)">50개</a></li>
		  <li><a href="javascript:listDisp(100)">100개</a></li>
	 </ul>
  </div>
    <div class="switch_btnbox">
  		&nbsp;
  		<a class="btn_write sp_img" href="https://gall.dcinside.com/mgallery/board/write/?id=rsg"> <!-- 경로 수정하기 -->
			<span class="blind">글쓰기</span>
			<em class="inner"></em><em class="inner"></em><em class="inner"></em><em class="inner"></em>
		</a>
			  </div>
</div>
</div>
</div>
		<table class="gall_list ">
		  <caption>갤러리 리스트</caption>
		  <colgroup>
			<col style="width:7%">
						<col style="width:51px">
						<col>
						<col style="width:18%">
						<col style="width:6%">
			<col style="width:6%">
			<col style="width:6%">
		  </colgroup>
		  <thead>
			<tr>
			  <th scope="col">번호</th>
  			  <th scope="col">말머리</th>
  			  <th scope="col">제목</th>
			  <th scope="col">글쓴이</th>
			  <th scope="col">작성일</th>
			  <th scope="col">조회</th>
			  <th scope="col">추천</th>
			</tr>
		  </thead>
		  		  <tbody>
		    <!--상단 공지사항-->
			<tr class="ub-content us-post" data-type="icon_notice">
				<td class="gall_num">196828</td>
			  	<td class="gall_subject"><b>공지</b></td>
			  	<td class="gall_tit ub-word">	
					<a href="#"><em class="icon_img icon_notice"></em>
					<b>자유 게시판 가이드 모음집</b>
					</a>
		
					<a class="reply_numbox" href="https://gall.dcinside.com/mgallery/board/view/?id=rsg&amp;no=196828&amp;t=cv&amp;page=1&amp;_rk=whk">
					<span class="reply_num">[17]</span> <!-- 위치 수정하기 -->
					</a>			  
				</td>
				<td class="gall_writer ub-writer" data-uid="davidd3" data-ip="" data-loc="list">
					<span class="nickname in" ><em>admin</em></span>
					<a class="writer_nikcon">
						<img src="https://nstatic.dcinside.com/dc/w/images/fix_nik.gif" border="0" width="12" height="11" style="margin-left:2px;cursor:pointer;" 
						onclick="window.open('//gallog.dcinside.com/davidd3');" alt="갤로그로 이동합니다."> <!-- 위치 수정하기 -->
					</a>							  
				</td>
				<td class="gall_date">19.03.03</td>
				<td class="gall_count">20253</td>
				<td class="gall_recommend">22</td>
			</tr>
		  		
		  	<!-- 내용 -->	  	
		  	<c:forEach var="dto" items="${mat_list2}">	 	<!-- 리스트 -->  	
				
			<tr class="ub-content us-post" data-type="icon_txt">
			 	 <td class="gall_num">                              <!-- 전체 글 개수 -->
			 	 <c:out value="${number}" /> <c:set var="number"    
										value="${number-1}" />
			 	 </td>
	  			  <td class="gall_subject">맛집</td>
	  			  <td class="gall_tit ub-word">	
					<a href="../nolza/viewContent?no=${dto.no}&pageNum=${pageNum}"><em class="icon_img icon_txt"></em>${dto.title}</a>
					<a class="reply_numbox" href="#"><span class="reply_num">${dto.indent}</span></a>	<!-- 댓글 개수 -->		 
				 </td>
				<td class="gall_writer ub-writer" data-uid="" data-loc="list">  <!-- 아이디 -->
					<span class="nickname" ><em>${dto.id}     
					</em></span>							  
				</td>
			  <td class="gall_date">${dto.date}</td>   <!-- 날짜 -->
			  <td class="gall_count">${dto.readcount}</td> <!-- 글개수 -->
			  <td class="gall_recommend">${dto.tolike}</td> <!-- 좋아요 -->
			</tr>
			
			</c:forEach>
			</tbody>
	</table>
</article>


<div class="list_bottom_btnbox">
	<div class="fl">
      	<button type="button" class="list_bottom btn_blue" onclick="listKindTab('all','list');return false;">전체글</button>
      	<button type="button" class="list_bottom btn_white" onclick="listKindTab('recommend','list');return false;">개념글</button>
	</div>
	<div class="fr"><!-- 링크 수정해야됨 -->
	  <button type="button" id="btn_write" class="btn_blue write" onclick="mat_writeForm">글쓰기</button>
	</div>
</div>

<!-- 페이징 처리 -->
<div class="bottom_paging_box">
		
<c:if test="${count>0 }">
	<c:set var="pageCount" value="${pageCount}" />
	<c:set var="pageBlock" value="${10}" />

	<fmt:parseNumber var="result" value="${currentPage/10}"
		integerOnly="true" />
	<c:set var="startPage" value="${result*10+1}" />
	<c:set var="endPage" value="${startPage+pageBlock-1}" />

	<c:if test="${endPage>pageCount}">
		<c:set var="endPage" value="${pageCount}" />
	</c:if>

	<%--이전페이지 --%>
	<c:if test="${startPage > 10 }">
		<a href="view_mat2?pageNum=${startPage-10}">[이전]</a>
	</c:if>

	<%--페이지처리 --%>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="view_mat2?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<%--다음 페이지 --%>
	<c:if test="${endPage < pageCount }">
		<a href="view_mat2?pageNum=${startPage+10}">[다음]</a>
	</c:if>
</c:if>
		
</div>

<!-- 글 검색 -->
<form name="frmSearch" method="post">
		<fieldset>
		  <legend class="blind">갤러리 내부 검색</legend>
		  <div class="buttom_search_wrap clear">
			<div class="select_box bottom_array fl">
    			<select id="search_type" name="search_type">
    			  <option value="search_all">전체</option>
    			  <option value="search_subject">제목</option>
    			  <option value="search_memo">내용</option>
    			  <option value="search_name">글쓴이</option>
    			  <option value="search_subject_memo">제목+내용</option>
    			</select>
    			<div class="select_area" onclick="showLayer(this, 'searchTypeLayer');return false;">
    			  <span id="search_type_txt">전체</span><span class="blind">게시물 정렬 옵션</span>
    			  <span class="inner"><em class="sp_img icon_option_more"></em></span>
    			</div>
    			<ul id="searchTypeLayer" class="option_box" style="left:-1px;top:36px;display:none">
    			  <li onclick="javascript:searchTypeSel('search_all')">전체</li>
    			  <li onclick="javascript:searchTypeSel('search_subject')">제목</li>
    			  <li onclick="javascript:searchTypeSel('search_memo')">내용</li>
    			  <li onclick="javascript:searchTypeSel('search_name')">글쓴이</li>
    			  <li onclick="javascript:searchTypeSel('search_subject_memo')">제목+내용</li>
    			</ul>
		  	</div>
			<div class="bottom_search fl clear">
			<div class="inner_search">
			  <input class="in_keyword" type="text" name="search_keyword" title="검색어 입력" value="">
			</div>
			<button class="sp_img bnt_search" onclick="search();return false;"><span class="blind">검색</span></button>
		  </div>
		</div>
		</fieldset>
	  </form>




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctxpath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fm_detail.jsp</title>
<link rel="stylesheet"
	href="https://plab-football.s3.amazonaws.com/static/css/styles.css?1589936552">

<style>
	img {display:block; margin: 0px auto;}
	
	#fm_detail{
		height: 300px;
		width: 300px;
	}
</style>



<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

</script>




</head>
<body>

	<div class="contentHero">

	 <img src="${ctxpath }/resources/imgUpload/${fm.fm_img}"> 
		<div class="stadGal">
<!--<img src="https://plab-football.s3.amazonaws.com/media/goalline_rCM7uUY.jpg"	alt="부천 크라우드 76 "> -->			 
    </div>

	</div>

	<div class="contentWrapper matchDetail">
		<div class="matchWrap">
			<div class="sectionWrap">
				<div class="stadSec">

					<div class="matchFee">
							<span>닉네임<span>
					</div>
				
						<div class="titleWrap">
							<h3>${mem_nick }</h3>
						</div>

					<div class="matchFee">

						<span>Type</span>
						<p>${fm.fm_type}</p>
					</div>

					<br>

					<div class="matchTime">
						<p>${fm.fm_mdate}</p>
					</div>
					<div class="matchPlace">
						<h1 class="txtH w700h">
							<a href="/stadium/38/matches/">${fm.fm_place} </a>
						</h1>
						<span class="txt2">${fm.fm_location}</span>
					</div>



<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1adca2b9d9408b86a2f777f8a0753e8f&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${fm.fm_location}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">enjoy</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>


					<div class="stadSec" id="mnRule">
						<div class="titleWrap">
							<h3>진행 방식</h3>
						</div>
						<div class="matchFeature">
							<ul>
								
<!-- 								<li><img
									src="https://plab-football.s3.amazonaws.com/static/img/ic_6vs6.svg"
									alt="6vs6 매치"> <span class="txt2">6vs6 매치</span></li>
 -->								
								<li><img
									src="https://plab-football.s3.amazonaws.com/static/img/ic_male.svg"
									alt="남성매치"> <span class="txt2">남성매치</span></li>
								
								<li><img
									src="https://plab-football.s3.amazonaws.com/static/img/ic_every.svg"
									alt="일반"> <span class="txt2">일반</span></li>
								
								<li><img
									src="https://plab-football.s3.amazonaws.com/static/img/ic_turf.svg"
									alt="풋살화"> <span class="txt2">풋살화</span></li>
								
<!-- 								<li><img
									src="https://plab-football.s3.amazonaws.com/static/img/ic_minmax.svg"
									alt="10~16명"> <span class="txt2">10~16명</span></li>
 -->							
							</ul>
						</div>

						<c:if test="${fm_category=='result'}">
							<div class="matchFee" align="center">
								<span>경기결과</span>
								<p class="txt3">${fm.fm_score}</p>
								<p class="txt3">${fm.fm_winner} 승</p>
							</div>
						</c:if>
<%-- 
						<div class="titleWrap" id="fm_detail">
							<h3>상세정보</h3>
							<p class="txt1">${fm.fm_detail}</p>
						</div>
 --%>						
 						
 						<table class="titleWrap">
 							<tr height="30">
 								<td>상세정보</td>
 								<td width="375" colspan="3">${fm_detail}
 								</td>
 							</tr>
 						</table>
 						
 						<div align="right">
							<input type="button" value="글수정" onClick="document.location.href='fm_updateForm.do?fm_no=${fm.fm_no}&pageNum=${pageNum }'">
							<input type="button" value="글삭제" onClick="document.location.href='fm_delete.do?fm_no=${fm.fm_no}&pageNum=${pageNum }'">
							<%-- <input type="button" value="답글" onClick="document.location.href='fm_writeForm.do?fm_no=${fm.fm_no}&fm_group=${fm.fm_group }&fm_step=${fm.fm_step }&fm_indent=${fm.fm_indent }&fm_category=${fm_category}'"> --%>
							<input type="button" value="글목록" onClick="document.location.href='fm_list.do'">
						</div>

		<div>
			<p>댓글
				<%@ include file="/WEB-INF/views/fm_board/fm_cmt.jsp" %> 			
			</p>
		</div>		
						
						</div>
						</div>
						</div>
						</div>
						</div>
</body>
</html>
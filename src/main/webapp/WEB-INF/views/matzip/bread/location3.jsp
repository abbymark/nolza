<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>태극당 빵집</title>


<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
    function shareKakaotalk() {
        Kakao.init("ec4d877db29246f99ab77d110d2999d8");      // 사용할 앱의 JavaScript 키를 설정
        Kakao.Link.sendDefault({
              objectType:"feed"
            , content : {
                  title:"홍철책빵"   // 콘텐츠의 타이틀
                , description:"존맛탱 빵집 홍철책빵"   // 콘텐츠 상세설명
                , imageUrl:"https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/100898920_139949190967386_2250065174922403247_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=106&_nc_ohc=y_xbwQXKjtgAX8P3VjU&oh=5ca6cb1cf0a8327149499b66edffde2e&oe=5EF545B0"   // 썸네일 이미지
                , link : {
                      mobileWebUrl:"https://open.kakao.com/o/gf5tiAVb/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                    , webUrl:"https://open.kakao.com/o/gf5tiAVb/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                }
            }
            , social : {
                  likeCount:0       // LIKE 개수
                , commentCount:0    // 댓글 개수
                , sharedCount:0     // 공유 회수
            }
            , buttons : [
                {
                      title:"게시글 확인"    // 버튼 제목
                    , link : {
                        mobileWebUrl:"https://open.kakao.com/o/gf5tiAVb/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                      , webUrl:"https://open.kakao.com/o/gf5tiAVb/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                    }
                }
            ]
        });
    }
    
    
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec4d877db29246f99ab77d110d2999d8&libraries=services">
</script>


				
</head>

<!-- 스타일 시트 적용 -->
<link rel="stylesheet" type="text/css"
	href="resources/css/freeBoardt3.css">

<!-- 본문 -->
<body>

	<h2>홍철책빵</h2>

	<table class="freeboard_list">

		<tr>
			<td>글번호</td>
			<td>d</td>
			<td>조회수</td>
			<td>d</td>
		</tr>

		<tr>
			<td>글쓴이</td>
			<td>d</td>
			<td>작성일</td>
			<td>d</td>
		</tr>

		<tr>
			<td>글제목</td>
			<td colspan="3"></td>
		</tr>
		<tr>

			<td colspan="4">

				<div id="map" style="width: 300px; height: 250px;"></div> 
	
	<script>
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1
	});

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	// 키워드로 장소를 검색합니다
	//ps.keywordSearch('홍철책빵', placesSearchCB); 
	ps.keywordSearch('서울특별시 용산구 후암동 한강대로102길 57', placesSearchCB);

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			var bounds = new kakao.maps.LatLngBounds();

			for (var i = 0; i < data.length; i++) {
				displayMarker(data[i]);
				bounds.extend(new kakao.maps.LatLng(data[i].y,
						data[i].x));
			}

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {

		// 마커를 생성하고 지도에 표시합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : new kakao.maps.LatLng(place.y, place.x)
		});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event
				.addListener(
						marker,
						'click',
						function() {
							// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
							infowindow
									.setContent('<div style="padding:5px;font-size:12px;">'
											+ place.place_name
											+ '</div>');
							infowindow.open(map, marker);
						});
	}
</script>
	
			</td>
		</tr>

		<tr>
			<td colspan="4" align="center">dd</td>
		</tr>
	</table>

	<br>

	<br>

	<h2>공유하기</h2><br>
		<img src="resources/imgs/kakao.PNG" onClick="shareKakaotalk();" height="40px;" width="40px;"> 	
    <!-- <input type="button" onClick="shareKakaotalk();" value="카톡으로 공유하기"/>  -->
	
</body>
</html>



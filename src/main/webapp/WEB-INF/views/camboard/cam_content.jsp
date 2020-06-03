<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cam_content.jsp</title>
</head>
<body>
<div class="container list"><h2>캠핑장 상세 정보</h2>
<table align="center" width=70% class="table">
	<tr>
		<td>캠핑장 번호</td>
		<td>${dto.gdsNo}</td>
		<td>캠핑장 명</td>
		<td id="gdsName">${dto.gdsName}</td>
	</tr>
	<tr>		
		<td>캠핑장 구분</td>
		<td>${dto.gdsCat}</td>
		<td>캠핑장 전화번호</td>
		<td>${dto.gdsTel}</td>
	</tr>
	<tr>
		<td>도로명 주소</td>
		<td  id="gdsNewadd" colspan="3">${dto.gdsNewadd}</td>
	</tr>
	<tr>
		<td>구 주소</td>
		<td id="gdsOldadd" colspan="3">${dto.gdsOldadd}</td>
	</tr>
	<tr>
		<td colspan="4">
					<div id="map" style="width:100%;height:400px"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bb8ff88dc498d8640327fa81a99aae8&libraries=services"></script>
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
					
					
					if($("#gdsNewadd").text() != ''){
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch($( "#gdsNewadd" ).text(), function(result, status) {
					
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
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$("#gdsName").text()+'</div>'
					        });
					        infowindow.open(map, marker);
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});  
				 	}else{
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch($( "#gdsOldadd"  ).text(), function(result, status) {
						
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
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$( "#gdsName" ).text()+'</div>'
						        });
						        infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});  
					} 
				</script>
		</td>
	</tr>
	<tr>
		<td>사이트 수</td>
		<td>${dto.gdsNos}</td>
		<td>주차가능 대수</td>
		<td>${dto.gdsNop}</td>
	</tr>
	<tr>
		<td>편의시설</td>
		<td colspan="3">${dto.gdsCon}</td>
		
	</tr>
	<tr>
		<td>안전시설</td>
		<td colspan="3">${dto.gdsSafe}</td>
	</tr>
	<tr>
		<td>기타 부대 시설</td>
		<td colspan="3">${dto.gdsEtc}</td>
	</tr>
	<tr>
		<td>이용 시간</td>
		<td colspan="3">${dto.gdsUtime}</td>
	</tr>
	<tr>
		<td>이용 금액</td>
		<td colspan="3">${dto.gdsPrice}</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
		<c:if test="${mem_id=='admin'}">  
		<input type="button" value="캠핑장 정보수정" onclick="document.location.href='cam_updateForm.do?gdsNo=${dto.gdsNo}&pageNum=${pageNum}'"/>
		<input type="button" value="캠핑장 삭제" onclick="document.location.href='cam_delete.do?gdsNo=${dto.gdsNo}&pageNum=${pageNum}'"/>
		</c:if>
		<input type="button" value="캠핑장 리스트" onclick="document.location.href='cam_list.do?pageNum=${pageNum}'"/>
		</td>
	</tr>
	
</table>
</div>
</body>
</html>
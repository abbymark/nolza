<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${book_title }</title>
<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script>

//좋아요 싫어요 버튼 기능
function likeCheck(book_likeState){
	//alert("likeCheck():"+$("#book_no").val()+"\n"+ $("#mem_id").val())
	if($("#reader_id").val()==''){
		alert("로그인후 이용해 주시기 바랍니다");
		return;
	}
	
	$.ajax({
		type:'POST',
		url:'book_likeCheck.do',
		data:"book_no="+$("#book_no").val()+"&book_likeState="+book_likeState+"&mem_id="+ $("#reader_id").val(),
		dataType:'JSON',
		success:function(data){
			//alert(data.likeValue);
			$("#likeCount").text(data.likeValue);
			$("#likeCnt").text(data.likeCnt);
			$("#dislikeCnt").text(data.dislikeCnt);			
		}//success end
	});//ajax end
	
	$("#initial").hide()
	if(book_likeState==1){
		$("#ifLike").show();
		$("#afterCancel").hide()
	}else if(book_likeState==-1){
		$("#ifDislike").show();
		$("#afterCancel").hide()
	}
}//likeCheck() end

//좋아요 싫어요 취소 버튼 기능
function likeCancel(book_likeState){
	
	$.ajax({
		type:'POST',
		url:'book_likeCancel.do',
		data:"book_no="+$("#book_no").val()+"&book_likeState="+book_likeState+"&mem_id="+ $("#reader_id").val(),
		/* data:{
			book_no:$("book_no").val(),
			book_likeState:book_likeState,
			mem_id:$("#reader_id").val()
		}, */
		dataType:'JSON',
		success:function(data){
			$("#likeCount").text(data.likeValue);
			$("#likeCnt").text(data.likeCnt);
			$("#dislikeCnt").text(data.dislikeCnt);	
		}
	})
	
	$("#initial").hide()
	if(book_likeState==1||book_likeState==-1){
		$("#ifLike").hide()
		$("#ifDislike").hide()
		
		$("#afterCancel").show()
	}
}

</script>



<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </head>

</head>
<body>
	<center><h2>글 내용 보기</h2></center>
	<form>
	<table border="1">
		
		<tr>
			
			<td>글번호</td>
			<td>${book_dto.book_no }
				<input type="hidden" id="reader_id" value="${mem_id }">
				<input type="hidden" id="mem_id" value="${book_dto.mem_id }">
		    	<input type="hidden" id="book_no" value="${book_dto.book_no }">
			</td>
			<td>조횟수</td>
			<td>${book_dto.book_readcount }</td>
		</tr>
		
		<tr>
			<td>글쓴이</td>
			<td>${book_dto.mem_nick }</td>
			<td>작성일</td>
			<td>
				<%-- ${dto.regdate } --%>
				<fmt:formatDate value="${book_dto.book_date }" pattern="yyyy-MM-dd hh:mm:ss"/>
			</td>
		</tr>
		
		<tr>
			<td>글 종류</td>
			<td colspan="3">${book_dto.book_type }</td>
		</tr>
		
		<tr>
			<td>글제목</td>
			<td colspan="3" id="book_title">${book_dto.book_title }</td>
		</tr>
		<c:if test="${book_dto.book_type =='비소설 추천' || book_dto.book_type =='소설 추천'}">
			<tr>
			<td>평점</td>
				<td colspan="3">
					<c:choose>
						<c:when test="${book_dto.book_rating == 1}">
							<img src="resources/imgs/star-on.svg">
						</c:when>
						<c:when test="${book_dto.book_rating == 2}">
							<img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg">
						</c:when>
						<c:when test="${book_dto.book_rating == 3}">
							<img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg">
						</c:when>
						<c:when test="${book_dto.book_rating == 4}">
							<img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg">
						</c:when>
						
						<c:when test="${book_dto.book_rating == 5}">
							<img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg"><img src="resources/imgs/star-on.svg">
						</c:when>
					</c:choose>
				</td>
			</tr>
		</c:if>
		
		<tr>
			<td>글내용</td>
			<td colspan="3">
				<textArea rows="10" cols="60" readonly>${book_content }</textArea>
				<table border="1">
					<tr>
						<td>
							<span id="likeCnt">${book_dto.book_like_cnt }</span>
							<span id="initial">
								<c:if test="${book_likeState==null }">
									<input type="button" id="book_like" value="좋아요" onClick="likeCheck(1)">
									<input type="button" id="book_dislike" value="싫어요" onClick="likeCheck(-1)">
								</c:if>
								<c:if test="${book_likeState==1 }">
									<input type="button" id="cancel_like" value="좋아요 취소" onClick="likeCancel(1)">
								</c:if>
								<c:if test="${book_likeState==-1 }">
									<input type="button" id="cancel_dislike" value="싫어요 취소" onClick="likeCancel(-1)">
								</c:if>
							</span>
							
							
							<span id="ifLike" style="display:none">
								<input type="button" id="cancel_like" value="좋아요 취소" onClick="likeCancel(1)">
							</span>
							<span id="ifDislike" style="display:none">
								<input type="button" id="cancel_dislike" value="싫어요 취소" onClick="likeCancel(-1)">
							</span>
							
							
							<span id="afterCancel" style="display:none">
								<input type="button" id="book_like" value="좋아요" onClick="likeCheck(1)">
								<input type="button" id="book_dislike" value="싫어요" onClick="likeCheck(-1)">
							</span>
							<span id="dislikeCnt">${book_dto.book_dislike_cnt }</span>
						</td>
					</tr>
					<tr align="center">
						<td>
							<span id="likeCount" style="display:inline-block">${book_dto.book_like }</span>			
						</td>
					</tr>
					
				</table>
			</td>
		</tr>
		
		
		<c:if test="${book_dto.book_type =='독서 모임' && book_dto.book_location != '0'}">
			<tr>
				<td>위치</td>
				<td id="book_location">${book_dto.book_location }</td>
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
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch($( "#book_location" ).text(), function(result, status) {
					
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
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$( "#book_title" ).text()+'</div>'
					        });
					        infowindow.open(map, marker);
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});    
				</script>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${book_dto.book_type =='토론'}">
			<tr>
				<td id="chart_div" colspan="4">
				
				</td>
			</tr>
		</c:if>
		
		
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="글수정" onclick="location.href='book_updateForm.do?book_no=${book_dto.book_no}&pageNum=${pageNum}'">
				<input type="button" value="글삭제" onclick="document.location.href='book_delete.do?book_no=${book_dto.book_no}&pageNum=${pageNum}&mem_id=${book_dto.mem_id }'">
				<input type="button" value="글쓰기" onclick="document.location.href='book_writeForm.do?book_type=${book_dto.book_type }'">
				<input type="button" value="답글쓰기" onclick="document.location.href='book_writeForm.do?book_no=${book_dto.book_no}&book_group=${book_dto.book_group}&book_step=${book_dto.book_step }&book_indent=${book_dto.book_indent }&book_type=${book_dto.book_type }'">
				<input type="button" value="글목록" onclick="location.href='book_list.do?pageNum=${pageNum}'">
			</td>
		</tr>
	</table>
	</form>
	
	<%--댓글기능 --%>
	댓글
	<%@ include file="book_cmt.jsp" %>
</body>
</html>























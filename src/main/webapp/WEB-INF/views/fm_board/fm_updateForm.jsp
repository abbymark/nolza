<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>updateForm.jsp</title>
		
	<style type="text/css">
		body{background-color:white;}
		table{
		margin:auto;
		line-height:25px;
		}

.form-group {
  margin-bottom: 20px;
}

h2.heading {
  font-size: 18px;
  text-divansform: uppercase;
  font-weight: 300;
  text-align: left;
  color: #506982;
  border-bottom: 1px solid #506982;
  padding-bottom: 3px;
  margin-bottom: 20px;
}

.controls {
  text-align: left;
  position:relative;
}

.controls input[type="text"],
.controls input[type="email"],
.controls input[type="number"],
.controls input[type="date"],
.controls input[type="password"],
.controls textarea,
.controls button,
.controls select {
  padding: 12px;
  font-size: 14px;
  border: 1px solid #c6c6c6;
  width: 250px;
  margin-bottom: 18px;
  color: #888;
  font-family: 'Lato', 'sans-serif';
  font-size: 16px;
  font-weight: 300;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-divansition: all 0.3s;
  -o-divansition: all 0.3s;
  -webkit-divansition: all 0.3s;
  divansition: all 0.3s;
}


</style>

		
		<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

		<script>	
			function openDaumPostcode(){
				//alert("A");
				new daum.Postcode({
					oncomplete:function(data){
						//document.getElementById('zipcode').value=data.zonecode;
						document.getElementById('fm_location').value=data.address;
					}
				}).open();
			}

		</script>
		
</head>
<body>
	<center><h2>글수정</h2></center>
	<form method="post" name="fm_writeForm" action="fm_updatePro.do?pageNum=${pageNum }">
		
	<table class="form-group">

		<tr class="controls">
			<td colspan="2" align="right">
				<a href="fm_list.do">리스트</a>
			</td>
		</tr>

		<tr class="controls">
			<td>아이디</td>
			<td><input type="text" name="mem_id" size="30"  value="${dto.mem_id}"></td>
		</tr>

		<tr class="controls">
			<td>닉네임</td>
			<td><input type="text" name="mem_nick" size="30" value="${dto.mem_nick}"></td>
		</tr>

		
		<tr class="controls">
			<td>시간</td>
			<td>
			<select name="fm_time" id="fm_time">
				<option value="${dto.fm_time }">${dto.fm_time }</option>
				<option value="10:00">10:00</option>
				<option value="13:00">13:00</option>
				<option value="15:00">15:00</option>
				<option value="17:00">17:00</option>
				<option value="20:00">20:00</option>
				<option value="22:00">22:00</option>			
			</select>
				<input type="date" name="fm_mdate" size="30" value="${dto.fm_mdate }">
				<input type="text" name="fm_mdate" size="5">
			</td>
		</tr>
		
		<tr class="controls">
			<td>장소</td>
			<td>
				<input type="text" name="fm_place" size="30"  value="${dto.fm_place}">
				<input type="hidden" name="fm_no" value="${dto.fm_no}"/>
			</td>
		</tr>

		<tr class="controls">
			<td>위치</td>
			<td>
				<input type="text" name="fm_location" id="fm_location" value="${dto.fm_location}">
				<input type="button" value="검색" onclick="openDaumPostcode()">
			</td>
		</tr>

		<tr class="controls">
			<td>매치팀</td>
			<td>
			<input type="text" name="fm_teamhome" size="15" value="${dto.fm_teamhome}">&nbsp;VS
			<input type="text" name="fm_teamaway" size="15" value="${dto.fm_teamaway}">			
			</td>
		</tr>

		<tr class="controls">
			<td>카테고리</td>
			<c:set var="fm_category" value="${dto.fm_category }"/>
			<c:choose>
				<c:when test="${fm_category eq 'match'}">
					<c:set var="fm_category" value="경기매치"/>
				</c:when>
				<c:when test="${fm_category eq 'result'}">
					<c:set var="fm_category" value="경기결과"/>
				</c:when>
				<c:when test="${fm_category eq 'media'}">
					<c:set var="fm_category" value="축구&풋살 동영상"/>
				</c:when>
				
			</c:choose>
			
			
			<td>
			<select name="fm_category" id="fm_category" value="${dto.fm_category }">
				<option value="${dto.fm_category }">${dto.fm_category }</option>
				<option value="경기매치">경기매치</option>
				<option value="경기결과">경기결과</option>
				<option value="축구&풋살 동영상">축구&풋살 동영상</option>
			</select>
			</td>

			
		</tr>
		
		<tr class="controls">
			<td>축구/풋살</td>
			<td>
			<select name="fm_type" id="fm_type" value="${dto.fm_type }">
				<option value="${dto.fm_type }">${dto.fm_type }</option>
				<option value="축구">축구</option>
				<option value="풋살">풋살</option>
			</select>
			</td>
		</tr>

		<tr class="controls">
			<td>이미지</td>
			<td>
				<table>
					<tr>
						<td>
							<input type="file" name="fm_img" value="${dto.fm_img }">
						</td>
					</tr>
				</table>
			</td>
		</tr>
			
		<tr class="controls">
			<td>상세정보</td>
			<td>
				<textarea name="fm_detail" rows="10" cols="60" value="${dto.fm_detail }">${dto.fm_detail }
				</textarea>
			</td>
		</tr>


		<tr class="controls">
			<td>경기결과</td>
			<td>
				<input type="text" name="fm_score" size="10" value="${dto.fm_score }">
			</td>
		</tr>
		
		
		
				
		<tr class="controls">
			<td colspan="2" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록" onClick="document.location.href='fm_list.do'">
			</td>
		</tr>
		
	</table>
			
	</form>
	
</body>
</html>
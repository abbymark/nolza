<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>writeForm.jsp</title>
	
<style type="text/css">
		table{margin:auto;
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
	

<%-- 	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>--%>	
	<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
<script type="text/javascript">
function writeSave() {
		
			if($('#fm_time').val()==''){
					alert("시간을 입력 하세요");
					$('#fm_time').focus();
					return false;
			}//if

			if($('#fm_place').val()==''){
					alert("장소를 입력 하세요");
					$('#fm_place').focus();
					return false;
			}//if

			if($('#fm_teamhome').val()==''){
					alert("홈팀을 입력 하세요");
					$('#fm_teamhome').focus();
					return false;
			}//if

			if($('#fm_teamaway').val()==''){
					alert("어웨이팀을 입력 하세요");
					$('#fm_teamaway').focus();
					return false;
			}//if
			
	
			return true;
			
	}//writeSave() end 
</script>
			
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
	<center><h2>글쓰기</h2></center>
	<form method="post" name="fm_writeForm" action="fm_writePro.do" encType="multipart/form-data"
	onSubmit="return writeSave()">
	
	
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="fm_no" value="${fm_no}">
		<input type="hidden" name="fm_group" value="${fm_group}">
		<input type="hidden" name="fm_step" value="${fm_step}">
		<input type="hidden" name="fm_indent" value="${fm_indent}">
	<table class="form-group">

		<tr class="controls">
			<td colspan="2" align="right">
				<a href="fm_list.do">리스트</a>
			</td>
		</tr>

		<tr class="controls">
			<td width="80px"><label for="name">아이디</label></td>
			<td><input type="hidden" name="mem_id" size="30" value="${mem_id}">${mem_id}</td>
		</tr>

		<tr class="controls">
			<td><label for="name">닉네임</label></td>
			<td><input type="hidden" name="mem_nick" size="30" value="${mem_nick}">${mem_nick}</td>
		</tr>

		
		<tr class="controls">
			<td><label for="name">시간</label></td>
			<td>
			<select name="fm_time" id="fm_time">
				<option value="${fm_time }">${fm_time }</option>
				<option value="10:00">10:00</option>
				<option value="13:00">13:00</option>
				<option value="15:00">15:00</option>
				<option value="17:00">17:00</option>
				<option value="20:00">20:00</option>
				<option value="22:00">22:00</option>			
			</select>
				<input type="date" name="fm_mdate" size="30">
				<input type="text" name="fm_mdate" size="5" placeholder="ex)일요일">
			</td>
		</tr>
		
		<tr class="controls">
			<td><label for="name">장소</label></td>
			<td>
			<c:if test="${fm_no==0 }">
				<input type="text" name="fm_place" id="fm_place" size="30" placeholder="ex)부천 스타필드 풋살파크">
			</c:if>

			<c:if test="${fm_no!=0 }">
				<input type="text" name="fm_place" id="fm_place" size="30" value="[답변]">
			</c:if>
			</td>
		</tr>

		<tr class="controls">
			<td><label for="name">위치</label></td>
			<td>
				<input type="text" name="fm_location" id="fm_location">
				<input type="button" value="주소찾기" onclick="openDaumPostcode()">
			</td>
		</tr>

		<tr class="controls">
			<td><label for="name">매치팀</label></td>
			<td>
			<input type="text" name="fm_teamhome" id="fm_teamhome" size="15" placeholder="HOME">&nbsp;VS
			<input type="text" name="fm_teamaway" id="fm_teamaway" size="15" placeholder="AWAY">			
			</td>
		</tr>

		<tr class="controls">
			<td><label for="name">카테고리</label></td>
			<c:set var="fm_category" value="${fm_category }"/>
			<c:choose>
				<c:when test="${fm_category eq 'match'}">
					<c:set var="fm_category" value="경기매치"/>
				</c:when>
				<c:when test="${fm_category eq 'result'}">
					<c:set var="fm_category" value="경기결과"/>
				</c:when>
				
			</c:choose>
			
			
			<td class="controls">
			<select name="fm_category" id="fm_category">
				<option value="${fm_category }">${fm_category }</option>
				<option value="경기매치">경기매치</option>
				<option value="경기결과">경기결과</option>
			</select>
			</td>

			
		</tr>
		
		<tr class="controls">
			<td><label for="name">축구/풋살</label></td>
			<td>
			<select name="fm_type" id="fm_type">
				<option value="${fm_type }">${fm_type }</option>
				<option value="축구">축구</option>
				<option value="풋살">풋살</option>
			</select>
			</td>
		</tr>
 
		<tr class="controls">
			<td><label for="name">이미지</label></td>
			<td>
				<table>
					<tr>
						<td>
							<input type="file" name="file" id="fm_img">
						</td>
					</tr>
				</table>
			</td>
		</tr>
			
 		<tr class="controls">
			<td><label for="name">상세정보</label></td>
			<td>
			<textarea name="fm_detail" rows="10" cols="60">${fm.fm_detail}</textarea>
			</td>
		</tr>


		<tr class="controls">
			<td><label for="name">승리팀</label></td>
			<td>
			<label for="name">
			<input type="text" name="fm_winner" size="10">
			스코어
			<input type="text" name="fm_score" size="10" placeholder="score">
			</label>
			</td>
		</tr>
		
		
				
		<tr class="controls">
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록" onClick="document.location.href='fm_list.do'">
			</td>
		</tr>
		
	</table>

	
	</form>
</body>
</html>
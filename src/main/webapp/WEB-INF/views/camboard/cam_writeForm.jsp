<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>cam_write</title>
<script>
function openDaumPostcode(){
	//alert("A");
	new daum.Postcode({
		oncomplete:function(data){
			//document.getElementById('zipcode').value=data.zonecode;
			document.getElementById('gdsNewadd').value=data.address;
		}
	}).open();
}
	//이미지 추가
	function insertImg() {
		var html = '';
		html += "<tr>"
		html += "<td>"
		html += "<input type='file' name='img_title'>"
		html += "</td>"
		html += "<td>"
		html += "<input type='button' value='X' onClick='deleteImg(this)'>"
		html += "</td>"
		html += "</tr>"

		$("#images").append(html);

	}

	//이미지 삭제
	function deleteImg(id) {
		$(id).closest("tr").remove();
	}
</script>
</head>

<body>
	<center><h2>캠핑장 등록</h2></center>
	
	<form method="post" name="cam_writeForm" action="cam_writePro.do?pageNum=${pageNum}" encType="multipart/form-data">
			<input type="hidden" name="pageNum" value="${pageNum}"> 
			<input type="hidden" name="gdsNo" value="${gdsNo}">
			<input type="hidden" name="gdsName" value="${gdsName}">
			<input type="hidden" name="mem_id" value="${mem_id}">
			<input type="hidden" name="mem_nick" value="${mem_nick}">
	<div class="container list">
		<table>
			<tr>
				<td>캠핑장 이름</td>
				<td><input type="text" name="gdsName" id="gdsName" size="30" value="${dto.gdsName}"> 
				<input type="hidden" name="gdsNo" value="${dto.gdsNo}">
				</td>
			</tr>
			<tr>
				<td>캠핑장 카테고리</td>
				<td><select name="gdsCat" id="gdsCat" value="${dto.gdsCat}">
						<option value="야영장">야영장</option>
						<option value="자동차야영장">자동차야영장</option>
						<option value="카라반/트레일러">카라반/트레일러</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
				<td>캠핑장 도로명주소</td>
				<td><input type="text" name="gdsNewadd" id="gdsNewadd"
					size="30" value="${dto.gdsNewadd}"></td>
			</tr>
			<tr>
				<td>캠핑장 구주소</td>
				<td><input type="text" name="gdsOldadd" id="gdsOldadd"
					size="30" value="${dto.gdsOldadd}"></td>
			</tr>
			<tr>
				<td>캠핑장 전화번호</td>
				<td><input type="text" name="gdsTel" id="gdsTel" size="30"
					value="${dto.gdsTel}"></td>
			</tr>
			<tr>
				<td>캠핑장 사이트수</td>
				<td><input type="text" name="gdsNos" id="gdsNos" size="30"
					value="${dto.gdsNos}"></td>
			</tr>
			<tr>
				<td>캠핑장 주차장수</td>
				<td><input type="text" name="gdsNop" id="gdsNop" size="30"
					value="${dto.gdsNop}"></td>
			</tr>
			<tr>
				<td>캠핑장 편의시설</td>
				<td><textarea name="gdsCon" id="gdsCon" rows="2" cols="60">${dto.gdsCon}</textarea></td>
			</tr>
			<tr>
				<td>캠핑장 안전시설</td>
				<td><textarea name="gdsSafe" id="gdsSafe" rows="2" cols="60">${dto.gdsSafe}</textarea></td>
			</tr>
			<tr>
				<td>캠핑장 기타 시설</td>
				<td><textarea name="gdsEtc" id="gdsEtc" rows="2" cols="60">${dto.gdsEtc}</textarea></td>
			</tr>
			<tr>
				<td>캠핑장 이용 가능 시간</td>
				<td><textarea name="gdsUtime" id="gdsUtime" rows="2" cols="60">${dto.gdsUtime}</textarea></td>
			</tr>
			<tr>
				<td>캠핑장 요금 안내</td>
				<td><textarea name="gdsPrice" id="gdsPrice" rows="2" cols="60">${dto.gdsPrice}</textarea></td>
			</tr>

			<tr class="inputArea">
				<td>이미지</td>
				<td><input type="button" onClick="insertImg()" value="이미지 추가"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="캠핑장 등록" id="register_Btn" class="btn btn-primary">
					<input type="reset" value="다시작성" class="btn btn-primary">
					<input type="button" value="캠핑장 리스트"	onclick="document.location.href='cam_list.do?pageNum=${pageNum}'" class="btn btn-primary">
				</td>
			</tr>
		</table>
		</div>
		<%=request.getRealPath("/")%>
	</form>
</body>
</html>
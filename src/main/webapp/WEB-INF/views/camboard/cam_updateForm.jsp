<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>updateForm.jsp</title>
		
		
		<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>
		
		<script type="text/javascript">
		function check(){
			if($('#gdsName').val()==''){
				alert("캠핑장명을 입력하세요");
				$('#gdsName').focus();
				return false;
			}
			if($('#gdsCat').val()==''){
				alert("캠핑장 구분을 입력하세요");
				$('#gdsCat').focus();
				return false;
			}
			return true;
		}
		</script>
</head>
<body>
<center><h2>캠핑장 정보 수정</h2></center>
<form method="post" name="cam_writeForm" action="cam_updatePro.do?pageNum=${pageNum}">
<div class="container list" >
	<table class="table">
		<tr>
			<td>캠핑장 이름</td>
			<td>
			<input type="text" name="gdsName" id="gdsName" size="30" value="${dto.gdsName}">
			<input type="hidden" name="gdsNo" value="${dto.gdsNo}">
			</td>
		</tr>
		
		<tr>
			<td>캠핑장 카테고리 </td>
			<td>
			<select name="gdsCat" id="gdsCat" value="${dto.gdsCat}">
  				<option value="야영장">야영장</option>
  				<option value="자동차야영장">자동차야영장</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>캠핑장 도로명주소 </td>
			<td><input type="text" name="gdsNewadd" id="gdsNewadd" size="30" value="${dto.gdsNewadd}"></td>
		</tr>
		<tr>
			<td>캠핑장 구주소 </td>
			<td><input type="text" name="gdsOldadd" id="gdsOldadd" size="30" value="${dto.gdsOldadd}"></td>
		</tr>
		<tr>
			<td>캠핑장 전화번호 </td>
			<td><input type="text" name="gdsTel" id="gdsTel" size="30" value="${dto.gdsTel}"></td>
		</tr>
		<tr>
			<td>캠핑장 사이트수</td>
			<td><input type="text" name="gdsNos" id="gdsNos" size="30" value="${dto.gdsNos}"></td>
		</tr>
		<tr>
			<td>캠핑장 주차장수</td>
			<td><input type="text" name="gdsNop" id="gdsNop" size="30" value="${dto.gdsNop}"></td>
		</tr>
		<tr>
			<td>캠핑장 편의시설 </td>
			<td><textarea name="gdsCon" id="gdsCon" rows="2" cols="60">${dto.gdsCon}</textarea></td>
		</tr>
		<tr>
			<td>캠핑장 안전시설 </td>
			<td><textarea name="gdsSafe" id="gdsSafe" rows="2" cols="60">${dto.gdsSafe}</textarea></td>
		</tr>
		<tr>
			<td>캠핑장 기타 시설 </td>
			<td><textarea name="gdsEtc" id="gdsEtc" rows="2" cols="60">${dto.gdsEtc}</textarea></td>
		</tr>
		<tr>
			<td>캠핑장 이용 가능 시간 </td>
			<td><textarea name="gdsUtime" id="gdsUtime" rows="2" cols="60">${dto.gdsUtime}</textarea></td>
		</tr>
		<tr>
			<td>캠핑장 요금 안내</td>
			<td><textarea name="gdsPrice" id="gdsPrice" rows="2" cols="60">${dto.gdsPrice}</textarea></td>
		</tr>
				
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록" onclick="document.location.href='cam_list.do?pageNum=${pageNum}'">
			</td>
		</tr>
		
	</table>
	</div>
</form>
</body>
</html>
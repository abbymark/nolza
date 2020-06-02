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
		<td>${dto.gdsName}</td>
	</tr>
	<tr>		
		<td>캠핑장 구분</td>
		<td>${dto.gdsCat}</td>
		<td>캠핑장 전화번호</td>
		<td>${dto.gdsTel}</td>
	</tr>
	<tr>
		<td>도로명 주소</td>
		<td colspan="3">${dto.gdsNewadd}</td>
	</tr>
	<tr>
		<td>구 주소</td>
		<td colspan="3">${dto.gdsOldadd}</td>
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
		<td>이미지 </td>
		<td colspan="3">이미지</td>
	</tr>
	
	<tr>
		<td colspan="4" align="center">
		   
		<input type="button" value="캠핑장 정보수정" onclick="document.location.href='cam_updateForm.do?gdsNo=${dto.gdsNo}&pageNum=${pageNum}'"/>
		<input type="button" value="캠핑장 삭제" onclick="document.location.href='cam_delete.do?gdsNo=${dto.gdsNo}&pageNum=${pageNum}'"/>
		<input type="button" value="캠핑장 리스트" onclick="document.location.href='cam_list.do?pageNum=${pageNum}'"/>
		
		</td>
	</tr>
	
</table>
</div>
</body>
</html>
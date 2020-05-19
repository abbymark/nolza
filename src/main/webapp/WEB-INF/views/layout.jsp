<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="width: 100%; min-width: 599px; border-collapse: collapse;">
		<tr>
			<td colspan="2" height="50px" align="right">
				<tiles:insertAttribute name="header"/><!-- header.jsp -->
			</td>
		</tr>
		
		<tr>
			<%-- 
			<td width="200" height="500">
				<tiles:insertAttribute name="side"/><!-- side.jsp -->
			</td>
			 --%>
		
			<td valign="top" width="200" height="500">
				<tiles:insertAttribute name="content"/><!-- 중앙에 표시 -->
			</td>
		</tr>
		
		<tr>
			<td colspan="2" height="50px">
				<tiles:insertAttribute name="footer"/><!--footer.jsp -->
			</td>
		</tr>
	</table>

</body>
</html>
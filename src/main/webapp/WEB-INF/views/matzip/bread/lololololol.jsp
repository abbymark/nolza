<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="apple-mobile-web-app-title" content="CodePen">
<title>CodePen - Flex with Nested Containers</title>
<link rel='stylesheet' href='https://ajax.googleapis.com/ajax/libs/angular_material/1.1.8/angular-material.min.css'>
<style>

/* Important to set height for column layout */
.boxWithHeight {
  box-sizing: border-box;
  height: 100%;
}

.a, section {
  border: 5px solid rgba(85, 97, 85, 0.27);
  margin: 5px;  
}

</style>

</head>
<body layout="row" ng-app="myApp" class="icondemoFontIconsWithLigatures" ng-cloak>
<div flex="30" layout="column" class="boxWithHeight" layout-padding>
flex="30"
<section flex="40">flex="40"

<c:if test="${bread_name == '어글리베이커리'}">
			<jsp:include page="location1.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${bread_name == '아우어베이커리가로수길점'}">
			<jsp:include page="location2.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${bread_name == '홍철책빵'}">
			<jsp:include page="location3.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${bread_name == '타르틴베이커리도산점'}">
			<jsp:include page="location4.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${bread_name == '쟝블랑제리'}">
			<jsp:include page="location5.jsp"></jsp:include>
	</c:if>


</section>
<section flex>flex</section>
</div>
<div flex layout="column" class="boxWithHeight" layout-padding>
flex
<section flex="70">flex="70"

	<jsp:include page="content_right.jsp"></jsp:include>

</section>
<section flex="20">flex="20"</section>

</div>
</body>

<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-animate.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-aria.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angular_material/1.1.8/angular-material.min.js'></script>
<script id="rendered-js">
angular.module('myApp', ['ngMaterial']);

    </script>
</body>
</html>

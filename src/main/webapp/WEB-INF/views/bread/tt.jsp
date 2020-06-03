<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<meta content=kr name=content-language>
<meta content="IE=Edge" http-equiv="X-UA-Compatible">

<style>

@charset "utf-8";

/*이미지 평점*/
.favor{display:inline-block; line-height:32px; padding:2px 18px 0px 18px; border:1px solid #222228; border-radius:20px; margin-right:10px; float:left}
.favor span{font-size:13px; padding:2px 0 3px 25px; background:url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/like-off@2x.png) no-repeat left; background-size:20px;}

</style>



<script src="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/lib/js/function.js?1.4.10"></script>

<script Type="Text/JavaScript">
 
	/*갤러리 좋아요 클릭시*/
	$(document).on("click", ".btn-gallery-like", function() {
		if (confirm("로그인이 필요합니다.\n로그인 하시겠습니까?")) {
			location.href = '/my.php?login';
		}
	});
	
</script>
</head>

<body >


					<!-- s:이미지 평점 -->
							<a href="JavaScript:void(0);" onClick="getLogin();" class="favor"
								value="Y"><span>좋아요(<i class="num">1</i>)
							</span></a>



</body>
</html>

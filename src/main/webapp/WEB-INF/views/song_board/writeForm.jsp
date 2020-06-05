<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<script>
	//유효성 체크
	function check(){
		 
		if($('#s_type').val()==''){
			alert("글머리를 선택하주세요");
			$('#s_type').focus();
			return false;
		}
		
		if($('#title').val()==''){
			alert("글제목을 입력하세요");
			$('#title').focus();
			return false;
		}
		
		if($('#content').val==''){
			alert("글내용을 입력하세요");
			$('#content').focus();
			return false;
		}
		
		return true;
	}
	</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card-body">
					<form class="form-signin" method="post" name="writeForm" action="writePro.do" onSubmit="return check()">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<input type="hidden" name="no" value="${no}">
						<input type="hidden" name="s_group" value="${s_group}">
						<input type="hidden" name="s_step" value="${s_step}">
						<input type="hidden" name="s_indent" value="${s_indent}">
						<input type="hidden" name="mem_id" id="mem_id" size="12" value="${mem_id}">
						
						<div class="form-label-group">
							<label>글쓴이</label>
							<input type="hidden" name="mem_nick" id="mem_nick" size="12" value="${mem_id}">${mem_id}
						</div>
						<hr>

						<div class="form-label-group">
							<label>글머리</label> 
							<select name="s_type" id="s_type" class="form-control" required>
								<option value="기타">선택하세요</option>
								<option value="전체">전체</option>
								<option value="일반">일반</option>
								<option value="음원">음원</option>
								<option value="음반">음반</option>
								<option value="차트">차트</option>
								<option value="컴백">컴백</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<hr>

						<div class="form-label-group">
							<label>글제목</label>
							<c:if test="${no==0 }">
								<input type="text" class="form-control" name="title" id="title" size="30">
							</c:if>
							<c:if test="${no != 0 }">
								<input type="text" class="form-control" name="title" id="title" size="30" value="[답변]">
							</c:if>
						</div>
						<hr>

						<div class="form-label-group">
							<label>글내용</label>
							<textarea name="content" id="content" class="form-control" rows="10" cols="60"></textarea>
						</div>
						<hr>

						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" value="글쓰기">
						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="reset" value="다시작성">
						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="button" value="글목록" onclick="document.location.href='list.do'">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
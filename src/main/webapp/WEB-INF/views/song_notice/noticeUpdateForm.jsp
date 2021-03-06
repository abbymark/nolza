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
		 
		if($('#n_type').val()==''){
			alert("글머리를 선택하주세요");
			$('#n_type').focus();
			return false;
		}
		
		if($('#n_title').val()==''){
			alert("글제목을 입력하세요");
			$('#n_title').focus();
			return false;
		}
		
		if($('#n_content').val==''){
			alert("글내용을 입력하세요");
			$('#n_content').focus();
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
					<form class="form-signin" method="post" name="noticeUpdateForm" action="noticeUpdatePro.do?pageNum=${pageNum}" onsubmit="return check()">						
						<div class="form-label-group">
							<label>글쓴이</label>
							<input type="text" class="form-control"	name="id" size="30" value="${dto.mem_id}" readonly required autofocus>
							<input type="hidden" name="n_no" value="${dto.n_no}">
						</div>
						<hr>

						<div class="form-label-group">
							<label>글머리</label> 
							<select name="n_type" id="n_type" class="form-control" required>
								<option value="공지">선택하세요</option>
								<option value="전체">전체</option>
								<option value="공지">공지</option>
								<option value="이벤트">이벤트</option>
							</select>
						</div>
						<hr>

						<div class="form-label-group">
							<label>글제목</label> 
							<input type="text" class="form-control" name="n_title" id="n_title" size="30" value="${dto.n_title}">
						</div>
						<hr>

						<div class="form-label-group">
							<label>글내용</label>
							<textarea name="n_content" id="n_content" class="form-control" rows="10" cols="60">${dto.n_content}</textarea>
						</div>
						<hr>

						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" value="글쓰기">
						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="reset" value="다시작성">
						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="button" value="글목록" onclick="document.location.href='noticeList.do?pageNum=${pageNum}'">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

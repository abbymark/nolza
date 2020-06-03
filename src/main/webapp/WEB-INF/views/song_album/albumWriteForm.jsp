<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card-body">
					<form class="form-signin" method="post" name="albumWriteForm" action="albumWritePro.do" enctype="multipart/form-data">
						<input type="hidden" name="pageNum" value="${pageNum}">
						
						<div class="form-label-group">
							<label>글쓴이</label>
							<input type="hidden" name="mem_id" id="mem_id" size="12" value="${mem_id}">${mem_id}
						</div>
						<hr>
						<div class="form-label-group">
							<label>앨범사진</label> 
							<input type="file" id="gdsImg" name="file"/>
							<div class="select_img">
								<img src="" />
							</div>
							
							<script>
								$("#gdsImg").change(function() {
									if (this.files && this.files[0]) {
									var reader = new FileReader;
									reader.onload = function(data) {
										$(".select_img img").attr("src",data.target.result).width(100);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
							</script>
						</div>
						
						<hr>

						<div class="form-label-group">
							<label>장르</label> 
							<select name="a_style" id="a_style" class="form-control" required>
								<option value="기타">선택하세요</option>
								<option value="가요">가요</option>
								<option value="POP">POP</option>
								<option value="OST">OST</option>
								<option value="트롯">트롯</option>
								<option value="JAZZ">JAZZ</option>
								<option value="CLASSIC">CLASSIC</option>
								<option value="EDM">EDM</option>
								<option value="기타">그 외 장르</option>
							</select>
						</div>
						<hr>

						<div class="form-label-group">
							<label>앨범제목</label>
							<input type="text" class="form-control" name="a_title" size="30">
						</div>
						<hr>
						<div class="form-label-group">
							<label>타이틀곡</label>
							<input type="text" class="form-control" name="a_main" size="30">
						</div>
						<hr>
						<div class="form-label-group">
							<label>아티스트</label>
							<input type="text" class="form-control" name="a_artist" size="30">
						</div>
						<hr>
						<div class="form-label-group">
							<label>발매사</label>
							<input type="text" class="form-control" name="a_sales" size="30">
						</div>
						<hr>
						<div class="form-label-group">
							<label>발매일</label>
							<input type="date" class="form-control" name="a_date" size="30">
						</div>
						<hr>
						<div class="form-label-group">
							<label>소속사</label>
							<input type="text" class="form-control" name="a_manage" size="30">
						</div>
						<hr>
						
						<div class="form-label-group">
							<label>앨범소개</label>
							<textarea name="a_content" class="form-control" rows="10" cols="60"></textarea>
						</div>
						<hr>

						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" value="글쓰기">
						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="reset" value="다시작성">
						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="button" value="글목록" onclick="document.location.href='albumMainList.do'">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
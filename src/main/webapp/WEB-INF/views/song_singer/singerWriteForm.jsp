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
					<form class="form-signin" method="post" name="singerWriteForm" action="singerWritePro.do" enctype="multipart/form-data">
						<input type="hidden" name="pageNum" value="${pageNum}">
						
						<div class="form-label-group">
							<label>글쓴이</label>
							<input type="text" class="form-control"	name="id" size="30" required autofocus>
						</div>
						<hr>
						
						<div class="form-label-group">
							<label>대표사진</label> 
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
							<label>아티스트</label>
							<input type="text" class="form-control" name="ss_artist" size="30">
						</div>
						<hr>

						<div class="form-label-group">
							<label>활동연대</label> 
							<select name="ss_active" id="ss_active" class="form-control" required>
								<option value="기타">선택하세요</option>
								<option value="1950년대">1950년대</option>
								<option value="1960년대">1960년대</option>
								<option value="1970년대">1970년대</option>
								<option value="1980년대">1980년대</option>
								<option value="1990년대">1990년대</option>
								<option value="2000년대">2000년대</option>
								<option value="2010년대">2010년대</option>
								<option value="2020년대">2020년대</option>
								<option value="기타">그 외 활동연대</option>
							</select>
						</div>
						<hr>
						
						<div class="form-label-group">
							<label>활동유형</label>
							<input type="text" class="form-control" name="ss_style" size="30">
						</div>
						<hr>
						
						<div class="form-label-group">
							<label>데뷔</label>
							<input type="date" class="form-control" name="ss_date" size="30">
						</div>
						<hr>
						
						<div class="form-label-group">
							<label>데뷔곡</label>
							<input type="text" class="form-control" name="ss_title" size="30">
						</div>
						<hr>
						
						<div class="form-label-group">
							<label>국적</label>
							<input type="text" class="form-control" name="ss_nation" size="30">
						</div>
						<hr>
						
						<div class="form-label-group">
							<label>멤버</label>
							<input type="text" class="form-control" name="ss_person" size="30">
						</div>
						<hr>
						
						<div class="form-label-group">
							<label>소속사</label>
							<input type="text" class="form-control" name="ss_manage" size="30">
						</div>
						<hr>
						
						<div class="form-label-group">
							<label>아티스트 소개</label>
							<textarea name="ss_content" class="form-control" rows="10" cols="60"></textarea>
						</div>
						<hr>

						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" value="글쓰기">
						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="reset" value="다시작성">
						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="button" value="글목록" onclick="document.location.href='singerMainList.do'">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
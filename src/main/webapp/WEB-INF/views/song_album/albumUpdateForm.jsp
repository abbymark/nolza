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
		 
		if($('#gdsImg').val()==''){
			alert("사진을 선택해주세요");
			$('#gdsImg').focus();
			return false;
		}
		
		if($('#a_title').val()==''){
			alert("앨범 제목을 입력하세요");
			$('#a_title').focus();
			return false;
		}
		
		if($('#a_main').val()==''){
			alert("타이틀 곡을 입력하세요");
			$('#a_main').val('').focus();
			return false;
		}
		
		if($('#a_artist').val()==''){
			alert("아티스트 이름을 입력하세요");
			$('#a_artist').focus();
			return false;
		}
		
		if($('#a_sales').val()==''){
			alert("발매사를 입력하세요");
			$('#a_sales').focus();
			return false;
		}
		
		if($('#a_date').val()==''){
			alert("발매일을 입력하세요");
			$('#a_date').focus();
			return false;
		}
		
		if($('#a_manage').val()==''){
			alert("소속사를 입력하세요");
			$('#a_manage').focus();
			return false;
		}
		
		if($('#a_content').val==''){
			alert("앨범소개를 입력하세요");
			$('#a_content').focus();
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
					<form class="form-signin" method="post" name="albumUpdateForm" action="albumUpdatePro.do" enctype="multipart/form-data" onSubmit="return check()">
						<input type="hidden" name="a_no" value="${dto.a_no}">
						<input type="hidden" name="pageNum" value="${pageNum}">
						
						<div class="form-label-group">
							<label>글쓴이</label>
							<input type="text" class="form-control"	name="mem_id" size="30" value="${dto.mem_id}" readonly required autofocus>
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
							<select name="a_style" id="a_style" class="form-control"  required>
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
							<input type="text" class="form-control" name="a_title" id="a_title" size="30" value="${dto.a_title}">
						</div>
						<hr>
						<div class="form-label-group">
							<label>타이틀곡</label>
							<input type="text" class="form-control" name="a_main" id="a_main" size="30" value="${dto.a_main}">
						</div>
						<hr>
						<div class="form-label-group">
							<label>아티스트</label>
							<input type="text" class="form-control" name="a_artist" id="a_artist" size="30" value="${dto.a_artist}">
						</div>
						<hr>
						<div class="form-label-group">
							<label>발매사</label>
							<input type="text" class="form-control" name="a_sales" id="a_sales" size="30" value="${dto.a_sales}">
						</div>
						<hr>
						<div class="form-label-group">
							<label>발매일</label>
							<input type="date" class="form-control" name="a_date" id="a_date" size="30" value="${dto.a_date}">
						</div>
						<hr>
						<div class="form-label-group">
							<label>소속사</label>
							<input type="text" class="form-control" name="a_manage" id="a_manage" size="30" value="${dto.a_manage}">
						</div>
						<hr>
						
						<div class="form-label-group">
							<label>앨범소개</label>
							<textarea name="a_content" id="a_content" class="form-control" rows="10" cols="60" >${dto.a_content}</textarea>
						</div>
						<hr>

						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" value="글수정">
						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="reset" value="다시작성">
						<input class="btn btn-lg btn-primary btn-block text-uppercase" type="button" value="글목록" onclick="document.location.href='albumMainList.do'">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
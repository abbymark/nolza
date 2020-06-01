<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀자 회원가입</title>

<style>
.form-group {
  margin-bottom: 20px;
}

h2.heading {
  font-size: 18px;
  text-divansform: uppercase;
  font-weight: 300;
  text-align: left;
  color: #506982;
  border-bottom: 1px solid #506982;
  padding-bottom: 3px;
  margin-bottom: 20px;
}

.controls {
  text-align: left;
  position:relative;
}

.controls input[type="text"],
.controls input[type="email"],
.controls input[type="number"],
.controls input[type="date"],
.controls input[type="password"],
.controls textarea,
.controls button,
.controls select {
  padding: 12px;
  font-size: 14px;
  border: 1px solid #c6c6c6;
  width: 450px;
  margin-bottom: 18px;
  color: #888;
  font-family: 'Lato', 'sans-serif';
  font-size: 16px;
  font-weight: 300;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-divansition: all 0.3s;
  -o-divansition: all 0.3s;
  -webkit-divansition: all 0.3s;
  divansition: all 0.3s;
}

</style>


<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
//ajax를 사용하여 id및 nickname 체크
function idNickCheck(idNick){
	$.ajax({
		type:'POST',
		url:'mem_idNickCheck.do',
		data:{
			mem_id:$('#mem_id').val(),
			mem_nick:$("#mem_nick").val()
		},
		dataType:'JSON',
		success:function(data){
			if(data.idCheck==1 && idNick==1 && $('#mem_id').val()!=''){
				$('#mem_idCheck').text("O 사용가능 아이디 입니다");
				$('#mem_idCheck').attr("style", "color:#1409e6");
			}else if(data.idCheck==-1 && idNick==1 || $('#mem_id').val()=='' && idNick==1){
				$('#mem_idCheck').text("X 사용불가능 아이디 입니다");
				$('#mem_idCheck').attr("style", "color:#ff0019");
			}
			
			if(data.nickCheck==1 && idNick==2 && $('#mem_nick').val()!=''){
				$('#mem_nickCheck').text("O 사용가능 닉네임 입니다");
				$('#mem_nickCheck').attr("style", "color:#1409e6");
			}else if(data.idCheck==-1 && idNick==2 || $('#mem_nick').val()=='' && idNick==2){
				$('#mem_nickCheck').text("X 사용불가능 닉네임 입니다");
				$('#mem_nickCheck').attr("style", "color:#ff0019");
			}
		}
	})
}

//암호 확인 지우기
function erasePwCheck(){
	$('#mem_pw2').val('');
}

//암호 비교
function passwordCheck(){
	if($('#mem_pw').val() != $('#mem_pw2').val()){
		$('#mem_pwCheck').text("X 암호가 불일치 합니다");
		$('#mem_pwCheck').attr("style", "color:#ff0019");
	}else if($('#mem_pw').val() == $('#mem_pw2').val()){
		$('#mem_pwCheck').text("O 암호가 일치 합니다");
		$('#mem_pwCheck').attr("style", "color:#1409e6");
	}
	
}


//유효성 체크
function check(){
	 
	if($('#mem_id').val()==''){
		alert("ID 를 입력 하시요");
		$('#mem_id').focus();
		return false;
	}
	
	if($('#mem_pw').val()==''){
		alert("암호 를 입력 하시요");
		$('#mem_pw').focus();
		return false;
	}
	if($('#mem_pw2').val()==''){
		alert("암호확인 를 입력 하시요");
		$('#mem_pw2').focus();
		return false;
	}
	
	if($('#mem_pw').val() != $('#mem_pw2').val()){
		alert("암호와 암호확인 일치하지 않습니다");
		
		$('#mem_pw').val('').focus();
		$('#mem_pw2').val('');
		return false;
	}
	
	if($('#mem_nick').val()==''){
		alert("닉네임을 입력 하시요");
		$('#mem_nick').focus();
		return false;
	}
	
	if($('#mem_email').val==''){
		alert("이메일을 입력하세요");
		return false;
	}
	
	return true;
}

</script>
 
</head>
<body>
<form method="post" name="writeForm" action="mem_insertPro.do" onSubmit="return check()">
<div class="container">	
	<table class="form-group">


		<tr><td><h2 class="heading">회원가입</h2></td><tr>
		
		<tr class="controls">
				<td><label for="name">아이디</label></td>
				<td>
				<input type="text" name="mem_id" id="mem_id" oninput="idNickCheck(1)">
				</td>
		</tr>

		<tr>
			<td></td>
			<td>
				<span id="mem_idCheck"></span>			
			</td>
		</tr>
						
						
		<tr class="controls">
				<td><label for="name">닉네임</label></td>
				<td>
				<input type="text" name="mem_nick" id="mem_nick" oninput="idNickCheck(2)">
				</td>
		</tr>

		<tr>
			<td></td>
			<td>
				<span id="mem_nickCheck"></span>		
			</td>
		</tr>

				
		<tr class="controls">
			<td><label for="name">암호</label></td>
			<td>
			<input type="password" id="mem_pw" name="mem_pw" size="20" oninput="erasePwCheck()"/>
			</td>
		</tr>
		
			<tr class="controls">
	     	<td>	     	<label for="name">암호확인</label></td>
	     	<td>
	     	<input type="password" id="mem_pw2" size="20" oninput="passwordCheck()"/>
	  		</td>
	  	</tr>
	
		<tr>
			<td></td>
			<td>
				<span id="mem_pwCheck"></span>	  	
			</td>
		</tr>
	
	  		  	
	  	<tr class="controls">
		  	<td><label for="name">Email</label></td>
		  	<td>
		  	<input type="text" id="mem_email" name="mem_email" size="30"/>
				</td>
		</tr>
		
		<tr>
			<td>
				<input type="submit" value="회원가입">
				<input type="reset" value="다시입력">
				<input type="button" value="가입안함" onClick="location='main.do'">
			</td>
		</tr>

</table>
</div>

</form>
</body>
</html>




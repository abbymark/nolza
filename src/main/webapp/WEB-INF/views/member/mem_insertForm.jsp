<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀자 회원가입</title>
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
			}else if(data.idCheck==-1 && idNick==1 || $('#mem_id').val()=='' && idNick==1){
				$('#mem_idCheck').text("X 사용불가능 아이디 입니다");
			}
			
			if(data.nickCheck==1 && idNick==2 && $('#mem_nick').val()!=''){
				$('#mem_nickCheck').text("O 사용가능 닉네임 입니다");
			}else if(data.idCheck==-1 && idNick==2 || $('#mem_nick').val()=='' && idNick==2){
				$('#mem_nickCheck').text("X 사용불가능 닉네임 입니다");
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
	}else if($('#mem_pw').val() == $('#mem_pw2').val()){
		$('#mem_pwCheck').text("O 암호가 일치 합니다");
	}
	
}


//유효성 체크
function check(){
	if($('#mem_mail').val==''){
		alert("이메일을 입력하세요");
		return false;
	}
	
	return true;
}

</script>
 
</head>
<body>
<form method="post" name="writeForm" action="mem_insertPro.do" onSubmit="return check()">
	<table>
		<tr>
			<td>
				회원가입
			</td>
		</tr>
		
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="mem_id" id="mem_id" oninput="idNickCheck(1)">
			</td>
		</tr>
		<tr>
			<td>
				아이디체크:
			</td>
			<td>
				<label id="mem_idCheck"></label>
			</td>
		</tr>
		
		<tr>
			<td>닉네임</td>
			<td>
				<input type="text" name="mem_nick" id="mem_nick" oninput="idNickCheck(2)">
			</td>
		</tr>
		<tr>
			<td>
				닉네임체크:
			</td>
			<td>
				<label id="mem_nickCheck"></label>
			</td>
		</tr>
		
		<tr>
			<td>암호</td>
			<td><input type="password" id="mem_pw" name="mem_pw" size="20" oninput="erasePwCheck()"/></td>
		</tr>
		
		<tr>
	     	<td>암호확인</td>
	     	<td><input type="password" id="mem_pw2" size="20" oninput="passwordCheck()"/></td>
	  	</tr>
	  	
	  	<tr>
	  		<td>
	  			암호 체크:
	  		</td>
	  		<td>
				<label id="mem_pwCheck"></label>
			</td>
	  	</tr>
	  	
	  	<tr>
		  	<td>Email</td>
		  	<td><input type="text" id="mem_email" name="mem_email" size="30"/></td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="submit" value="회원가입">
				<input type="reset" value="다시입력">
				<input type="button" value="가입안함" onClick="location='main.do'">
			</td>
		</tr>
	</table>

</form>
</body>
</html>























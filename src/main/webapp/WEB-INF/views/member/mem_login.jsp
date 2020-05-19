<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀자 로그인</title>
</head>
<body>
<h2>로그인</h2>
	<form method="post" action="mem_loginPro.do">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mem_id" size="30"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="mem_pw" size="30"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onClick="location='mem_insertForm.do'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
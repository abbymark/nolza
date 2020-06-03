<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
<title>CodePen - Basic hotel booking form</title>
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link href='https://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>
<style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font: inherit;
  font-size: 100%;
  vertical-align: baseline;
}

html {
  line-height: 1;
}

ol, ul {
  list-style: none;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

caption, th, td {
  text-align: left;
  font-weight: normal;
  vertical-align: middle;
}

q, blockquote {
  quotes: none;
}
q:before, q:after, blockquote:before, blockquote:after {
  content: "";
  content: none;
}

a img {
  border: none;
}

article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
  display: block;
}

/* Colors */
/* ---------------------------------------- */
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  text-align: center;
  font-family: 'Lato', 'sans-serif';
  font-weight: 400;
}

a {
  text-decoration: none;
}

.info-text {
  text-align: left;
  width: 100%;
}

header, form {
  padding: 4em 10%;
}

.form-group {
  margin-bottom: 20px;
}

h2.heading {
  font-size: 18px;
  text-transform: uppercase;
  font-weight: 300;
  text-align: left;
  color: #506982;
  border-bottom: 1px solid #506982;
  padding-bottom: 3px;
  margin-bottom: 20px;
}

.controls {
  text-align: left;
  position: relative;
}
.controls input[type="text"],
.controls input[type="email"],
.controls input[type="number"],
.controls input[type="date"],
.controls input[type="tel"],
.controls textarea,
.controls button,
.controls select {
  padding: 12px;
  font-size: 14px;
  border: 1px solid #c6c6c6;
  width: 100%;
  margin-bottom: 18px;
  color: #888;
  font-family: 'Lato', 'sans-serif';
  font-size: 16px;
  font-weight: 300;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-transition: all 0.3s;
  -o-transition: all 0.3s;
  -webkit-transition: all 0.3s;
  transition: all 0.3s;
}
.controls input[type="text"]:focus, .controls input[type="text"]:hover,
.controls input[type="email"]:focus,
.controls input[type="email"]:hover,
.controls input[type="number"]:focus,
.controls input[type="number"]:hover,
.controls input[type="date"]:focus,
.controls input[type="date"]:hover,
.controls input[type="tel"]:focus,
.controls input[type="tel"]:hover,
.controls textarea:focus,
.controls textarea:hover,
.controls button:focus,
.controls button:hover,
.controls select:focus,
.controls select:hover {
  outline: none;
  border-color: #9FB1C1;
}
.controls input[type="text"]:focus + label, .controls input[type="text"]:hover + label,
.controls input[type="email"]:focus + label,
.controls input[type="email"]:hover + label,
.controls input[type="number"]:focus + label,
.controls input[type="number"]:hover + label,
.controls input[type="date"]:focus + label,
.controls input[type="date"]:hover + label,
.controls input[type="tel"]:focus + label,
.controls input[type="tel"]:hover + label,
.controls textarea:focus + label,
.controls textarea:hover + label,
.controls button:focus + label,
.controls button:hover + label,
.controls select:focus + label,
.controls select:hover + label {
  color: #bdcc00;
  cursor: text;
}
.controls .fa-sort {
  position: absolute;
  right: 10px;
  top: 17px;
  color: #999;
}
.controls select {
  -moz-appearance: none;
  -webkit-appearance: none;
  cursor: pointer;
}
.controls label {
  position: absolute;
  left: 8px;
  top: 12px;
  width: 60%;
  color: #999;
  font-size: 16px;
  display: inline-block;
  padding: 4px 10px;
  font-weight: 400;
  background-color: rgba(255, 255, 255, 0);
  -moz-transition: color 0.3s, top 0.3s, background-color 0.8s;
  -o-transition: color 0.3s, top 0.3s, background-color 0.8s;
  -webkit-transition: color 0.3s, top 0.3s, background-color 0.8s;
  transition: color 0.3s, top 0.3s, background-color 0.8s;
  background-color: white;
}
.controls label.active {
  top: -11px;
  color: #555;
  background-color: white;
  width: auto;
}
.controls textarea {
  resize: none;
  height: 200px;
}

button {
  cursor: pointer;
  background-color: #1b3d4d;
  border: none;
  color: #fff;
  padding: 12px 0;
  float: right;
}

.btn_submit {
  cursor: pointer;
  background-color: #1b3d4d;
  border: none;
  color: #fff;
  padding: 12px 0;
  float: right;
}

button:hover {
  background-color: #224c60;
}

.clear:after {
  content: "";
  display: table;
  clear: both;
}

.grid {
  background: white;
}
.grid:after {
  /* Or @extend clearfix */
  content: "";
  display: table;
  clear: both;
}

[class*='col-'] {
  float: left;
  padding-right: 10px;
}
.grid [class*='col-']:last-of-type {
  padding-right: 0;
}

.col-2-3 {
  width: 66.66%;
}

.col-1-3 {
  width: 33.33%;
}

.col-1-2 {
  width: 50%;
}

.col-1-4 {
  width: 15%;
}

@media (max-width: 760px) {
  .col-1-4-sm, .col-1-3, .col-2-3 {
    width: 100%;
  }

  [class*='col-'] {
    padding-right: 0px;
  }
}
.col-1-8 {
  width: 12.5%;
}
</style>

<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>

<script type="text/javascript">
function delconfirm(){
	
	var message = confirm("정말로 탈퇴하시겠습니까?");
	
	if(message == true){
		alert("탈퇴되었습니다");
		document.location.href='mem_delete.do?mem_id=${memberDto.mem_id}';
	}else 
		return false;
}

</script>

<script>
function update() {
    
    var mem_nick    = $("#mem_id").val();
    var mem_pw    = $("#mem_pw").val();
    var mem_pw2   = $("#mem_pw2").val();
    var mem_email = $("#mem_email").val();
    var message = confirm("변경하시겠습니까?");
    
    if(mem_nick.length == 0){
        alert("닉네임을 입력해주세요");
        $("#mem_nick").focus();
        return false;
    }
    
    if(mem_pw.length == 0){
        alert("비밀번호를 입력해 주세요"); 
        $("#mem_pw").focus();
        return false;
    }
     
   	 if(mem_pw != mem_pw2){
 	    alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
 	    $("#mem_pw2").focus();
 	    return false; 
   	 }
 
    if(mem_email.length == 0){
        alert("이메일을 입력해주세요");
        $("#mem_email").focus();
        return false;
    }
    
    if(message == true){
		alert("변경되었습니다");
    }
    return true;
}
</script>


</head>
<body translate="no">

<form method="post" name="admin_editForm" action="mem_editPro.do" onsubmit="return check()">
	<div class="form-group">
		<h2 class="heading">회원정보 수정</h2>

		<div class="controls">
			<input type="text" id="mem_id" name="mem_id" class="floatLabel" value="${memberDto.mem_id}" readonly=TRUE>
			<label for="name">아이디</label>
		</div>

		<div class="controls">
			<input type="text" id="mem_nick" name="mem_nick" class="floatLabel" value="${memberDto.mem_nick}">
			<label for="email">닉네임</label>
		</div>
	
		<div class="controls">
			<input type="text" id="mem_pw" name="mem_pw" class="floatLabel" value="${memberDto.mem_pw}">
			<label for="phone">비밀번호</label>
		</div>
		
		<div class="controls">
			<input type="text" id="mem_pw2" name="mem_pw2" class="floatLabel" >
			<label for="phone">비밀번호 확인</label>
		</div>
		
		<div class="controls">
			<input type="text" id="mem_email" name="mem_email" class="floatLabel" value="${memberDto.mem_email}">
			<label for="phone">이메일</label>
		</div>
		
		<div>
		<button type="submit" value="글수정" class="col-1-4" onclick="return update();">글수정</button>
		<button type="reset" value="다시작성" class="col-1-4" style="margin-left: 20px;">다시작성</button>
		<input type="button" value="탈퇴" class="col-1-4 btn_submit" style="margin-left: 20px;"
			onclick="delconfirm();"> <!-- 로그인 페이지로 -->
		
		</div>
	</div>

</form>
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://raw.githubusercontent.com/andiio/selectToAutocomplete/master/jquery-ui-autocomplete.js'></script>
<script src='https://raw.githubusercontent.com/andiio/selectToAutocomplete/master/jquery.select-to-autocomplete.js'></script>
<script src='https://raw.githubusercontent.com/andiio/selectToAutocomplete/master/jquery.select-to-autocomplete.min.js'></script>
<script id="rendered-js">
(function ($) {
  function floatLabel(inputType) {
    $(inputType).each(function () {
      var $this = $(this);
      // on focus add cladd active to label
      
      //$this.focus(function () {
      //  $this.next().addClass("active");
      //});
      
      $this.next().addClass("active");
      
      //on blur check field and remove class if needed
    
    });
  }
  // just add a class of "floatLabel to the input field!"
  floatLabel(".floatLabel");
})(jQuery);
//# sourceURL=pen.js
    </script>
<script src="https://static.codepen.io/assets/editor/iframe/iframeRefreshCSS-e03f509ba0a671350b4b363ff105b2eb009850f34a2b4deaadaa63ed5d970b37.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@charset "UTF-8";

*{margin:0;padding:0;}
a {text-decoration: none;}
table caption {height:0;visibility:hidden;}
.inner_cont {width: 1230px;padding-left: 15px;padding-right: 15px;margin: 0 auto;margin-top:20px;}
.section_games .top_list_filter + .borad_list_tbl {padding-top:15px;}
.borad_list_tbl table {width:100%;border-collapse:collapse;border-spacing:0;border-top:2px solid #7d5d2c;}
.borad_list_tbl thead th {padding:14px 0 13px;border-bottom:1px solid #555;background:#fff;text-align:center;font-size:14px;font-weight:400;color:#333;word-break:break-all;}
.borad_list_tbl tbody td, .borad_list_tbl tbody th {padding:14px 0;border-bottom:1px solid #e1e1e1;background:#fff;font-size:14px;color:#555;text-align:center;word-break:break-all;}
.borad_list_tbl tbody td.td_left {text-align:left;padding-left:30px;padding-right:30px;}
.borad_list_tbl .link_detail {display:block;font-size:14px;color:#555;}
.borad_list_tbl .link_detail:hover {text-decoration:underline;}
.borad_list_tbl .ico_files {width:15px;height:15px;margin-left:5px;background-position:-460px 0;vertical-align:-2px;}
.borad_list_tbl .lab_notice {display:inline-block;margin:-3px 0 -2px;padding:3px 15px 2px;background:#efecdf;font-size:14px;font-weight:400;color:#7d5d2c;}
.borad_list_tbl .reply {display:inline-block;position:relative;padding:2px 8px 3px 31px;margin-right:8px;background:#1c2747;font-size:14px;font-weight:400;color:#fff;}
.borad_list_tbl .reply .ico_reply {display:block;position:absolute;top:0;left:10px;width:25px;height:19px;background-position:-480px 0;}
.borad_list_tbl + .post_btns {padding-top:30px;}
.borad_list_tbl + .paging_numbers {padding-top:70px;}
.borad_list_tbl .td_btn .btn_detail {display:inline-block;min-width:92px;padding:6px 8px 5px;border:1px solid #999;-moz-border-radius:1px;-webkit-border-radius:1px;border-radius:1px;background:#fff;text-align:center;font-size:13px;color:#555;}
.borad_list_tbl .td_btn .btn_detail {margin-top:5px;}
.borad_list_tbl .td_btn .btn_detail:first-child {margin-top:0;}
.borad_list_tbl.type2 tbody td, .borad_list_tbl.type2 tbody th {padding:28px 0;}

.btn_detail + .btn_detail {margin-left:7px;}
.btn_detail .ico_arrow {width:11px;height:6px;margin-left:8px;margin-right:5px;background-position:-280px -160px;}
.btn_detail.on {border-color:#1c2747;color:#1c2747;background:#ddd;}
.btn_detail.on .ico_arrow {background-position:-300px -160px;}

.borad_list_tbl .inner_tbl_wrap {display:none;padding:30px;background:#faf7f2;}
.borad_list_tbl .inner_tbl_wrap table {width:1120px;margin:0 auto;border-collapse:collapse;border-spacing:0;border-top:1px solid #555;border-left:1px solid #e1e1e1;border-right:1px solid #e1e1e1;}
.borad_list_tbl .inner_tbl_wrap table th + th,
.borad_list_tbl .inner_tbl_wrap table td + td {border-left:1px solid #e1e1e1;}
.borad_list_tbl .inner_tbl_wrap table th {font-weight:400;}
.borad_list_tbl .inner_tbl_wrap .team_info_wrap {text-align:left;}
.borad_list_tbl .inner_tbl_wrap .team_info_wrap .player span {word-break:keep-all;}

.borad_list_tbl .tooltip_wrap {position: absolute;right:21%;bottom:32%;display:block;width:auto;}
.borad_list_tbl .tip_wrap {position:relative;}
.borad_list_tbl .tip_box {position:absolute;bottom:0;left:0;display:block;font-size:12px;background:#58585a;color:#fff;border-radius:5px;width:;padding:0 5px;}
.borad_list_tbl .icon_tooltip {position:relative;display:inline-block;width:21px;height:21px;margin-left:5px;vertical-align:middle;background-position:-280px -180px;cursor:pointer;}
.tooltip_wrap .tooltip {visibility:hidden;position:absolute;bottom:-150%;right:-800%;padding:0px 8px;z-index:1;opacity:.40;background:#58585a;color:#fff;border-radius: 5px;font:12px;transform: translateY(9px);transition: all 0.3s ease-in-out;}
.tooltip_wrap:hover .tooltip{visibility:visible;transform:translateY(-5px);opacity:1;transition:.3s linear;}





</style>

<script type="text/javascript">
$(document).ready(function(){
	//$('.inner_tbl').hide().slideUp();

	$('.btn_detail').on('click',function(){
		$(this).addClass('on');
	});

//	$('.inner_tbl_wrap > div').slideUp();

	$('.inner_tbl_wrap > div').slideUp();

	$('.js_btn_result').on('click',function(){

		$(this).siblings('a').nextAll().removeClass('on');
		$(this).parent('.inner_tbl_wrap').addClass('active');

		if($(this).siblings().hasClass('on')){
//			console.log('ddddd');
		}

	});

	$('.js_btn_team_info').on('click',function(){

		$(this).parents().next().find('.inner_tbl_wrap').stop().slideDown();

		$(this).parents().next().find('.inner_tbl_wrap > .team_info_wrap').stop().slideDown();

//		$(this).parents().next().find('.inner_tbl_wrap').has('team_info_wrap').stop().slideToggle(200);


		$(this).prev('.js_btn_result').on('click',function(){ // 대표팀 정보버튼을 클릭한 상태에서 대회결과버튼을 누르면

//			console.log($(this).siblings().find('.js_btn_team_info'));

			$(this).next().removeClass('on'); // 대표팀 정보버튼의 클래스를 지워라

			$(this).parents().next().find('.inner_tbl_wrap > .team_info_wrap').hide(10); //대표팀 정보는 지워지고
			$(this).parents().next().find('.inner_tbl_wrap > .result').fadeIn(50); //결과내용이 보여짐

//			console.log($(this).next());

			$(this).next().on('click',function(){
				$(this).prev().removeClass('on'); // 대회결과버튼의 클래스를 지워라
				$(this).parents().next().find('.inner_tbl_wrap > .team_info_wrap').show(10); //결과내용이 지워지고
				$(this).parents().next().find('.inner_tbl_wrap > .result').hide(50); //대표팀 정보는 보여짐
			});

/*
			if ( $(this).parents().next().find('.inner_tbl_wrap > .result').is(':visible') == true ){  //만약 결과내용이 보여지고 있을때

				$(this).on('click',function(){ // 결과버튼을 누르면
					console.log('ddddd'); 
					$(this).toggleClass('on'); // 클래스를 지우고
					$(this).parents().next().find('.inner_tbl_wrap').stop().slideUp(); // td 테이블을 슬라이드업
					$(this).parents().next().find('.inner_tbl_wrap > .result').stop().slideUp(); // 결과내용도 슬라이드 업
					$(this).parents().next().find('.inner_tbl_wrap').off();
					$(this).parents().next().find('.inner_tbl_wrap > .result').off();
				});
			}
*/
			
		});




	});

});



</script>


</head>
<body>



<div class="inner_cont">
  <div class="borad_list_tbl">
      <table>
          <caption>게시판 리스트</caption>
          <colgroup>
              <col width="120"><col width="180"><col width="110"><col width="200"><col width="130"><col width="130"><col width="*">
          </colgroup>
          <thead>
              <tr>
                  <th scope="col">대회명</th>
                  <th scope="col">회수</th>
                  <th scope="col">상대팀</th>
                  <th scope="col">대회기간</th>
                  <th scope="col">장소</th>
                  <th scope="col">최종순위</th>
                  <th scope="col">보기</th>
              </tr>
          </thead>
          <tbody>
              <tr>
                  <td>올림픽(남)</td>
                  <td>23회</td>
                  <td>미국</td>
                  <td>1900.7.00-8.00</td>
                  <td>미국</td>
                  <td class="tip_wrap">2위<span class="tooltip_wrap"><i class="ico_comm icon_tooltip"></i><span class="tooltip">순위에 관련된 툴팁 내용이 보여집니다.</span></span></td>
                  <td class="td_btn">
                      <a href="javascript:;" class="btn_detail js_btn_result">결과<i class="ico_comm ico_arrow"></i></a>
                      <a href="javascript:;" class="btn_detail js_btn_team_info">정보<i class="ico_comm ico_arrow"></i></a>
                  </td>
              </tr>
              <tr>
                  <td colspan="7" class="inner_tbl_wrap">
                      <div class="inner_tbl result" id="resultCon">
                          <table>
                          <caption>게시판 리스트</caption>
                              <tbody>
                                  <tr>
                                      <th rowspan="2">경기구분</th>
                                      <th colspan="3">스코어</th>
                                  </tr>
                                  <tr>
                                      <th>한국</th>
                                      <th>상대팀</th>
                                      <th>승/패</th>
                                  </tr>
                                  <tr>
                                      <td>예선</td>
                                      <td>67</td>
                                      <td>62</td>
                                      <td>승</td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>
                      <div class="inner_tbl team_info_wrap" id="teamInfo">
                          <div class="team_info">
                              <div class=""><span class="tit">* 감독:</span></div>
                              <div class=""><span class="tit">*코치:</span>홍길동  <span class="tit">*심판:</span>풍파고 코치</div>
                              <div class="player">
                                  <span class="tit">*선수:</span>
                                  <span>선수1, 선수2, 성수3</span>
                              </div>
                          </div>
                      </div>
                  </td>
              </tr>
              <tr>
                  <td>올림픽(여)</td>
                  <td>23회</td>
                  <td>미국</td>
                  <td>1900.7.00-8.00</td>
                  <td>미국</td>
                  <td>순위</td>
                  <td class="td_btn">
                      <a href="javascript:;" class="btn_detail js_btn_result">결과<i class="ico_comm ico_arrow"></i></a>
                      <a href="javascript:;" class="btn_detail js_btn_team_info">정보<i class="ico_comm ico_arrow"></i></a>
                  </td>
              </tr>
              <tr>
                  <td colspan="7" class="inner_tbl_wrap">
                      <div class="inner_tbl result" id="resultCon">
                          <table>
                          <caption>게시판 리스트</caption>
                              <tbody>
                                  <tr>
                                      <th rowspan="2">경기구분</th>
                                      <th colspan="3">스코어</th>
                                  </tr>
                                  <tr>
                                      <th>한국</th>
                                      <th>상대팀</th>
                                      <th>승/패</th>
                                  </tr>
                                  <tr>
                                      <td>예선</td>
                                      <td>67</td>
                                      <td>62</td>
                                      <td>승</td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>
                      <div class="inner_tbl team_info_wrap" id="teamInfo">
                          <div class="team_info">
                              <div class=""><span class="tit">* 감독:</span></div>
                              <div class=""><span class="tit">*코치:</span>홍길동  <span class="tit">*심판:</span>풍파고 코치</div>
                              <div class="player">
                                  <span class="tit">*선수:</span>
                                  <span>선수1, 선수2, 성수3</span>
                              </div>
                          </div>
                      </div>
                  </td>
              </tr>
          </tbody>
      </table>
  </div>
    </div>
    



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function check() {
		alert("하이");
		if (document.searchForm.keyWord.value == "") {
			alert("검색어를 입력하시오");
			document.searchForm.keyWord.focus();
			return false;
		}

		document.searchForm.submit(); //List.jsp
	}//check() end   

	
	
</script>


<style type="text/css">
  @media ( max-width: 720px ){
   #no{
   display: none;
   }
  #category{
  display: none;   
  }
   #title{
   display: 90%;
   }
   #mem_nick{
   display: 10%;
   }
   #date{
   display: none;   
   }
   #readcount{
   display: none;
   }
   #ip{
   display: none;
   }
   
}
  
</style>

</head>

<div class="container list" style="text-align:center;">
	<table class="table">
	<h2>맛집 추천 게시판</h2><br>


	<thead>
		<tr>
			<th>번호</th>
			<th>말머리</th>
			<th>제목</th>
			<th>닉네임</th>
			<th>작성일</th>
			<th>조회</th>
			<th>추천</th>
		</tr>
	</thead>

	<tbody>
		<!--상단 공지사항-->
		<tr class="ub-content us-post" data-type="icon_notice">
			<td class="gall_num">196828</td>
			<td class="gall_subject"><b>공지</b></td>
			<td class="gall_tit ub-word"><a href="#"><em
					class="icon_img icon_notice"></em> <b>자유 게시판 가이드 모음집</b> </a> <a
				class="reply_numbox" href="#"> <span class="reply_num">[17]</span>
					<!-- 위치 수정하기 -->
			</a></td>
			<td class="gall_writer ub-writer" data-uid="davidd3" data-ip=""
				data-loc="list"><span class="nickname in"><em>admin</em></span>
				<a class="writer_nikcon"> <img
					src="https://nstatic.dcinside.com/dc/w/images/fix_nik.gif"
					border="0" width="12" height="11"
					style="margin-left: 2px; cursor: pointer;"
					onclick="window.open('//gallog.dcinside.com/davidd3');"
					alt="갤로그로 이동합니다."> <!-- 위치 수정하기 -->
			</a></td>
			<td class="gall_date">19.03.03</td>
			<td class="gall_count">20253</td>
			<td class="gall_recommend">22</td>
		</tr>

		<!-- 내용 -->
		<c:forEach var="dto" items="${mat_list3}">
			
			
			<!-- 리스트 -->
			<tr>
				<td>
					<!-- 글 번호 --> <c:out value="${number}" /> <c:set var="number"
						value="${number-1}" />
				</td>

				<td>${dto.type}</td>

				<td>
					<!-- 글 내용 보기 --> 
						<c:if test="${dto.step>0}">
							<img src="resources/imgs/level.gif" width="${5*dto.indent}"
								height="16">
							<img src="resources/imgs/re.gif">
						</c:if> 
						
						<c:if test="${dto.step==0}">
							<img src="resources/imgs/level.gif" width="${5*dto.indent}"
								height="16">
						</c:if> 
						
							<a href="../nolza/mat_content?no=${dto.no}&pageNum=${pageNum}">
									 <em class="icon_img icon_txt"></em>${dto.title}
							</a> <!-- 댓글 개수 --> 
						
						
							<a class="reply_numbox" href="#"> 
						
								<span class="reply_num">[${dto.indent}]</span>
							
							</a>
							
							<c:if test="${dto.readcount>=20 }">
			               		<img src="resources/imgs/hot.png" border="0" height="18">
		            		 </c:if>   
							
				</td>

				<td>
					<!-- 닉네임 --> <span class="nickname"><em>${dto.mem_nick}</em></span>
				</td>

				<td>
					<!-- 날짜 --> ${dto.date}
				</td>

				<td>
					<!-- 조회수 --> ${dto.readcount}
				</td>

				<td>
					<!-- 좋아요 --> ${dto.tolike}
				</td>
			</tr>
			
		</c:forEach>
	</tbody>
</table>



					
	<table class="table">
	<tr>
		<td>
			<input type="button" class="write" onclick="document.location.href='mat_list'" value="전체글">
			<input type="button" class="write" onclick="document.location.href='mat_list'" value="개념글">

	
			<c:if test="${mem_id == null}" >
				<input type="button" class="write" onclick="document.location.href='mat_writeForm'" value="글쓰기" disabled=TRUE>
				
			</c:if>
			
			<c:if test="${mem_id != null}" >
				<input type="button" class="write" onclick="document.location.href='mat_writeForm'" value="글쓰기" >
				
			</c:if>
			
				<input type="button" class="write" onclick="document.location.href='mat_list3'" value="글목록" >
		
		
			<a class="active" style="float: right" href="#">About</a>
		</td>
	</tr>

	<tr>
		<td>
			<!-- 페이징 처리 --> <c:if test="${count>0 }">
				<c:set var="pageCount" value="${pageCount}" />
				<c:set var="pageBlock" value="${10}" />

				<fmt:parseNumber var="result" value="${currentPage/10}"
					integerOnly="true" />
				<c:set var="startPage" value="${result*10+1}" />
				<c:set var="endPage" value="${startPage+pageBlock-1}" />

				<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>

				<%--이전페이지 --%>
				<c:if test="${startPage > 10 }">
					<a href="mat_list?pageNum=${startPage-10}">[이전]</a>
				</c:if>

				<%--페이지처리 --%>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="mat_list?pageNum=${i}">[${i}]</a>
				</c:forEach>

				<%--다음 페이지 --%>
				<c:if test="${endPage < pageCount }">
					<a href="mat_list?pageNum=${startPage+10}">[다음]</a>
				</c:if>
			</c:if>

		</td>
	</tr>


</table>
</div>

<!-- 글 검색 -->
<form name="searchForm" method="post" action="view_mat3">

	<table>
		<tr>
			<td align="center" valign="botton"><select name="keyField">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="id">닉네임</option>
			</select> <input type="text" name="keyWord" size="16"> <input
				type="hidden" name="pageNum" value="0"> <input type="button"
				value="검색" onclick="check()"></td>
		</tr>
	</table>
</form>



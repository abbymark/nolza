<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${book_title }</title>
<script  src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script>

//좋아요 싫어요 버튼 기능
function likeCheck(book_likeState){
	//alert("likeCheck():"+$("#book_no").val()+"\n"+ $("#mem_id").val())
	if($("#reader_id").val()==''){
		alert("로그인후 이용해 주시기 바랍니다");
		return;
	}
	
	$.ajax({
		type:'POST',
		url:'book_likeCheck.do',
		data:"book_no="+$("#book_no").val()+"&book_likeState="+book_likeState+"&mem_id="+ $("#reader_id").val(),
		dataType:'JSON',
		success:function(data){
			//alert(data.likeValue);
			$("#likeCount").text(data.likeValue);
			$("#likeCnt").text(data.likeCnt);
			$("#dislikeCnt").text(data.dislikeCnt);			
		}//success end
	});//ajax end
	
	$("#initial").hide()
	if(book_likeState==1){
		$("#ifLike").show();
		$("#afterCancel").hide()
	}else if(book_likeState==-1){
		$("#ifDislike").show();
		$("#afterCancel").hide()
	}
}//likeCheck() end

//좋아요 싫어요 취소 버튼 기능
function likeCancel(book_likeState){
	
	$.ajax({
		type:'POST',
		url:'book_likeCancel.do',
		data:"book_no="+$("#book_no").val()+"&book_likeState="+book_likeState+"&mem_id="+ $("#reader_id").val(),
		/* data:{
			book_no:$("book_no").val(),
			book_likeState:book_likeState,
			mem_id:$("#reader_id").val()
		}, */
		dataType:'JSON',
		success:function(data){
			$("#likeCount").text(data.likeValue);
			$("#likeCnt").text(data.likeCnt);
			$("#dislikeCnt").text(data.dislikeCnt);	
		}
	})
	
	$("#initial").hide()
	if(book_likeState==1||book_likeState==-1){
		$("#ifLike").hide()
		$("#ifDislike").hide()
		
		$("#afterCancel").show()
	}
}

</script>
</head>
<body>
	<center><h2>글 내용 보기</h2></center>
	<form>
	<table border="1">
		
		<tr>
			
			<td>글번호</td>
			<td>${book_dto.book_no }
				<input type="hidden" id="reader_id" value="${mem_id }">
				<input type="hidden" id="mem_id" value="${book_dto.mem_id }">
		    	<input type="hidden" id="book_no" value="${book_dto.book_no }">
			</td>
			<td>조횟수</td>
			<td>${book_dto.book_readcount }</td>
		</tr>
		
		<tr>
			<td>글쓴이</td>
			<td>${book_dto.mem_nick }</td>
			<td>작성일</td>
			<td>
				<%-- ${dto.regdate } --%>
				<fmt:formatDate value="${book_dto.book_date }" pattern="yyyy-MM-dd hh:mm:ss"/>
			</td>
		</tr>
		
		<tr>
			<td>글 종류</td>
			<td colspan="3">${book_dto.book_type }</td>
		</tr>
		
		<tr>
			<td>글제목</td>
			<td colspan="3">${book_dto.book_title }</td>
		</tr>
		<tr>
			<td>글내용</td>
			<td colspan="3">
				<textArea rows="10" cols="60" readonly>${book_content }</textArea>
				<table border="1">
					<tr>
						<td>
							<span id="likeCnt">${book_dto.book_like_cnt }</span>
							<span id="initial">
								<c:if test="${book_likeState==null }">
									<input type="button" id="book_like" value="좋아요" onClick="likeCheck(1)">
									<input type="button" id="book_dislike" value="싫어요" onClick="likeCheck(-1)">
								</c:if>
								<c:if test="${book_likeState==1 }">
									<input type="button" id="cancel_like" value="좋아요 취소" onClick="likeCancel(1)">
								</c:if>
								<c:if test="${book_likeState==-1 }">
									<input type="button" id="cancel_dislike" value="싫어요 취소" onClick="likeCancel(-1)">
								</c:if>
							</span>
							
							
							<span id="ifLike" style="display:none">
								<input type="button" id="cancel_like" value="좋아요 취소" onClick="likeCancel(1)">
							</span>
							<span id="ifDislike" style="display:none">
								<input type="button" id="cancel_dislike" value="싫어요 취소" onClick="likeCancel(-1)">
							</span>
							
							
							<span id="afterCancel" style="display:none">
								<input type="button" id="book_like" value="좋아요" onClick="likeCheck(1)">
								<input type="button" id="book_dislike" value="싫어요" onClick="likeCheck(-1)">
							</span>
							<span id="dislikeCnt">${book_dto.book_dislike_cnt }</span>
						</td>
					</tr>
					<tr align="center">
						<td>
							<span id="likeCount" style="display:inline-block">${book_dto.book_like }</span>			
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="글수정" onclick="location.href='book_updateForm.do?book_no=${book_dto.book_no}&pageNum=${pageNum}'">
				<input type="button" value="글삭제" onclick="document.location.href='book_delete.do?book_no=${book_dto.book_no}&pageNum=${pageNum}&mem_id=${book_dto.mem_id }'">
				<input type="button" value="글쓰기" onclick="document.location.href='book_writeForm.do'">
				<input type="button" value="답글쓰기" onclick="document.location.href='book_writeForm.do?book_no=${book_dto.book_no}&book_group=${book_dto.book_group}&book_step=${book_dto.book_step }&book_indent=${book_dto.book_indent }'">
				<input type="button" value="글목록" onclick="location.href='book_list.do?pageNum=${pageNum}'">
			</td>
		</tr>
	</table>
	</form>
	
	<%--댓글기능 --%>
	댓글
	<table>
		<c:forEach var="cmt_dto" items="${cmt_list }">
			
		</c:forEach>
	</table>
</body>
</html>























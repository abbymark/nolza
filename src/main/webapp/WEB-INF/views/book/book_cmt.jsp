<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="getCommentList('${book_dto.book_no}')">
댓글 달리는 공간

<table>
	
	<tr>
		<td>
			<textArea id="cmt_content" name="cmt_content" placeholder="댓글을 입력하세요"></textArea>
		</td>
		<td>
			<input type="button" onClick="insertComment('${book_dto.book_no}', '${mem_id }', '${mem_nick }')" value="등록">
		</td>
	</tr>
	

	<tbody id="commentList">
		
	</tbody>
	<tr>
		<td>
			<%-- 이전페이지 --%>
			<c:if test="${startPage > 10}">
				<a href="book_list.do?pageNum=${startPage-10}&book_type=${book_type_eng }">[이전]</a>
			</c:if>
			
			<%-- 페이지처리 --%>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="book_list.do?pageNum=${i }&book_type=${book_type_eng }">[${i }]</a>
			</c:forEach>
			
			<%-- 다음페이지 --%>
			<c:if test="${endPage < pageCount}">
				<a href="book_list.do?pageNum=${startPage+10}&book_type=${book_type_eng }">[다음]</a>
			</c:if>		
		</td>
	</tr>
</table>
<script>

//댓글 등록하기
function insertComment(book_no, mem_id, mem_nick){
	//alert("check insertComment");
	
	$.ajax({
		type:'POST',
		url:"book_cmt_insert.do",
		data:"book_no="+book_no+"&mem_id="+ mem_id+"&mem_nick="+ mem_nick+"&cmt_content="+$("#cmt_content").val(),
		success:function(data){
			if(data=="success"){
				getCommentList(book_no);
				$("#cmt_content").val("");
			}
		}
	})
}

/* //페이지 처음 로딩시 댓글 리스트
$(function(){
	getCommentList();
}) */

//댓글 리스트 불러오기
function getCommentList(book_no){
	$.ajax({
		type:"POST",
		url:"book_cmt_list.do",
		data:"book_no="+book_no,
		dataType : "JSON",
		success:function(data){
			var html="";
			
			if(data.length > 0){
				for(i=0; i<data.length; i++){
					var cmt_content = data[i].cmt_content.replace(/(?:\r\n|\r|\n)/g, '<br />');
					html +="<tr>";
					html +="<td>"+data[i].mem_nick+"</td>";
					html +="<td>"+cmt_content+"</td>";					
					html +="</tr>";
				}	
			}else{
				html +="<tr>";
				html +="<td>등록된 댓글이 없습니다.</td>";
				html +="</tr>";
			}
			
			$("#commentList").html(html);
			
		}
	})
}
</script>

</body>
</html>
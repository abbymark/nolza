<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<title>Insert title here</title>
<body onload="getCommentList('${fm.fm_no}',1)">

<hr>  

<table>
	<tr>
		<td>
			<textArea id="cmt_content" name="cmt_content" placeholder="댓글을 입력하세요" cols="30"></textArea>
		</td>
		<td>
			<input type="button" onclick="insertComment('${fm.fm_no}','${mem_id}','${mem_nick}')" value="등록">
		</td>
	</tr>

	<tbody id="commentList">
	
	</tbody>
	<tr align="center">
		<td>
			<table>
				<tr id="paging">
				
				</tr>
			</table>
		</td>
	</tr>
</table>


<script>


//댓글 등록하기
function insertComment(fm_no, mem_id, mem_nick){
	//alert("check insertComment");
	
	$.ajax({
		type:'POST',
		url:"fm_cmt_insert.do",
		data:"fm_no="+fm_no+"&mem_id="+ mem_id+"&mem_nick="+ mem_nick+"&cmt_content="+$("#cmt_content").val(),
		success:function(data){
			if(data=="success"){
				getCommentList(fm_no,1);
				$("#cmt_content").val("");
			}
		}
	})
}

/*
//페이지 처음 로딩시 댓글 리스트
$(function(){
	getCommentList();
}) 
*/




//댓글 리스트 불러오기
function getCommentList(fm_no,page){
	//alert("fm_no:"+fm_no)
	//alert("page:"+page)
	$.ajax({
		type:"POST",
		url:"fm_cmt_list.do",
		data:"fm_no="+fm_no+"&page="+page,
		dataType : "JSON",
		success:function(data){
			cmtCnt=getCmtCnt(fm_no);
			//console.log(cmtCnt);
			var html="";
			var paging="";
			
			if(cmtCnt > 0 && page==1){
				if(cmtCnt%10!=0){
					for(i=0; i<cmtCnt%10; i++){
						//console.log(data)
						//console.log(data[i]);
						//var cmt_content = data[i].cmt_content.replace(/(?:\r\n|\r|\n)/g, '<br />');
						//id="\""+data[i].mem_id+"\""
						html +="<tr>";
						html +="<td>"+data[i].mem_nick+"</td>";
						html +="<td>"+data[i].cmt_content.replace(/(?:\r\n|\r|\n)/g, '<br />')+"</td>";	
						html +="<td>"+data[i].cmt_date+"</td>";
						html +="<td><button onclick='deleteComment(\"${fm.fm_no}\","+data[i].cmt_no+",\"${sessionScope.mem_id}\","+page+")')>x</button></td>";
						//html +="<td>${sessionScope.mem_id}&nbsp;"+data[i].mem_id+""+id+"</td>";
						//html +="<c:set var='id' value='"+data[i].mem_id+"' />"
						//html +='<c:if test="${sessionScope.mem_id eq id}">'
						//html +='</c:if>'
						html +="</tr>";
						//console.log(data[i].mem_nick)
					}
				}else{
					for(i=0; i<10; i++){
						//console.log(data)
						//console.log(data[i]);
						//var cmt_content = data[i].cmt_content.replace(/(?:\r\n|\r|\n)/g, '<br />');
						html +="<tr>";
						html +="<td>"+data[i].mem_nick+"</td>";
						html +="<td>"+data[i].cmt_content.replace(/(?:\r\n|\r|\n)/g, '<br />')+"</td>";
						html +="<td>"+data[i].cmt_date+"</td>";
						html +="<td><button onclick='deleteComment(\"${fm.fm_no}\","+data[i].cmt_no+",\"${sessionScope.mem_id}\","+page+")')>x</button></td>";
						html +="</tr>";
						//console.log(data[i].mem_nick)
					}
				}
				
				
				paging +="<td>";
				for(i=0; i< cmtCnt/10; i++){
					paging += "<button onclick='getCommentList(\"${fm.fm_no}\", "+(i+1)+")'>"+(i+1)+"</button>&nbsp;";
				}
				paging +="</td>"
				
			}else if(cmtCnt > 0 && page!=1){
				for(i=0; i<10; i++){
					//console.log(data)
					console.log(data[i]);
					//var cmt_content = data[i].cmt_content.replace(/(?:\r\n|\r|\n)/g, '<br />');
					html +="<tr>";
					html +="<td>"+data[i].mem_nick+"</td>";
					html +="<td>"+data[i].cmt_content.replace(/(?:\r\n|\r|\n)/g, '<br />')+"</td>";
					html +="<td>"+data[i].cmt_date+"</td>";
					html +="<td><button onclick='deleteComment(\"${fm.fm_no}\","+data[i].cmt_no+",\"${sessionScope.mem_id}\","+page+")')>x</button></td>";
					html +="</tr>";
					//console.log(data[i].mem_nick)
				}	
				
				paging +="<td>";
				for(i=0; i< cmtCnt/10; i++){
					paging += "<button onclick='getCommentList(\"${fm.fm_no}\", "+(i+1)+")'>"+(i+1)+"</button>&nbsp;";
				}
				paging +="</td>"
				
			}else{
				html +="<tr>";
				html +="<td>등록된 댓글이 없습니다.</td>";
				html +="</tr>";
			}
			
			$("#commentList").html(html);
			$("#paging").html(paging);
		}
	})
}




//댓글 갯수 구해오기
function getCmtCnt(fm_no){
	var cmtCnt;
	$.ajax({
		type:"POST",
		url:"fm_cmt_cnt.do",
		async:false,
		data:"fm_no="+fm_no,
		success:function(data){
			
			cmtCnt= parseInt(data);
		}
	})
	return cmtCnt
}

//댓글 삭제
function deleteComment(fm_no,cmt_no,mem_id,page){
	$.ajax({
			type:"POST",
			url:"fm_cmt_delete.do",
			async:false,
			data:"fm_no="+fm_no+"&cmt_no="+cmt_no+"&mem_id="+mem_id,
			success:function(data){
				if(data=="success"){
					alert("댓글이 삭제되었습니다.");
				}else{
					alert("작성자가 아닙니다");
				}
			}
	})
	getCommentList(fm_no,page);
}

</script>


</body>
</html>
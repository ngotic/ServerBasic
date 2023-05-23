<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/inc/asset.jsp" %>

<style>
#content{
	height: 215px;
}
#comment td:nth-child(1){ width: auto; }
#comment td:nth-child(2){ 
	width: 200px; 
	text-align:center;
}
#addcomment td:nth-child(1){ width: auto; }
#addcomment td:nth-child(2){ 
	width: 200px; 
	text-align:center;
}
.comment-content {
	display: flex;
/* 	display: table-cell; 원래 이값이다 테이블은*/ 
	justify-content :space-between;
}
.comment-regdate {
	font-size: 12px;
	color: #777;
}


</style>

</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1>게시판 <small>글보기</small></h1>

		<table class="vertical">
			<tr>
				<th>번호</th>
				<td>${dto.seq}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.name}(${dto.id})</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><c:out value="${dto.subject}"></c:out></td>
			</tr>
			<tr>
				<th>내용</th>
				<td id="content">${dto.content}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${dto.regdate}</td>
			</tr>
			<tr>
				<th>읽음</th>
				<td>${dto.readcount}</td>
			</tr>
		</table>
		
		
		
		<table id="comment">
			<c:forEach items="${clist}" var="cdto">
			<tr>	
				<td>
					<div  class="comment-content">
						<div><c:out value="${cdto.content}"/></div>
						<div class="comment-regdate">${cdto.regdate}</div>
					</div>
					
				</td>
				
				<td>
					<div>
						<div>${cdto.name}(${cdto.id})</div>
						<c:if test="${not empty id && (id == cdto.id || lv == '3') }">
						<div>
							<button type="button" class="edit" onclick="editComment(${cdto.seq});">수정</button>
							<button type="button" class="del" onclick="delComment(${cdto.seq});">삭제</button>
						</div>
						</c:if>
					</div>
					
				</td>
			</tr>
			</c:forEach>
		</table>
		
		<c:if test="${not empty id}">
			<form method="POST" action="/toy/board/comment.do">
				<table id="addcomment">
					<tr>
						<td><input type="text" name="comment" class="full" required></td>
						<td>
							<button type="submit" class="comment">댓글쓰기</button>
						</td>
					</tr>
				</table>
				<input type="hidden" name="bseq" value="${dto.seq}">
				<input type="hidden" name="column" value="${column}">
				<input type="hidden" name="word" value="${word}">
				<input type="hidden" name="search" value="${search}">
			</form>
		</c:if>
		
		
		
		<div>
		
			<c:if test="${search=='n'}">
						<button type="button" class="back" onclick="location.href='/toy/board/board.do?';">돌아가기</button>
			</c:if>
			<c:if test="${search=='y'}">
						<button type="button" class="back" onclick="location.href='/toy/board/board.do?column=${column}&word=${word}&search=${search}';">돌아가기</button>
			</c:if> 
		
			<c:if test="${not empty id && (id== dto.id || lv=='3' ) }">
				<button type="button" class="back" onclick="location.href='/toy/board/edit.do?seq=${dto.seq}';">수정하기</button>
				<button type="button" class="back" onclick="location.href='/toy/board/del.do?seq=${dto.seq}';">삭제하기</button>
				<button type="button" class="back" onclick="location.href='/toy/board/add.do?mode=reply&thread=${dto.thread}&depth=${dto.depth}';">답변하기</button>
				
			</c:if>
			
			
		</div>
		
		<!-- <div>
			<button type="submit" class="back" onclick="history.back();">돌아가기</button>
		</div> -->
	
	</main>
	
	<form id="editCommentForm" method="POST"
	action="/toy/board/editcomment.do">
		<input type="hidden" name="bseq" >
		<input type="hidden" name="cseq" >
		<input type="hidden" name="content" >
	</form>
	

<script>
	function editComment(cseq) {
		
		$('.edit-comment').remove(); // 이전 수정중인 댓글 폼 > 전부 삭제 
		
		const content = $(event.target).closest('tr').find('.comment-content').children().eq(0).text();
		
		$(event.target).closest('tr').after(`
					<tr style="background-color: #EFEFEF;" class="edit-comment">

						<td><input type="text" class="full" value="\${content}" id="editcomment"></td>
						<td>
							<input type="button" value="확인" onclick="editOkComment(\${cseq});">
							<input type="button" value="취소" onclick="cancelComment();">
						</td>
					</tr>
				`);		
	} 
	
	
	function delComment(cseq) {
		
		location.href= '/toy/board/delcomment.do?seq=${dto.seq}&cseq='+cseq;
	}
	
	function cancelComment(){
		$(event.target).closest('tr').remove();
	}
	
	function editOkComment(cseq){
		// 부모 글번호
		// 수정할 댓글 번호 // 5 부모 글번호
		// 수정할 댓글 내용 //10 댓글
		console.log(${dto.seq});
		console.log(cseq);
		console.log($('#editcomment').val());
		$('#editCommentForm input[name=bseq]').val(${dto.seq});
		$('#editCommentForm input[name=cseq]').val(cseq);
		$('#editCommentForm input[name=content]').val($('#editcomment').val());
		
		$('#editCommentForm').submit();
		
	}
</script>
</body>
</html>

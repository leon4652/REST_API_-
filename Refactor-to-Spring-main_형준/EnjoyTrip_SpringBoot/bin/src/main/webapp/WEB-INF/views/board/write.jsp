<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/write.css" />
<title>게시글 작성</title>
</head>
<body>
	<div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp"%></div>
	<div class="container">
		<form id="writeForm" class="boardContent" method="post" action="${root}/board/write">
		<input type="hidden" name="action" value="write" />
		<input id="subject" name="subject" class="subject" placeholder="제목을 입력하세요"></input>
		<div class="contentDiv">
			<textarea id="content" name="content" class="contentText" placeholder="내용을 입력하세요">${board.content}</textarea>
		</div>
		<div class="btnBox">
			<button type="button" onclick="doWrite()">완료</button>
		</div>
		</form>
		<div><a href="${root}/board/list">목록으로 돌아가기</a></div>
	</div>
	<script>
		function doWrite() {
			if(document.getElementById("subject").value == "") {
				alert("제목을 입력해주세요.");
			} else if(document.getElementById("subject").value == "") {
				alert("내용을 입력해주세요.");
			} else {
				document.getElementById("writeForm").submit();
			}
		}
	</script>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>

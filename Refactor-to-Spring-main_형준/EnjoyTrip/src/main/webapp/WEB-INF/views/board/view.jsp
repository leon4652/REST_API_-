<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/list_view.css" />
<title>게시글</title>
</head>
<body>
	<div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp"%></div>
	<div class="container">
		<form id="viewForm" class="viewForm" method="post" action="${root}/board/modify">
			<input type="hidden" name="articleNo" value="${board.articleNo}" />
			<div class="title">#${board.articleNo}. 
			<input id="subject" class="subjectInput" name="subject" value="${board.subject}" readonly>
			</div>
			<div class="viewBoard">
				<table class="viewTable">
					<tr>
						<th class="tableTitle">작성자</th>
						<td>${board.userId}</td>
					</tr>
					<tr>
						<th class="tableTitle">조회수</th>
						<td>${board.hit}</td>
					</tr>
					<tr>
						<th class="tableTitle">작성시간</th>
						<td>${board.registerTime}</td>
					</tr>
				</table>
				<div class="boardContent">
					<textarea id="content" name="content" cols="50" readonly>${board.content}</textarea>
				</div>
			</div>
		</form>
		<div id="viewBtnBox" class="viewBtn link">
			<c:if test="${board.userId eq userInfo.id}">
			<div><button id="modBtn" onclick="changeToModify()">수정</button></div>
			<button id="delBtn" onclick="doDel()">삭제</button>
			</c:if>
		</div>
		<div class="link"><a href="${root}/board/list">목록으로 돌아가기</a></div>
	</div>
	<script>
	function doDel(){
		if(confirm("정말 삭제하시겠습니까?")) {
	    	location.href = "${root}/board/delete?articleNo=${board.articleNo}";
	    }
	}
	
	function changeToModify() {
		document.getElementById("subject").readOnly = false;
		document.getElementById("content").readOnly = false;
		
		let divEle = document.getElementById("viewBtnBox");
		divEle.innerHTML = `
			<c:if test="${board.userId eq userInfo.id}">
				<div><button id="okBtn" onclick="doMod()">완료</button></div>
				<button id="canBtn" onclick="doCan()">취소</button>
			</c:if>
		`;
		
		let subjectEle = document.getElementById("subject");
		let value = subjectEle.value;
		subjectEle.focus();
		subjectEle.value = "";
		subjectEle.value = value;
		subjectEle.className = "subjectInputFocus";
		scrollToTop();
	}
	
	function doMod() {
		document.getElementById("viewForm").submit();
	}
	
	function doCan() {
		let subjectEle = document.getElementById("subject");
		let contentEle = document.getElementById("content");
		
		subjectEle.value = `${board.subject}`;
		subjectEle.readOnly = true;
		subjectEle.className = "subjectInput";
		contentEle.value = `${board.content}`;
		contentEle.readOnly = true;
		
		let divEle = document.getElementById("viewBtnBox");
		divEle.innerHTML = `
			<c:if test="${board.userId eq userInfo.id}">
				<div><button id="modBtn">수정</button></div>
				<button id="delBtn">삭제</button>
			</c:if>
		`;
	}
	</script>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>

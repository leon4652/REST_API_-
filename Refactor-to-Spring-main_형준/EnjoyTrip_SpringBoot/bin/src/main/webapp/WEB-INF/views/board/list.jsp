<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/list_view.css" />
<title>커뮤니티</title>
</head>
<body>
	<div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp"%></div>
	
	<!-- 변수 선언  page탭 관련 과 가지고온 게시물 리스트 -->
	<c:set var ="pageResult" value="${boardMap.pageResult}" />
	<c:set var ="list" value ="${boardMap.list}" />
	
	<div class="container">
	<div class="titleDiv">
		<span class="title">자유 게시판</span>
		<button class="listButton" onclick="doWrite()">작성하기</button>
	</div>
	<table class="listTable">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.articleNo}</td>
				<td><a href="${root}/board/view?articleNo=${board.articleNo}">${board.subject}</a></td> 
				<td>${board.userId}</td> 
				<td>${board.hit}</td>
			</tr>
		</c:forEach>	
	</table>
	<c:if test ="${pageResult.count != 0 }">
		<nav>
			<ul class ="pagination">
				<!-- 이전 버튼 -->
				<li class="<c:if test="${pageResult.prev eq false}">disabled</c:if>">
					<a href ="<c:if test="${pageResult.prev eq true}">${root}/board/list?pageNo=${pageResult.beginPage - 1 }</c:if>" aria-label ="previous">
						<span aria-hidden ="true">이전</span>
					</a>
				</li>
				<!-- 탭 번호 -->
				<c:forEach var ="i" begin="${pageResult.beginPage}" end ="${pageResult.endPage}">
					<c:choose>
						<c:when test="${i eq pageResult.pageNo}">
							<li class="active"><a href="#1">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${root}/board/list?pageNo=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>				
				</c:forEach>
				
				<!-- 다음 버튼 -->
				<!-- 만약에 false면 클래스이름을 disabled 를 주겠다 그게 아니면 그냥 클래스 이름 없는 li 생성 -->
				<li class="<c:if test="${pageResult.next eq false}">disabled</c:if>">
					<a href="<c:if test="${pageResult.next eq true}">${root}/board/list?pageNo=${pageResult.endPage + 1}</c:if>" aria-label="next">
						<span aria-hidden="true">다음</span>
					</a>
				</li>
			</ul>
		</nav>
	</c:if>
	</div>
	<div id="footer"><%@ include file="/WEB-INF/views/include/footer.jsp" %></div>
	<script>
		function doWrite() {
			location.href="${root}/board/writeForm";
		}
		$("ul.nav.navbar-nav > li").removeClass("active");
		$("ul.nav.navbar-nav > li:eq(2)").addClass("active");
	</script>
</body>
</html>

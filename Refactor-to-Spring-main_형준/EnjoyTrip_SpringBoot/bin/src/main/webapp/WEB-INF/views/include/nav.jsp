<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/resources/css/header.css" />
<link rel="stylesheet" href="${root}/resources/css/font.css" />

<a href="${root}/"><img id="logo" class="logo"
	src="${root}/resources/img/logo.png" alt="메인이미지" /></a>
<div class="header">
	<div class="nav">
		<div>
			<a href="${root}/attraction/mainList">여행지</a>
		</div>
		<div>
			<a>여행계획</a>
		</div>
		<div>
			<a href="${root}/board/list">커뮤니티</a>
		</div>
		<div id="mysub">
			<c:choose>
				<%-- session에 userInfo 객체 없는 경우(로그인 X) --%>
				<c:when test="${empty userInfo}">
					<a href="${root}/user/login" id="login">로그인</a>
				</c:when>
				<%-- session에 userInfo 객체 있는 경우(로그인 O) --%>
				<c:otherwise>
					<a>${userInfo.id}님 반갑습니다!</a>
					<a href="${root}/user/logout" style="margin-right: 15px">로그아웃</a>
					<a href="${root}/mypage/mypageForm">마이페이지</a>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</div>




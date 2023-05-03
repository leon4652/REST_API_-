<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/index.css" />

</head>
<body>
	<div class="mainImg">
		<div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp"%></div>
		<div class="container">
			<div class="center">
				<div>
					<h1>Enjoy Trip</h1>
				</div>
				<form action="${root}/attraction/mainList">
					<div class="strBtn">
						<button>시작하기</button>
					</div>
				</form>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${root}/resources/css/searchnav.css" />	

<script src="https://kit.fontawesome.com/d244985e0e.js" crossorigin="anonymous"></script>
<div class="search">
	<form class="formbox" method="post" action="${root}/attraction/search" >
		<input type="text" name="keyword" id="serachInput" />
		<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
	</form>
</div>
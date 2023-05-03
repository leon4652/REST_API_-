<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>로그인</title>
<link rel="stylesheet" href="${root}/resources/css/login.css" />
</head>
<body>
	<div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp"%></div>
	<div class="container">
		<div class="login-page">
			<h1>Enjoy trip</h1>
			<div class="form">
				<form class="login-form" id="login-form" method="post">
					<!-- 값 넘길곳 위치 -->
					<input type="hidden" name ="action" value="login"/>
					<input id="id" name="id" type="text" placeholder="ID" /> 
					<input id="password" name="pw" type="password" placeholder="password"/>
					<div class="buttonbox">
						<button class="login-btn" onclick="login()" type="button">로그인</button>
						<button onclick="location.href='${root}/user/regist'" type="button">회원가입</button>
					</div>
				</form>
				<div class="login-add">
					<a href="" onclick="id_find()">계정 찾기</a> <a href=""
						onclick="pw_find()">비밀번호 찾기</a>
				</div>
			</div>
		</div>
	</div>
    <script>
    	
    	
    
      //window 새창으로 id_find.html 호출
      function id_find() {
        window.open("${root}/user/idFind", "PopupWin", "width=460px,height=350px");
      }

      //window 새창으로 pw_find.html 호출
      function pw_find() {
        window.open("${root}/user/pwFind", "PopupWin", "width=460px,height=400px");
      }

      function login() {
        //사용자가 입력한 id와 pw의 값을 받아온다
        let id = document.getElementById("id").value;
        let pwd = document.getElementById("password").value;
	
        
        if (!id) {
        	//아이디를 입력하지 않았다면
         	alert("아이디를 입력해주세요");
        	return;
        }else if(!pwd){
        	//비밀번호를 입력하지 않았다면
        	alert("비밀번호를 입력해주세요");
        	return;
        }else {
        	let form = document.querySelector("#login-form");
        	form.setAttribute("action", "${root}/user/login");
			form.submit();
        }
      }
    </script>
</body>
</html>

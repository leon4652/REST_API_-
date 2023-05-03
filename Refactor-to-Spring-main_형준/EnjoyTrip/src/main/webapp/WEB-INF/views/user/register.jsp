<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원가입</title>
<link rel="stylesheet" href="${root}/resources/css/register.css" />
</head>
<body>
	<div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp"%></div>
	<div class="container">
		<div class="register-page">
			<p class="title">회원가입</p>
			<div class="form">
				<form name="loginForm" class="login-form" method="post" action="${root}/user/regist">
					<input id="id" name="id" type="text" placeholder="ID" value="" />
					<div id="idchkComent"> 아이디를 입력해주세요. </div>
					<input id="pw" name="pw" type="password" placeholder="password" value="" /> 
					<input id="pwcheck" name="pwcheck" type="password" value="" placeholder="confirm password" />
					<input id="name" name="name" type="text" value=""
						placeholder="nickname" /> <input id="email" name="email"
						type="email" value="" placeholder="email" />
				</form>
			</div>
			<div class="buttonbox">
				<button onclick="register()" type="button">가입하기</button>
			</div>
		</div>
	</div>
	<script>

	let id = document.getElementById("id");
	id.addEventListener("change", function(e){
		fetch("${root}/user/duplicateCheck?id="+id.value)
		.then((response) => response.text())
		.then((data) => {
			console.log(data);
			idcheckText(data);
		})
	})
	
	function idcheckText(data){
		let div = document.getElementById("idchkComent");
		let idV = document.getElementById("id").value;
		if(idV.trim() == ""){
			div.innerText = "아이디 입력해주세요.";
		}else if(data == 0){
			div.innerText = "사용할수 없는 아이디입니다.";
		}else{
			div.innerText = "사용할수 있는 아이디 입니다.";
		}
	}
    	
    function register() {
        //사용자가 입력한 id와 pw의 값을 받아온다
        let id = document.getElementById("id").value;
        let pwd = document.getElementById("pw").value;
        let pwdCheck = document.getElementById("pwcheck").value;
        let name = document.getElementById("name").value;
        let email = document.getElementById("email").value;
		
        if (!id) {
        	//아이디를 입력하지 않았다면
         	alert("아이디를 입력해주세요");
        	return;
        }else if("${idCheck}" == "0"){
        	alert("사용할수 없는 아이디 입니다");
        }else if(!pwd){
        	//비밀번호를 입력하지 않았다면
        	alert("비밀번호를 입력해주세요");
        }else if(!pwdCheck){
        	alert("확인 비밀번호를 입력해주세요");
        	return;
        }else if(pwd != pwdCheck){
        	alert("비밀번호가 일치하지 않습니다!");
        	return;
        }else if(!name){
        	alert("이름을 입력해주세요");
        	return;
        }else if(!email){
        	alert("이메일을 입력해주세요");
        	return;
        }else {
        	let form = document.querySelector(".login-form");
			form.submit();
        }
		
    }
     
    
    </script>

</body>
</html>

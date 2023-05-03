<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지</title>
<link rel="stylesheet" href="${root}/resources/css/myPage.css" />
</head>
<body>
	<div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp"%></div>
	<div class="container">
      <div class="register-page">
        <p class="title">마이페이지</p>
        <div class="form">
          <form name="login-form" class="login-form" method="post" action="${root}/mypage/modify">
          	<div class="label">아이디</div>
            <input id="id" name="id" type="text" placeholder="ID (수정 불가)" value="${userInfo.id}" readonly />
          	<div class="label">이름</div>
            <input id="name" name="name" type="text" placeholder="name" value="${userInfo.name}" readonly />
          	<div class="label">이메일</div>
            <input id="email" name="email" type="email" placeholder="email" value="${userInfo.email}" readonly />
            <div class="buttonbox">
              <button onclick="doUpdate()" type="button">수정하기</button>
            </div>
          </form>
          <a href="" onclick="doDelete(this)">탈퇴하기</a>
        </div>
      </div>	
    </div>

	<script>
		function doUpdate() {
			let btnBox = document.querySelector(".buttonbox");
			btnBox.innerHTML = "";
			
			let okBtn = document.createElement("button");
			okBtn.setAttribute("type", "submit");
			okBtn.innerText = "확인";
			btnBox.appendChild(okBtn);
			
			let cancelBtn = document.createElement("button");
			cancelBtn.setAttribute("onclick", "doCancel()");
			cancelBtn.setAttribute("type", "button");
			cancelBtn.innerText = "취소";
			btnBox.appendChild(cancelBtn);
			
			document.getElementById("name").readOnly = false;
			document.getElementById("email").readOnly = false;
			document.getElementById("name").focus();
		}
	    
	    // 취소 버튼을 클릭했을 때
	    function doCancel() {
	      let btnBox = document.querySelector(".buttonbox");
		  btnBox.innerHTML = "";
		  
		  let btnEle = document.createElement("button");
		  btnEle.setAttribute("onclick", "doUpdate()");
		  btnEle.setAttribute("type", "button");
		  btnEle.innerText = "수정하기";
		  btnBox.appendChild(btnEle);
		  
		  document.getElementById("name").readOnly = true;
		  document.getElementById("email").readOnly = true;
	    }
	    
	    // 탈퇴 버튼을 클릭했을 때
	    function doDelete(_this) {
	      if(confirm("정말 탈퇴하시겠습니까?")) {
	    	  _this.href = "${root}/mypage/withdrawal";
	      }
	    }
    </script>

</body>
</html>

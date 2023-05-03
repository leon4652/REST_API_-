<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
    <link rel="stylesheet" href="${root}/resources/css/idFind.css" />
    <title>아이디 찾기</title>
  </head>
  <body>
    <div id="box">
      <hr class="outline" />
      <h3>아이디 찾기</h3>
      <hr />
      <form name="id_find_form" method="post" action="">
        <span>이름</span><br />
        <input id="name" type="text" name="name" /><br />
        <span>이메일</span><br />
        <input id="email" type="text" name="email" /><br />
        <hr class="outline" />
        <a href="#">
        	<img src="${root}/resources/img/okay.png" width="150px" height="65px" onclick="id_finds()" />
        </a>
      </form>
    </div>
    <script type="text/javascript">
      function id_finds() {
        if (!document.id_find_form.name.value) {
          alert("이름을 입력하세요.");
          document.id_find_form.name.focus();
          return;
        }
        if (!document.id_find_form.email.value) {
          alert("이메일을 입력하세요");
          document.id_find_form.email.focus();
          return;
        }
        
        let encodeUri = encodeURI("${root}/user/idfind?name=" + document.id_find_form.name.value + "&email=" + document.id_find_form.email.value);
        fetch(encodeUri)
		.then((response) => {
			return response.json();
		})
		.then((data) => {
			if(data.id == null) {
				alert("이름 또는 이메일을 확인하세요.")
			} else {
				alert("아이디 [" + data.id + "] 입니다.");
				window.close();
			}
		})
      }
    </script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link rel="stylesheet" href="${root}/resources/css/pwFind.css" />
	<title>비밀번호 찾기</title>
  </head>
  <body>
    <div id="box">
      <hr class="outline" />
      <h3>비밀번호 찾기</h3>
      <hr />
      <form name="pw_find_form" method="post" action="${root}/user/pwfind">
        <span>아이디</span><br />
        <input id="id" type="text" name="id" /><br />
        <span>이메일</span><br />
        <input ide="email" type="text" name="email" /><br />
        <hr class="outline" />
        <a href="#"
          ><img src="${root}/resources/img/okay.png" width="150px" height="65px" onclick="pw_finds()"
        /></a>
      </form>
    </div>
    <script type="text/javascript">
      function pw_finds() {
        if (!document.pw_find_form.id.value) {
          alert("아이디를 입력하세요");
          document.pw_find_form.id.focus();
          return;
        }
        if (!document.pw_find_form.email.value) {
          alert("이메일을 입력하세요");
          document.pw_find_form.email.focus();
          return;
        }
        
        document.pw_find_form.submit();
      }
    </script>
  </body>
</html>

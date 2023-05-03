<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      <%@ include file="/WEB-INF/views/include/head.jsp"%>
    <link rel="stylesheet" href="${root}/resources/css/pwFind.css" />
    <title>비밀번호 변경</title>
  </head>
  <body>
    <div id="box">
    <c:if test="${update eq 1}">
    	<script>
	    	alert("비밀번호 변경이 완료되었습니다.");
			window.close()
    	</script>
    </c:if>
    <c:if test="${not empty user.id}">
      <hr class="outline" />
      <h3>비밀번호 변경</h3>
      <hr />
      <form name="pw_update_form" method="post" action="${root}/user/pwupdate">
      	<input type="hidden" name="id" value="${user.id}" />
        <span>비밀번호</span><br />
        <input id="passwd" type="password" name="passwd" /><br />
        <span>비밀번호 확인</span><br />
        <input id="passwdConfirm" type="password" name="passwdConfirm" /><br />
        <hr class="outline" />
        <a href="#"
          ><img src="${root}/resources/img/okay.png" width="150px" height="65px" onclick="pw_finds()"
        /></a>
      </form>
    </div>
    <script type="text/javascript">
      function pw_finds() {
        if (!document.pw_update_form.passwd.value || !document.pw_update_form.passwdConfirm.value) {
          alert("비밀번호를 입력해주세요.");
          return;
        }
        if (document.pw_update_form.passwd.value != document.pw_update_form.passwdConfirm.value) {
            alert("비밀번호가 다릅니다. 다시 입력해주세요.");
            document.pw_update_form.passwd.focuse();
            return;
        }
        
        document.pw_update_form.submit();
      }
    </script>
    </c:if>
    <c:if test="${empty user.id}">
    	<script>
    		alert("아이디 또는 이메일을 확인하세요.");
    		history.back();
    	</script>
    </c:if>
  </body>
</html>

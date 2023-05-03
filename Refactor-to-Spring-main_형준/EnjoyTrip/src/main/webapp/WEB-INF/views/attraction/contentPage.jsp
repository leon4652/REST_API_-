<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>종류별 화면</title>
    <link rel="stylesheet" href="${root}/resources/css/areaPage.css" />
    <script src="${root}/resources/js/searchtitle.js"></script>
  </head>
  <body>
    <div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp" %></div>
<%--       <c:forEach var="content" items="${contentList}"> --%>
<%--       		<c:out value="${content.contentId}" /> --%>
<%--       	<c:if test="${content.contentId == attList.contentTypeId}"> --%>
<%--       		<c:set var="contentTypeName" value="${content.contentName}" /> --%>
<%--       	</c:if> --%>
<%--       </c:forEach> --%>
    <div class="container">
      <%@ include file="/WEB-INF/views/include/searchnav.jsp" %>
      
      <div class="typeList">
      	<p class="title">인기  ${contentTypeName}</p>
        <hr />
        <br />
        
      	<div id="">
	      <ul class="showList">
	      <c:set var="noImg" value="${root}/assets/img/noimage.png"></c:set>
	      <c:forEach var="att" items="${attList}">
			<!-- 목록 붙이기 -->
			<c:set var="imageUrl" value="${empty att.firstImage ? noImg : att.firstImage}"></c:set>
	          	  <li class="item category" style="background-image: url(${imageUrl});">
	                <div onclick="movePage(${att.contentId})">${att.title}</div>
	              </li>
	      </c:forEach>
	      </ul>
      	</div>
      </div>
    </div>
    <div id="footer"><%@ include file="/WEB-INF/views/include/footer.jsp" %></div>

    <script src="${root}/resources/js/key.js"></script>
    <script>
    	function movePage(contentId) {
    		location.href = '${root}/attraction/detailForm?contentId=' + contentId+"&mode=content";
    	}
    </script>
  </body>
</html>
    
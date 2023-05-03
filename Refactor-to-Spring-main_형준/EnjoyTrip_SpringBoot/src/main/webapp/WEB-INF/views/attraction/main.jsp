<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관광지 검색</title>
    <link rel="stylesheet" href="${root}/resources/css/main.css" />
    <script src="${root}/resources/js/searchtitle.js"></script>
  </head>
  <body>
    <div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp" %></div>
    <div class="container">
      <%@ include file="/WEB-INF/views/include/searchnav.jsp" %>
      <div id="regionListId" class="regionList">
        <p class="title">지역별</p>
        <hr />
        <br />

        <div id="regionImages" class="images">
          <c:forEach var="sido" items="${typeMap.sidoList}">
          	<span class="category" style="background-image: url(${root}/resources/img/regionImg${sido.sidoCode}.png)" onclick="moveSidoPage(${sido.sidoCode})">
              <div id="type${sido.sidoCode}">${sido.sidoName}</div>
            </span>
          </c:forEach>
        </div>
      </div>
      <div id="categoryListId" class="categoryList">
        <p class="title">종류별</p>
        <hr />
        <br />
        <div class="images">
          <c:forEach var="content" items="${typeMap.contentTypeList}">
	          <span class="category" style="background-image: url(${root}/resources/img/category${content.contentTypeId}.jpg)" onclick="moveContentPage(${content.contentTypeId})">
	            <div id="type${content.contentTypeId}">${content.contentTypeName}</div>
	          </span>
          </c:forEach>
        </div>
      </div>
    </div>
    <div id="footer"><%@ include file="/WEB-INF/views/include/footer.jsp" %></div>

    <script src="${root}/resources/js/key.js"></script>
    <script>
    	function moveSidoPage(sidoCode) {
    		location.href = '${root}/attraction/areaPage?sido=' + sidoCode;
    	}
    	
    	function moveContentPage(contentTypeId) {
    		location.href = '${root}/attraction/contentPage?content=' + contentTypeId;
    	}
    </script>
  </body>
</html>
    
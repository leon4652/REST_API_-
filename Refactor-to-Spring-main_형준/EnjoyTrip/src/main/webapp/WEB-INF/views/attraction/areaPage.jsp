<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>지역별 화면</title>
    <link rel="stylesheet" href="${root}/resources/css/areaPage.css" />
    <script src="${root}/resources/js/searchtitle.js"></script>
  </head>
  <body>
    <div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp" %></div>
    
    <div class="container">
      <%@ include file="/WEB-INF/views/include/searchnav.jsp" %>
      <div class="typeList">
      <c:forEach var="content" items="${typeMap.contentTypeList}">
      	<div id="type${content.contentTypeId}">
          <p onclick="show(${content.contentTypeId}, this)" class="fold">
           	${content.contentTypeName}<span class="icon"><i class="fa-solid fa-plus"></i></span>
          </p>
		<!-- 목록 붙이기 -->
<%-- 		<c:if test="${not empty attList} && ${requestScope.contentId eq content.contentId}"> --%>
<%--           <c:forEach var="attraction" items="attList"> --%>
<!--           	<ul> -->
<%--           	  <li class="item category" style="background-image: url(${attraction[firstImage]});"> --%>
<%--                 <div onclick="">${attraction[title]}</div> --%>
<!--               </li> -->
<!--           	</ul> -->
<%--           </c:forEach> --%>
<%--         </c:if> --%>
        </div>
      </c:forEach>
      </div>
    </div>
    <div id="footer"><%@ include file="/WEB-INF/views/include/footer.jsp" %></div>

	<script src="https://kit.fontawesome.com/d244985e0e.js" crossorigin="anonymous"></script>
    <script src="${root}/resources/js/key.js"></script>
    <script type="text/javascript">
		function show(contentId, _this) {
			if(_this.className == 'fold') {
				fetch("${root}/attraction/areaContent?sido=${sidoCode}&content=" + contentId)
				.then((response) => {
// 					console.log(response);
					return response.json();
				})
				.then((data) => {
 					console.log(data);
					makeList(data, contentId);
				})
				_this.className = 'unfold';
			} else {
				document.querySelector('#type' + contentId + '>ul').remove();
				_this.className = 'fold';
			}
    	}
		    	
		function makeList(data, contentId) {
		// <ul>
		// 	<li class="item category" style="background-image: url(${attraction[firstImage]});">
		// 		<div onclick="">${attraction[title]}</div>
		// 	</li>
		// </ul>
			console.dir(data);
	       	let divEle = document.querySelector('#type' + contentId);
	   		let ulEle = document.createElement('ul');
	   		ulEle.setAttribute("class", "showList");
	   		
	   		for(let i = 0; i < data.length; i++) {
	            let imageUrl = data[i].firstImage;
	            if (imageUrl.trim() == "") imageUrl = "${root}/assets/img/noimage.png";
	   			
	            let liEle = document.createElement("li");
	            liEle.setAttribute("class", "item category");
	            liEle.setAttribute("style", "background-image: url(" + imageUrl + ");");
	            let childEle = document.createElement("div");
	            childEle.innerText = data[i].title;
	            childEle.setAttribute("onclick", "movePage(" + data[i].contentId + ")");
	            liEle.appendChild(childEle);
	            ulEle.appendChild(liEle);
	   		}
	   		divEle.appendChild(ulEle);
	   	}
		
		function movePage(contentId) {
			location.href = "${root}/attraction/detailForm?contentId=" + contentId+"&mode=sido";
		}
	</script>
  </body>
</html>
    
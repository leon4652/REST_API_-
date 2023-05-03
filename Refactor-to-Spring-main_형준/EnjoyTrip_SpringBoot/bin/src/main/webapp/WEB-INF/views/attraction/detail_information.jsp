<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>detail_information</title>
<link rel="stylesheet"
	href="${root}/resources/css/detail_information.css" />
<script src="${root}/resources/js/key.js"></script>

</head>

<body>
	<!-- 전체 컨테이너  -->
	<div id="header"><%@ include file="/WEB-INF/views/include/nav.jsp"%></div>
	<div id="area_info">
		<!-- 맨왼쪽 정보들이 전체 있는 박스-->
		<div id="infoAllbox">
			<div class="search">
				<form class="formbox" method="post"
					action="${root}/attraction/search">
					<div class="formInput">
						<input type="text" name="keyword" id="serachInput" />
					</div>
					<button type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
			</div>
			<div class="allboxInfo">
				<h2>${allboxInfo}</h2>
			</div>
			<div class="fordetail">
				<c:forEach var="list" items="${attList}">
					<div class="infobox">
						<!-- 카테고리 제목 -->
						<div class="info"
							onclick="detailGetData('${root}/attraction/attracionDetail?idCode=${list.contentId}')">
							<div>
								<div id="info_name">
									<h2 id="${list.contentId}" class="titles">
										<c:out value="${list.title}"></c:out>
									</h2>
								</div>
								<div id="info_img">
									<img src="${list.firstImage}" />
								</div>
								<div id="info_text">${list.addr1}</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 디테일  -->
		<div id="detailbox">
			<div id="detailName">${attList[0].title}</div>
			<hr>
			<div id="detailImg"
				style="background-image:url('${attList[0].firstImage}')"></div>
			<div id="detailaddr">
				위치<br />
				<hr>${attList[0].addr1}
				<br />
			</div>
			<div id="overview">
				설명<br />
				<hr>${attList[0].overview}
			</div>

		</div>

		<div id="map" class="area_map" style="height: calc(100vh - 75px);">
			<!-- 버튼  -->
			<div id="dtailbtn">&gt;</div>
		</div>
	</div>

	<script> 
 	
		let dtailbtn = document.getElementById("dtailbtn");
		let detailbox = document.getElementById("detailbox");
		dtailbtn.addEventListener("click", function(e){
			if(dtailbtn.innerText == "<" ){
				dtailbtn.innerHTML = "&gt;";
				detailbox.style.display = "none"; 
			}else{
				dtailbtn.innerHTML = "&lt;";
				detailbox.style.display = "block"; 
			}
		})
		
		//디테일 값 변경
		function detailGetData(url){
			fetch(url)
			.then((response)=> response.json())
			.then((data)=>{
				console.log(data);
				//디테일 페이지 변경
				detPageChange(data);
				//map 위치 변경
				mapSetCenter(data);
			})
		}
		
		function detPageChange(data){
			let name = document.getElementById("detailName");
			let	imgUrl = document.getElementById("detailImg");
			let addr = document.getElementById("detailaddr");
			let overview = document.getElementById("overview");
			
			name.innerText = data.title;
			imgUrl.style.backgroundImage = `url('\${data.firstImage}')`
			addr.innerHTML = "위치<br/><hr>"+data.addr1;
			overview.innerHTML = "설명<br/><hr>"+data.overview;
		}
		
		function mapSetCenter(data){
			//좌표값 세팅
			var moveLatLon = new kakao.maps.LatLng(data.latitude, data.longitude); 
			// 지도 중심을 이동 시킵니다
			map.setCenter(moveLatLon);
		}
	
	</script>

	<script id="kakaoMap" type="text/javascript" src="카카오 키">
   
    </script>
	<script type="text/javascript">
   
	   var container = document.getElementById("map"); // 지도를 담을 영역의 DOM 레퍼런스
	   var options = {
	   	center : new kakao.maps.LatLng("${attList[0].latitude}",
	   			"${attList[0].longitude}"),
	   	level : 3, // 지도의 레벨(확대, 축소 정도)
	   };
	   var map = new kakao.maps.Map(container, options);
	   
	   var positions = [
	   	<c:forEach var = "mapP" items ="${attList}" >
	   	{
	   		
	   		title: "${mapP.title}",
	   		latlng: new kakao.maps.LatLng("${mapP.latitude}", "${mapP.longitude}"),
	   		content: '<div style="text-align:center;">${mapP.title}</div>',
	   		contentId: "${mapP.contentId}"
	   	},
	   </c:forEach>
	   	];
	   
	   console.log(positions);
	   
	// 마커 이미지의 이미지 주소입니다
	   var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	   
	   for (var i = 0; i < positions.length; i ++) {
	       console.log(positions[i])
	       // 마커 이미지의 이미지 크기 입니다
	       var imageSize = new kakao.maps.Size(24, 35); 
	       
	       // 마커 이미지를 생성합니다    
	       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	       console.log(positions[i].latlng);
	       // 마커를 생성합니다
	       var marker = new kakao.maps.Marker({
	           map: map, // 마커를 표시할 지도
	           position: positions[i].latlng, // 마커를 표시할 위치
	           title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	           image : markerImage, // 마커 이미지
	           //클릭이벤트를 위한 임의 키값 생성
	       });
	       
	       //각 마커의 id값을 contentId로 설정
			
	       var content = `<div class="wrap"> 
                <div class="info">
                    <div class="title">
                        \${positions[i].title}
                    </div> 
                </div>    
            </div>`;
            
           
            var infowindow = new kakao.maps.CustomOverlay({
                content: content,
                position: marker.getPosition() 
            });
	 

	    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
	       // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	       (function(marker, infowindow) {
	    	   
	    	   kakao.maps.event.addListener(marker, 'click', function() {
		    	   let markertitle = marker.getTitle();
		    	   console.log(markertitle);
		    	   let titles = document.querySelectorAll(".titles");
		    	   
		    	   for(let data of titles){
		    		  let text = data.innerText;
		    		  if(text == markertitle){
		    			 //이동하고
		    			  const element = document.getElementById(`\${data.id}`);
						  element.scrollIntoView();
						  detailGetData(`${root}/attraction/attracionDetail?idCode=\${data.id}`);
		    			 break;
		    		  }
		    	   }
		   	  });
	    	   
	           // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
	           kakao.maps.event.addListener(marker, 'mouseover', function() {
	        	   infowindow.setMap(map);
	           });

	           // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
	           kakao.maps.event.addListener(marker, 'mouseout', function() {
	        	   infowindow.setMap(null);
	           });
	       })(marker, infowindow);
	   }
	   
   </script>
	<script src="https://kit.fontawesome.com/d244985e0e.js"
		crossorigin="anonymous"></script>
</body>
</html>

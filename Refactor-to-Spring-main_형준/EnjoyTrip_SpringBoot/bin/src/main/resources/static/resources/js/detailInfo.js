var positions = [];

var container = document.getElementById("map"); // 지도를 담을 영역의 DOM 레퍼런스
var options = {
	// 지도를 생성할 때 필요한 기본 옵션
	// center: new kakao.maps.LatLng(Number(item[0].mapy),
	// Number(item[0,].mapx)), //지도의 중심좌표.
	center : new kakao.maps.LatLng("${attList[0].latitude}",
			"${attList[0].longitude}"),
	level : 3, // 지도의 레벨(확대, 축소 정도)
};

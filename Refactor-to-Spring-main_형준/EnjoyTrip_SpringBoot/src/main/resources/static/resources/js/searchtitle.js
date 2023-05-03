function searchbtn() {
  //input의 입력값 가져오기
  let searchtext = document.getElementById("serachInput").value;

  //seartext의 양끝 공간제거
  searchtext = searchtext.trim();

  console.log(searchtext);
  if (searchtext == "") {
    alert("검색하려는 값을 입력해주세요");
  } else {
    //서비스 주소
    const serviceKey =
      "공공데이터 서비스 키";
    //서버 연결 키워드 검색
    let searchurl =
      "https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=" +
      serviceKey +
      "&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&keyword=" +
      searchtext;

    fetch(searchurl)
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        //입력한 값이 조회하지 않는다면!
        if (data.response.body.items == "") {
          alert("입력하신 결과 값이 없습니다");
        } else {
          //결과가 있다면 값을 넘겨주기 위함
          movePage(searchtext, 1);
        }
      })
      .catch(() => {
        alert("결과 조회 오류");
      });
  }

  //mode는 검색해서 들어왔다는것을 알리기 위함 serchtext는 keyword로 검색해야할 값을알려주기위함
  function movePage(title, mode) {
    location.href = `detail_information.html?mode=${mode}?serch=${searchtext}`;
  }
}

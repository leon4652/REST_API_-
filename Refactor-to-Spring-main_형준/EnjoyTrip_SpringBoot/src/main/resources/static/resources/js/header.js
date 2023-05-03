//윈도우가 다 로딩되고 실행해! <- 없으면 오류 생김 (html이 다 로딩되기전에 js를 실행시키기 떄문)
window.onload = function () {
  //mysub에 html을 inner하기위해
  let logincheck = document.getElementById("mysub");
  //세션에서 userID의 키의 값을 받아옴
  let userid = sessionStorage.getItem("userID");
  //세션에서 닉네임 받아옴 (추후 사용예정)
  let username = sessionStorage.getItem("userName");
  //주소가 마에페이지인지 아닌지 확인하기위해
  let hrefs = document.location.href.split("/")[3];

  //userid가 없다면 로그인 버튼을 출력
  if (userid == null) {
    logincheck.innerHTML = `
    <a href="./login.html" id="login">로그인</a>
  `;
  } else if (hrefs == "update.html") {
    //만약 마이페이지 라면 로그인 과 로그아웃 마이페이지 버튼을 출력하지 않기위해
    logincheck.innerHTML = "";
  } else {
    //로그인이 되어있다면!
    logincheck.innerHTML = `
  <a href="" style="margin-right: 15px" onclick="logout()">로그아웃</a>
  <a href="./update.html">마이페이지</a>
 `;
  }
};

//로그아웃 버튼을 클릭시 세션에서 user정보를 삭제
function logout(hrefs) {
  sessionStorage.removeItem("userID");
  sessionStorage.removeItem("userName");
}

# EnjoyTrip_Framework_대전_6반_정민_신창학

EnjoyTrip RestAPI 프로젝트

### Class Diagram

### ER Diagram

## 구현

### 로그인, 계정 관리
|URL|메소드|요청값|역할|
|---|---|---|---|
|`/api/user/login`|POST|`{id : ssafy, password : 1234}`|로그인|
|`/api/user/logout`|GET|`{}`|로그아웃|
|`/api/user/checkDuplicateId`|GET|`{id: ssafy}`|아이디 중복확인|
|`/api/myInfo/{userNo}`|GET|`{}`|내 정보 조회|
|`/api/myInfo/{userNo}`|PUT|`{”id” : "ssafy1234", “password” : "1234"}`|내 정보 변경|

ㄴ

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f1e73ac1-c5ff-4065-b4c7-4f85b7ac43e3/Untitled.png)
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cef55508-a6da-45ce-b150-8bd78cebf06a/Untitled.png)

ㄷ
![Untitled](https://user-images.githubusercontent.com/93763809/235611577-39bc3ef9-2ce8-431f-91b5-7d893d91e3fc.png)

### 루트 게시물

|URL|메소드|요청값|역할|
|---|---|---|---|
|`/api/route`|GET|`{}`|
|`/api/route`|POST|`{"memberNo" : 1, "title" : "테스트3"}`|
|`/api/route/view/{routeNo}`|GET|`{}`|루트 게시물 조회|
|`/api/route/{routeNo}`|PUT|`{"title" : "테스트5","orders" : [{"attractionId" : 100, "orderNum" : 1},{"attractionId" : 200, "orderNum" : 2},{"attractionId" : 300,"orderNum" : 3}]}` |루트 게시글 변경|
|`/api/route/{routeNo}`|DELETE|`{}`|루트 게시물 삭제|
|`/api/route/scrap/{routeNo}`|POST||루트 게시물 스크랩|
### 지역, 행사 조회
|URL|메소드|요청값|역할|
|---|---|---|---|
`/api/attraction/localList`|GET|`{}`|지역 리스트 조회|
`/api/attraction/list?sido={sido}&pageNo={pageNo}`|GET|`{}`|행사 리스트 조회(지역 기반)|
`/api/attraction/view/{attractionId}`|GET|`{}`|행사 상세 조회|

### 즐겨찾기 추가 및 조회
|URL|메소드|요청값|역할|
|---|---|---|---|
`/api/attraction/favorite`|POST|`{"attractionId" : 125266, "flag" : 1}`|즐겨찾기 추가|
`/api/attraction/favorite`|GET|{}|즐겨찾기한 행사 리스트 조회|

### 게시판 조회 및 작성, 삭제, 수정
|URL|메소드|요청값|역할|
|---|---|---|---|
`/api/board/list`|GET|`{}`|전체 게시글 조회
`/api/board/info/{boardNo}`|GET|`{}`|특정 게시글(no) 조회
`/api/board/write`|POST|`{"title": "제목", "contents": "내용"}`|게시글 작성
`/api/board/delete/{boardNo}`|GET|`{}`|게시글 삭제 시간 등록(UPDATE)
`/api/board/update/{boardNo}`|POST|`{"title": "제목 수정", "contents": "내용 수정"}`|게시글 수정, 수정 시간 등록
`/api/board/getattraction/{userNo}`|GET|`{}`|유저 no에 맞는 share_att 조회

### 공유 장소 작성
|URL|메소드|요청값|역할|
|---|---|---|---|
`/api/shareattraction/list`|GET|`{}`|share_att 조회
`/api/shareattraction/write`|POST|`{"attractionId" : "id" “shareNo : 1}`|attraction_id 작성
`/api/shareattraction/delete/{shareNo}`|GET|`{}`|삭제 시간 등록(UPDATE), no = PK

### 관리자 게시판 조회 및 작성, 삭제 수정
|URL|메소드|요청값|역할|
|---|---|---|---|
`/api/notice/list`|GET|`{}`|
`/api/notice/write`|POST|
`/api/notice/delete/{noticeNo}`|GET|`{}`|
`/api/notice/update/{noticeNo}`|PUT|
`/api/notice/info/{noticeNo}`|GET|`{}`|

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

1. `user/login`
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f1e73ac1-c5ff-4065-b4c7-4f85b7ac43e3/Untitled.png)

2. `user/logout`
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cef55508-a6da-45ce-b150-8bd78cebf06a/Untitled.png)

3. `user/checkDuplicateId`
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a597334a-d1e0-4439-94e9-879fcedf15eb/Untitled.png)

4. `api/myInfo/{userNo}` - GET
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6894354b-080b-4232-8e4c-b5cc7eb09c3e/Untitled.png)

5. `api/myInfo/{userNo}` - PUT
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0fd6aad1-aa97-4413-a953-d03a58cd22e1/Untitled.png)

6. `api/route` - GET
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6660eb34-180c-4118-835c-98bccc2edc10/Untitled.png)

7. `api/route` - POST
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/54adca2a-b9e3-4d9f-914d-2a6d4f6888b3/Untitled.png)

8. `api/route/view/{userNo}` - GET
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3fc68112-144f-4e74-ba35-40371f71cfa8/Untitled.png)


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
`/api/notice/write`|POST|`{"title": “제목 작성", "contents": "제목 수정"}`|
`/api/notice/delete/{noticeNo}`|GET|`{}`|
`/api/notice/update/{noticeNo}`|PUT|`{"title": “제목 수정", "contents": "내용 수정"}`|
`/api/notice/info/{noticeNo}`|GET|`{}`|

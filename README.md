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

#### 1. `/user/login`
![image](https://user-images.githubusercontent.com/93763809/235709535-57b7d183-668b-4b16-800b-6d489aa18175.png)

#### 2. `/user/logout`
![image](https://user-images.githubusercontent.com/93763809/235709603-a542cc37-8fd9-4122-a05e-0a457d5c6591.png)

#### 3. `/user/checkDuplicateId`
![image](https://user-images.githubusercontent.com/93763809/235709637-cee19e73-edfd-4c34-873f-ef42ad4a73b4.png)

#### 4. `/api/myInfo/{userNo}` - GET
![image](https://user-images.githubusercontent.com/93763809/235709793-0a1f3f78-7d9d-4001-862f-e6c69cfbe1df.png)

#### 5. `/api/myInfo/{userNo}` - PUT
![image](https://user-images.githubusercontent.com/93763809/235709751-0f331bab-9a5a-43b7-8327-3e0ef35bacc9.png)



### 루트 게시물

|URL|메소드|요청값|역할|
|---|---|---|---|
|`/api/route`|GET|`{}`|
|`/api/route`|POST|`{"memberNo" : 1, "title" : "테스트3"}`|
|`/api/route/view/{routeNo}`|GET|`{}`|루트 게시물 조회|
|`/api/route/{routeNo}`|PUT|`{"title" : "테스트5","orders" : [{"attractionId" : 100, "orderNum" : 1},{"attractionId" : 200, "orderNum" : 2},{"attractionId" : 300,"orderNum" : 3}]}` |루트 게시글 변경|
|`/api/route/{routeNo}`|DELETE|`{}`|루트 게시물 삭제|
|`/api/route/scrap/{routeNo}`|POST||루트 게시물 스크랩|

#### 6. `/api/route` - GET
![image](https://user-images.githubusercontent.com/93763809/235710715-c4ee55a4-5f16-4136-a74b-5ed06d4508ac.png)

#### 7. `/api/route` - POST
![image](https://user-images.githubusercontent.com/93763809/235710743-f1fa1490-5a39-4513-b9c9-25c5cd5d856d.png)

#### 8. `/api/route/view/{userNo}` - GET
![image](https://user-images.githubusercontent.com/93763809/235710773-b6f5d15a-6448-4f45-8e69-44a7c1e6dae0.png)

#### 9. `/api/route/{routeNo}` - PUT
![image](https://user-images.githubusercontent.com/93763809/235710799-3eb5da2f-f419-4d0b-bffa-98457ba77bd5.png)

#### 10. `/api/route/{userNo}` - DELETE
![image](https://user-images.githubusercontent.com/93763809/235710824-54a11aac-9cf4-424b-a186-9b33317c3a78.png)

#### 11. `/api/route/scrap/{routeNo}`
![image](https://user-images.githubusercontent.com/93763809/235710874-be3652dc-1c20-40e6-a67b-8bbb7bbdc2a8.png)

### 지역, 행사 조회
|URL|메소드|요청값|역할|
|---|---|---|---|
`/api/attraction/localList`|GET|`{}`|지역 리스트 조회|
`/api/attraction/list?sido={sido}&pageNo={pageNo}`|GET|`{}`|행사 리스트 조회(지역 기반)|
`/api/attraction/view/{attractionId}`|GET|`{}`|행사 상세 조회|

#### 12. `/api/attraction/localList` - GET
![image](https://user-images.githubusercontent.com/93763809/235711032-7137f39b-ffc1-408e-b47f-0c53a0519b77.png)

#### 13. `/api/attraction/list?sido={sido}&pageNo={pageNo}` - GET
![image](https://user-images.githubusercontent.com/93763809/235711129-8e134d9a-b544-4089-b442-39153a1994eb.png)

#### 14. `/api/attraction/view/{attractionId}`
![image](https://user-images.githubusercontent.com/93763809/235711212-ff0355ba-5bff-4748-af99-2dc832ce5761.png)


### 즐겨찾기 추가 및 조회
|URL|메소드|요청값|역할|
|---|---|---|---|
`/api/attraction/favorite`|POST|`{"attractionId" : 125266, "flag" : 1}`|즐겨찾기 추가|
`/api/attraction/favorite`|GET|{}|즐겨찾기한 행사 리스트 조회|

#### 15. `/api/attraction/favorite` - POST
![image](https://user-images.githubusercontent.com/93763809/235711266-6594f52c-2462-4765-b1b6-dd40fa15bee2.png)

#### 16. `/api/attraction/favorite` - GET
![image](https://user-images.githubusercontent.com/93763809/235711374-3f63090b-75fe-4617-8571-19fe12c22e9c.png)

### 게시판 조회 및 작성, 삭제, 수정
|URL|메소드|요청값|역할|
|---|---|---|---|
`/api/board/list`|GET|`{}`|전체 게시글 조회
`/api/board/info/{boardNo}`|GET|`{}`|특정 게시글(no) 조회
`/api/board/write`|POST|`{"title": "제목", "contents": "내용"}`|게시글 작성
`/api/board/delete/{boardNo}`|GET|`{}`|게시글 삭제 시간 등록(UPDATE)
`/api/board/update/{boardNo}`|PUT|`{"title": "제목 수정", "contents": "내용 수정"}`|게시글 수정, 수정 시간 등록
`/api/board/getattraction/{userNo}`|GET|`{}`|유저 no에 맞는 share_att 조회

#### 17. `/api/board/list` - GET
![image](https://user-images.githubusercontent.com/93763809/235716440-17a636c4-ebb4-425b-8ed8-f8ba0626595f.png)

#### 18. `/api/board/info/{boardNo}` - GET
![image](https://user-images.githubusercontent.com/93763809/235716512-72dfd647-4068-4203-ac83-c3116dcd4ed3.png)

#### 19. `/api/board/write` - POST
![image](https://user-images.githubusercontent.com/93763809/235715890-a2490e2e-086d-4a88-87cd-60cc6ddf7f8b.png)

#### 20. `/api/board/delete/{boardNo}`- GET
![image](https://user-images.githubusercontent.com/93763809/235716684-e3b27571-964e-4a1b-aa27-a75a5a16434d.png)

#### 21. `/api/board/update/{boardNo}` - PUT
![image](https://user-images.githubusercontent.com/93763809/235716924-42ec2dee-ffb3-4299-b9d0-531a056eb9a2.png)

#### 22. `/api/board/getattraction/{userNo}`- GET
![image](https://user-images.githubusercontent.com/93763809/235717123-e9dac017-05ef-45cd-9177-82f469ecab6d.png)


### 공유 장소 작성
|URL|메소드|요청값|역할|
|---|---|---|---|
`/api/shareattraction/list`|GET|`{}`|share_att 조회
`/api/shareattraction/write`|POST|`{"attractionId" : "id" “shareNo : 1}`|attraction_id 작성
`/api/shareattraction/delete/{shareNo}`|GET|`{}`|삭제 시간 등록(UPDATE), no = PK

#### 23. `/api/shareattraction/list` - GET
![image](https://user-images.githubusercontent.com/93763809/235717915-ec0f1e94-b2b0-452f-a2e0-24a573b94699.png)

#### 24. `/api/shareattraction/write` - POST
![image](https://user-images.githubusercontent.com/93763809/235717400-6ed3a4bc-f793-4766-80b7-fce36e270e9f.png)

#### 25. `/api/shareattraction/delete/{shareNo}` - GET
![image](https://user-images.githubusercontent.com/93763809/235717992-40d506ee-c7c5-4665-9c8c-195dcb903280.png)


### 관리자 게시판 조회 및 작성, 삭제 수정
|URL|메소드|요청값|역할|
|---|---|---|---|
`/api/notice/list`|GET|`{}`|
`/api/notice/write`|POST|`{"title": "제목", "contents": "내용", "userNo" : 1}`|
`/api/notice/delete/{noticeNo}`|GET|`{}`|
`/api/notice/update/{noticeNo}`|PUT|`{"title": “제목 수정", "contents": "내용 수정"}`|
`/api/notice/info/{noticeNo}`|GET|`{}`|

#### 23. `/api/notice/list` - GET
![image](https://user-images.githubusercontent.com/93763809/235718599-1e7c363a-8ce3-4fa0-9263-da922e5e86dd.png)

#### 24. `/api/notice/write` - POST
![image](https://user-images.githubusercontent.com/93763809/235718506-8f270096-0034-44f1-a767-1914f005eef5.png)

#### 25. `/api/notice/delete/{noticeNo}` - GET
![image](https://user-images.githubusercontent.com/93763809/235718662-57a456cb-2974-4a5b-8d06-40b1c10eb1e0.png)

#### 26. `/api/notice/update/{noticeNo}` - PUT
![image](https://user-images.githubusercontent.com/93763809/235718771-03d8cf9b-e4d3-4dfc-86ec-de8fc41d0960.png)

#### 27. `/api/notice/info/{noticeNo}` - GET
![image](https://user-images.githubusercontent.com/93763809/235719425-ca537697-15f9-4000-98f4-2b675d5fa95e.png)



/*
 * 로그인 / 로그아웃 js 구현 
 */
let login = {
	loginSubmitBtn : null
	,idInput : null
	,pwInput : null
	
	,init : function(){
		this.loginSubmitBtn = document.getElementById('loginSubmitBtn');
		this.idInput = document.querySelector('#loginPopup #userId');
		this.pwInput = document.querySelector('#loginPopup #userPassword');
		
		this.registEvent();
	}
	
	,registEvent : function(){
		let _this = this;
		
		_this.loginSubmitBtn.addEventListener('click', () => {
			_this.loginSubmit();
		});
		
	}
	
	,openLoginPopup : function(){
		let _this = this;
		PopupManager.add('#loginPopup');
		
		//값 초기화
		_this.idInput.value = '';
		_this.pwInput.value = '';
	}
	
	,loginSubmit : function() {
		let _this = this;
		if(_this.idInput.value == ''){
			alert('아이디를 입력해주세요');
			return;
		}
		
		if(_this.pwInput.value == ''){
			alert('비밀번호를 입력해주세요');
			return;
		}
		
		let param = JSON.stringify({id : _this.idInput.value, password : _this.pwInput.value});
		
		//vanillaAjax("POST", getUrl() + "user/login", param, login.loginAction);

		let config = {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: param,
        };
        fetch(getUrl() + "user/login", config)
          	.then((response) => {
          		console.dir(response);  
          		return response.json()
          	})
          	.then((user) => {
//          		console.dir(user);
          		login.loginAction(user)
          	}); 
	}

	,loginAction : function(user){
		if(user){
			window.location.reload();
		} else {
			alert('로그인에 실패했습니다. 확인 후 다시 시도해주세요');
		}
	}
}

windowOnload(function(){
	login.init();
})

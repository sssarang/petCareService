var authKey = "";		//사용자가 입력한 인증번호(값이 일치하는지 비교해야함)

$(function() {
	
	$('#emailBtn').on('click', emailAjax)		//이메일 인증버튼
	$('#keyCheckBtn').on('click', authKeyCheck)	//인증번호 인증확인버튼
	$('#keyBtn').on('click', authAjax)			//인증번호 발급버튼

	//가입되어있는 이메일이 있는지 확인
	function emailAjax(){
		var email = $('#emailId').val();
		
		if(email.trim() == ''){
			//이메일을 입력하지 않은 경우
	        $('#emailLabel').text("* 이메일을 입력하세요.");
	        return;
		} else {
			//이메일 정규식
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if(email.match(regExp) == null){
				//이메일 형식에 맞지 않는 경우
				$('#emailLabel').text("* 이메일 형식에 맞지 않습니다.");
				return;
			}//if
		}//if-else
		
		var sendData = "email="+email;
		$.ajax({
			url:'checkId',
			method: 'GET',
			data: sendData,
			success : function(resp){
				if(resp == 'success'){
					//인증 성공
					$('#emailLabel').text("* 존재하는 아이디입니다.");
					emailCheck = email;
				} else{
					$('#emailLabel').text("* 존재하지 않는 아이디입니다.");
				}//if-else
			}
		})//.ajax
	}//end emailAjax
	
	function authAjax() {
		var email = $("#emailId").val();
		
	    if(email.trim() == ''){
			//이메일을 입력하지 않은 경우
	        $('#keyLabel').text("* 이메일을 입력하세요");
	        return;
		}//if
	  
	    //서버로 보낼 데이터 준비 : 파라미터로 만들기
	    var sendData = "email="+email;
	    $.ajax({
	        url:'authDo'
	        , method : 'POST'
	        , data: sendData
	        , success :function(resp){
				$('#keyLabel').text("* 인증번호가 발급되었습니다.");
				authKey = resp;
			}
	    })//.ajax	
	}//authAjax
	
	function authKeyCheck() {
		var inputKey = $('#keyInput').val();
		
		if(inputKey.trim() == ''){
			$('#keyLabel').text("* 인증번호를 입력하세요");
			return;
		} else {
			if(inputKey == authKey){
				$('#keyLabel').text("* 인증 성공");
				return;
			} else{
				$('#keyLabel').text("* 인증 실패");
				return;
			}//if-else
		}//if-else
	}//authKeyCheck
	
});//jq    
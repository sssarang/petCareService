
$(function() {
	
	$('#keyBtn').on('click', authAjax);		//인증번호 발급버튼 클릭
	$('#emailBtn').on('click', emailAjax);	//이메일 체크
	$('#nickNameBtn').on('click', nickNameAjax)
    
	var inputAuthKey;	//사용자가 입력한 인증번호(값이 일치하는지 비교해야함)
	
	//연습
    function reqAjax1() {
        $.ajax({
        url:'authDo',
        method : 'GET',
        success :  function(resp){
            if(resp =='cool'){
                console.log("success")
                }
            }
        })	
    }
	
	//이메일 중복검사
	function emailAjax(){
		var email = $('#emailId').val();
		
		if(email.trim() == ''){
			//이메일을 입력하지 않은 경우
			//이메일 유효성 검사 추가해야함
	        alert('데이터를 입력해주세요')
	        return;
		}//if
		
		var sendData = "email="+email;
		$.ajax({
			url:'emailCheck',
			method: 'GET',
			data: sendData,
			success : function(resp){
				if(resp == 'success'){
					//인증 성공
					$('#emailLabel').text("* 사용 가능한 아이디입니다.");
				} else{
					$('#emailLabel').text("* 이미 사용중인 아이디 입니다.");
				}//if-else
			}
		})//.ajax
	}//end emailAjax
	
	//닉네임 중복검사
	function nickNameAjax(){
		var nickName = $('#nickName').val();
		
		if(nickName.trim() == ''){
			//닉네임을 입력하지 않은 경우
			alert('닉네임을 입력하세요')
			return;
		}//if
		
		var sendData = "nickName="+nickName;
		$.ajax({
			url: 'nickNameCheck',
			method: 'GET',
			data: sendData,
			success :function(resp){
				if(resp == 'success'){
					//인증성공
					$('#nickNameLabel').text("* 사용 가능한 닉네임 입니다.");
				} else{
					$('#nickNameLabel').text("* 이미 사용중인 닉네임 입니다.");
				}//if-else
			}
		})//.ajax
	}//nickNameAjax
	
	
	//인증번호 발급
	function authAjax() {
	    var email = $("#emailId").val();
	    if(email.trim() == ''){
			//이메일을 입력하지 않은 경우
	        alert('데이터를 입력해주세요')
	        return;
		}//if
	  
	    //서버로 보낼 데이터 준비 : 파라미터로 만들기 . json 으로 만들기
	    var sendData = "email="+email;
	    $.ajax({
	        url:'authDo'
	        , method : 'POST'
	        , data: sendData
	        , success :function(resp){
				//성공한 경우	
			}
	    })//.ajax	
	}//end authAjax
	
});//end js


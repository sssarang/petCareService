
var authKey = "";	//사용자가 입력한 인증번호(값이 일치하는지 비교해야함)

$(function() {
	
	$('#keyBtn').on('click', authAjax)			//인증번호 발급버튼 클릭
	$('#emailBtn').on('click', emailAjax)		//이메일 중복체크
	$('#nickNameBtn').on('click', nickNameAjax)	//닉네임 중복체크
	$('#keyCheckBtn').on('click', authKeyCheck)	//인증번호 체크
	
	//이메일 중복검사
	function emailAjax(){
		var email = $('#emailId').val();
		
		if(email.trim() == ''){
			//이메일을 입력하지 않은 경우
	        $('#emailLabel').text("* 아이디를 입력하세요.");
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
			url:'emailCheck',
			method: 'GET',
			data: sendData,
			success : function(resp){
				if(resp == 'success'){
					//인증 성공
					$('#emailLabel').text("* 사용 가능한 아이디입니다.");
				} else{
					$('#emailLabel').text("* 이미 사용중인 아이디 입니다.");
				}//if-else\
			}
		})//.ajax
	}//end emailAjax
	
	//닉네임 중복검사
	function nickNameAjax(){
		var nickName = $('#nickName').val();
		
		if(nickName.trim() == ''){
			//닉네임을 입력하지 않은 경우
			$('#nickNameLabel').text("* 닉네임을 입력하세요");
			return;
		} else {
			 if(nickName.length < 1 || nickName.length > 8){
				$('#nickNameLabel').text("* 닉네임은 1~8자 이내로 가능합니다.");
				return;
			}//if
		}//if-else
		
		var sendData = "nickName="+nickName;
		$.ajax({
			url: 'nickNameCheck',
			method: 'GET',
			data: sendData,
			success :function(resp){
				
				if(resp == 'success'){
					//인증성공
					$('#nickNameLabel').text("* 사용 가능한 닉네임입니다.");
				} else{
					$('#nickNameLabel').text("* 이미 사용중인 닉네임입니다.");
				}//if-else
			}
		})//.ajax
	}//nickNameAjax
	
	
	//인증번호 발급
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
	}//end authAjax
	
	//인증번호 체크
	function authKeyCheck() {
		var inputKey = $('#inputKey').val();
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
	
});//end function

//전체 확인 (submit)버튼시 검사하는 항목들
//비밀번호, 전화번호, 주소, 성별
function beforeSubmit() {
	var joinForm = document.joinForm;
	
	kakaoMap();
	
	//비밀번호 체크
	var pwReg = /^[A-Za-z0-9]{6,12}$/;
	var pw = $('#inputPw').val();
	if(pw.trim() == ''){
		$('#pwLabel').text("* 비밀번호를 입력하세요");
		return;
	} else {
		if(pw.match(pwReg) == null){
			//비밀번호 형식에 맞지 않는 경우
			$('#pwLabel').text("* 숫자와 문자포함 6~12자리 이내");
			return;
		} else {
			$('#pwLabel').text("* 사용할 수 있는 비밀번호 입니다");
		}
	}//if-else
	
	//전화번호 유효성 체크
	var phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;
	var phone = $('#inputPhone').val();
	if(phone.trim() == ''){
		$('#phoneLabel').text("* 전화번호를 입력하세요");
		return;
	} else {
		if(phone.match(phoneReg) == null){
			//전화번호 형식에 맞지 않는 경우
			$('#phoneLabel').text("* 전화번호를 정확히 입력하세요");
			return;
		}//if
	}//if-else
	
	if(checkExistData($('#emailId').val(), "아이디를") == false){
		return false;
	}
	if(checkExistData($('#inputKey').val(), "인증번호를") == false){
		return false;
	}
	if(checkExistData($('#inputPw').val(), "비밀번호를") == false){
		return false;
	}
	if(checkExistData($('#nickName').val(), "닉네임을") == false){
		return false;
	}
	if(checkExistData($('#inputPhone').val(), "전화번호를") == false){
		return false;
	}
	if(checkExistData($('#inputAddress').val(), "주소를") == false){
		return false;
	}
	//최종 확인
	joinForm.submit();
}//beforeSubmit

// 공백확인 함수
function checkExistData(value, dataName) {
    if (value == "") {
        alert(dataName + " 입력해주세요!");
        return false;
    }
    return true;
}

//위치 좌표로 변경
function kakaoMap(){
    var geocoder = new kakao.maps.services.Geocoder();

    geocoder.addressSearch($('#inputAddress').val(), function(result, status) {
       
	    if (status === kakao.maps.services.Status.OK) {
           console.log(result[0].x, result[0].y);    
		   //result[0].x : 경도
		   //result[0].y : 위도
		   var x = result[0].x;
		   var y = result[0].y;
		   console.log(x, y);
					
		   var sendData = "x="+x+'&y='+y;
		   $.ajax({
		        url:'coordinate',
		        type : 'POST',
		        data: sendData,
				success: function(resp){}
	   	   })//.ajax
	    }//if
	});
}

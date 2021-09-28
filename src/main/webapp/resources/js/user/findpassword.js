var emailCheck = "";		//페이지 제출시 최종확인용 변수(이메일)
var authKey = "";			//페이지 제출시 최종확인용 변수(인증번호)
var passwordCheck = "";		//페이지 제출시 최종확인용 변수(비밀번호)
var submitCheck = "";

$(document).ready(function() {
	
	//가입되어있는 이메일이 있는지 확인
	$('#emailBtn').click(function (){
		var email = $('#emailId').val();
		$('#emailLabel').css("color", "red");
		
		if(email.trim() == ''){
			//이메일을 입력하지 않은 경우
	        $('#emailLabel').text(" *이메일을 입력하세요.");
	        return;
		} else {
			//이메일 정규식
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if(email.match(regExp) == null){
				//이메일 형식에 맞지 않는 경우
				$('#emailLabel').text(" *이메일 형식에 맞지 않습니다.");
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
					$('#emailLabel').css("color", "blue");
					$('#emailLabel').text(" *존재하는 이메일입니다.");
					emailCheck = email;
				} else{
					$('#emailLabel').text(" *존재하지 않는 이메일입니다.");
				}//if-else
			}
		})//.ajax
	});//end function
	
	//인증번호 발급
	$('#keyBtn').click(function (){
	    var email = $("#emailId").val();
		$('#keyLabel').css("color", "red");
    	swal({
			title : '',
			text : '인증번호가 이메일로 전송되었습니다.',
			icon : 'info',
		});
		
		if(email.trim() == ''){
			//이메일을 입력하지 않은 경우
	        $('#keyLabel').text(" *이메일을 입력하세요");
			swal({
				title : '',
				text : '이메일을 입력하세요',
				icon : 'warning',
			});
	        return;
		}//if
	  
	    //서버로 보낼 데이터 준비 : 파라미터로 만들기
	    var sendData = "email="+email;
	    $.ajax({
	        url:'authDo',
	        method : 'POST',
	        data: sendData,
	        success :function(resp){
				$('#keyLabel').text(" *인증번호가 발급되었습니다.");
				authKey = resp;
				//console.log(resp);
			}
	    })//.ajax	
	});//end function
	
	//인증번호 체크
	$('#inputKey').on("propertychange change keyup paste input", function (){
		var inputKey = $('#inputKey').val();
		$('#keyLabel').css("color", "red");
		$('#keyLabel').text(" *인증번호를 입력하세요");
		
		if(inputKey.trim() == ''){
			$('#keyLabel').text(" *인증번호를 입력하세요");
			return;
		} else {
			if(inputKey == authKey){
				$('#keyLabel').css("color", "blue");
				$('#keyLabel').text(" *인증번호가 일치합니다.");
				return;
			} else{
				$('#keyLabel').text(" *인증번호가 일치하지 않습니다.");
				return;
			}//if-else
		}//if-else
	});//end function
	
	//비밀번호 체크
	$('#inputPw').on("propertychange change keyup paste input", function (){
		var pwReg = /^[A-Za-z0-9]{6,12}$/;
		var pw = $('#inputPw').val();
		
		$('#pwLabel').css("color", "red");
		
		if(pw.trim() == ''){
			$('#pwLabel').text(" *비밀번호를 입력하세요");
			return;
		} else {
			if(pw.match(pwReg) == null){
				//비밀번호 형식에 맞지 않는 경우
				$('#pwLabel').text(" *숫자와 문자포함 6~12자리 이내");
				return;
			} else {
				$('#pwLabel').css("color", "blue");
				$('#pwLabel').text(" *사용할 수 있는 비밀번호 입니다");
				passwordCheck = pw;
			}
		}//if-else
	});//end function
	
	$('#submitBtn').click(function (){
		var findForm = document.findForm;
		var isCheck = false;
		
		if(checkExistData($('#emailId').val(), "이메일을") == false){
			$('#emailLabel').text("");
			$('#emailId').val('');
			return false;
		} else if(emailCheck != $('#emailId').val()) {
			//alert('이메일 중복확인 버튼을 클릭하세요.');
			swal({
				title : '',
				text : '이메일 중복확인 버튼을 클릭하세요.',
				icon : 'warning',
			});
			$('#emailLabel').text("");
			return false;
		}//if
		
		if(checkExistData($('#inputKey').val(), "인증번호를") == false){
			$('#keyLabel').text("");
			$('#inputKey').val('');
			return false;
		} else if(authKey != $('#inputKey').val()) {
			//alert('인증번호가 일치하지 않습니다.')
			swal({
				title : '',
				text : '인증번호가 일치하지 않습니다.',
				icon : 'warning',
			});
			$('#keyLabel').text("");
			return false;
		}//if
		
		if(checkExistData($('#inputPw').val(), "비밀번호를") == false){
			$('#pwLabel').text("");
			$('#inputPw').val('');
			return false;
		} else if(passwordCheck != $('#inputPw').val()) {
			//alert('비밀번호를 다시 설정해주세요.')
			swal({
				title : '',
				text : '비밀번호를 다시 설정해주세요.',
				icon : 'warning',
			});
			$('#pwLabel').text("");
			$('#inputPw').val('');
			return false;
		} else { 
			//alter("비밀번호가 변경되었습니다.");
			//$(this).attr("type","submit");
			
			var data = {
				"userId" : $('#emailId').val(),
				"userPw" : $('#inputPw').val()
			}
			
      		$.ajax({
	            type : 'post',
	            url : 'chagePw',
	            data : data,
/*	            success : function(json){
		            isCheck = true;
				}*/
	        });

			//if(isCheck == ture){
				location.reload();				
			//}
		//return true;
		}//if

	});//beforeSubmit
});//jq    

//최종 제출
/*function check() {
	
	var findForm = document.findForm;
	
	if(checkExistData($('#emailId').val(), "이메일을") == false){
		$('#emailLabel').text("");
		$('#emailId').val('');
		return false;
	} else if(emailCheck != $('#emailId').val()) {
		alert('이메일 중복확인 버튼을 클릭하세요.')
		$('#emailLabel').text("");
		return false;
	}//if
	
	if(checkExistData($('#inputKey').val(), "인증번호를") == false){
		$('#keyLabel').text("");
		$('#inputKey').val('');
		return false;
	} else if(authKey != $('#inputKey').val()) {
		alert('인증번호가 일치하지 않습니다.')
		$('#keyLabel').text("");
		return false;
	}//if
	
	if(checkExistData($('#inputPw').val(), "비밀번호를") == false){
		$('#pwLabel').text("");
		$('#inputPw').val('');
		return false;
	} else if(passwordCheck != $('#inputPw').val()) {
		alert('비밀번호를 다시 설정해주세요.')
		$('#pwLabel').text("");
		$('#inputPw').val('');
		return false;
	} else{
		
		var queryString = $("#findForm").serialize();
 
        $.ajax({
            type : 'post',
            url : 'chagePw',
            data : queryString,
            success : function(json){
				window.close();
            }
        });
		//return true;
	}
}*/

// 공백확인 함수
function checkExistData(value, dataName) {
    if (value == "") {
        //alert(dataName + " 입력해주세요!");
		swal({
			title : '',
			text : dataName + '입력해주세요.',
			icon : 'warning',
		});
        return false;
    }
    return true;
}//end checkExistData
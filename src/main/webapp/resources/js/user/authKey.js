
$(function() {
	
	$('#keyBtn').on('click', reqAjax2);
    
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

	function reqAjax2() {
	    var email = $("#emailId").val();
	    if(email.trim() == ''){
	        alert('데이터를 입력해주세요')
	        return;
		}
	  
	    //서버로 보낼 데이터 준비 : 파라미터로 만들기 . json 으로 만들기
	    var sendData = "email="+email;
	    $.ajax({
	        url:'authDo'
	        , method : 'POST'
	        , data: sendData
	        , success :function(resp){}
	    })	
	}
});


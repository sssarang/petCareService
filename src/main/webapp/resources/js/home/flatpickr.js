$(function () {
	console.debug('flatpickr started...');
	
	$(".selector").flatpickr({ 
		dateFormat: "Y-m-d",
		minDate:"today",
		// 현재로부터 3개월까지 활성화
		maxDate: new Date().fp_incr(90)
	}); 

}); //jq    
                            
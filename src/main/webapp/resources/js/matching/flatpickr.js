// 쿼리스트링의 value를 추출하는 함수
function searchParam(key) {
	// 쿼리스트링을 가져온다.
	sch = location.search;
	
	// key=value 값을 가져온다.
	var params = new URLSearchParams(sch).get(key);
	
	return params;
} //searchParam

var sch_key = searchParam('userNo');

// 시터의 서비스가능 날짜를 뽑아온다.
$(document).ready(function(){
	$.ajax({
		url: "/search/ableDate",
		method: "POST",
		data: {
			// 쿼리스트링의 value값을 매개변수로 전달해준다.
			userNo : sch_key
		},
		success: function(list) {
			
			// 펫시터의 서비스 가능한 날짜를 담을 배열 선언
			var ableDates = [];
			
			for(var i=0; i<list.length; i++) {
				
				// timestamp(ex)1607110465663) 형식을 날짜로 변환
				var date = new Date(list[i].serviceDate);
				
				// '년-월-일'의 형식으로 배열에 저장
				ableDates.push(date.getFullYear()+ "-" + (date.getMonth()+1) + "-" + date.getDate());
			} //for
			
			console.log(ableDates);
			
			//===============================================================================================//
		
			const config = {
			// 시작, 종료 플러그인 사용	
			"plugins": [new rangePlugin({ input: "#secondRangeInput"})],
			
			// 현재 날짜부터 시작
			minDate:"today",
			
			// 현재로부터 3개월까지 활성화
			maxDate: new Date().fp_incr(90),
			
			//해당 시터가 허용한 날짜만 캘린더 활성화 시키기
			enable: [
					 	function checkAbleDates(date) {
							var y = date.getFullYear();
						    var m = date.getMonth(); 
							var d = date.getDate(); 
							
							// ableDates배열의 값을 비교해서 존재하면 활성화시켜준다.
						    for (i = 0; i < ableDates.length; i++) {
						        if($.inArray(y + '-' +(m+1) + '-' +d,ableDates) !== -1) {
									return true;
						        } //if
						    } //for
		
					    	return false;
						} //checkAbleDates
				]
					
	 		}; //config
		
			flatpickr('.flatpickr', config);
			
		} //success
	}); //ajax
}); //ready






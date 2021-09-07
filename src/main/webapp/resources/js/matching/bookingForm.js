// 1.검색필터 필수조건(서비스, 날짜)
function check(){
	// 값의 여부를 확인하기 위한 변수
	var serviceType = document.booking.serviceType.value;
	var startDate = document.booking.startDate.value;
	var endDate = document.booking.endDate.value;
	
	
	if(serviceType == "서비스 선택"){
		alert("서비스를 선택해주세요.")
		document.booking.serviceType.focus();
		
		return false; 
	} else if(startDate == "" || startDate == null){
		alert("시작날짜를 선택해주세요.")
		document.booking.startDate.focus();
		
		return false;
	} else if(endDate == "" || endDate == null){
		alert("종료날짜를 선택해주세요.")
		document.booking.endDate.focus();
		
		return false;
	} else {
		alert("예약이 완료되었습니다. \n예약 내역으로 이동합니다.")
		
		return true;
	} //if-else
	
}; //check


// 2. 해당 시터가 허용한 서비스 목록 출력하기
$(function() {
	console.debug("Get ServiceType..");
	
	// 쿼리스트링의 value를 추출하는 함수
	function searchParam(key) {
		// 쿼리스트링을 가져온다.
		sch = location.search;
		console.log(sch);
		
		// key=value 값을 가져온다.
		var params = new URLSearchParams(sch).get(key);
		
		return params;
	} //searchParam
	
	var sch_key = searchParam('userNo');
	console.log(sch_key);
	
	$(document).ready(function(){
		$.ajax({
			url: "/search/serviceType",
			method: "POST",
			data: {
				// 쿼리스트링의 value값을 매개변수로 전달해준다.
				userNo : sch_key
			},
			success: function(list) {
				console.log(list);
				
				for(var i=0; i<list.length; i++){
                    var code = list[i].serviceTypeCode;
					var codeName = list[i].codeName;
                    var price = list[i].price;

					console.log(code);	
					console.log(codeName);	
					console.log(price);	
					
					// 동적으로 option 목록 생성
					$('#serviceType').append('<option value='+code+'>'+codeName+' ('+price+'원)</option>');
					
				}; //for 
			} //success
		}); //ajax
	}); //ready
}); //jq



var isUserNo = false;

$(function() {
	
	// 쿼리스트링의 value를 추출하는 함수 ===============================================
	function searchParam(key) {
		// 쿼리스트링을 가져온다.
		sch = location.search;
		//console.log(sch);
		
		// key=value 값을 가져온다.
		var params = new URLSearchParams(sch).get(key);
		
		return params;
	} //searchParam
	
	var sch_key = searchParam('userNo');
	//console.log(sch_key);
	//=========================================================================
	
	$(document).ready(function(){
		
		// 1. 해당 펫시터가 허용한 서비스 목록 출력하기
		$.ajax({
			url: "/search/serviceType",
			method: "POST",
			data: {
				// 쿼리스트링의 value값을 매개변수로 전달해준다.
				userNo : sch_key
			},
			success: function(list) {
				//console.log(list);
				
				for(var i=0; i<list.length; i++){
                    var code = list[i].serviceTypeCode;
					var codeName = list[i].codeName;
                    var price = String(list[i].price).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					

					//console.log(code);	
					//console.log(codeName);	
					//console.log(price);	
					
					// 동적으로 option 목록 생성
					$('#serviceType').append('<option value='+code+'>'+codeName+' ('+price+'원)</option>');
					
				}; //for 
			} //success
		}); //ajax
		
		
		// 2. 펫시터의 서비스가능 날짜를 출력한다.
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
				
				//console.log(ableDates);
				
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
		
		
		// 3. 총 결제금액 계산하기
		var price=0;
		var date=0;
		var sum=0;
		
		// 선택된 서비스에 따른 금액 찾기
		$("#serviceType").change(function() {
			// 시작인덱스
			var start  = $("#serviceType option:selected").text().indexOf('(')+1;
			//console.log('start: ' + start);
			
			// 종료인덱스
			var end  = $("#serviceType option:selected").text().indexOf(')')-1;
			//console.log('end: ' + end);
			
			// 금액 추출
			price  = $("#serviceType option:selected").text().substring(start, end).replace(/[^\d]+/g, '');
			//console.log('price: ' + price);	
			
			// 총결제금액 
			sum = price * date;
			//console.log('sum: ' + sum);
			
			// 3자리마다 콤마찍기
			sumComma = String(sum).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#totalPrice').text(sumComma);
			
			// DTO totalAmount에 계산된 값을 넣어준다.
			$('input[name=totalAmount]').attr('value', sum);
		});
			
		
		$(".flatpickr").change(function() {
			// 시작일
			var startDate  = new Date(document.getElementById("firstRangeInput").value);
			//console.log('startDate: ' + startDate);
			
			// 종료일
			var endDate  = new Date(document.getElementById("secondRangeInput").value);
			//console.log('endDate: ' + endDate);
			
			// 총 서비스 받는 일자
			// getTime()은 밀리세컨드 단위로 변환하기 때문에 1000(초), 60(분), 60(시), 24(일)로 나눠준다.
			date = ((endDate.getTime()-startDate.getTime())/1000/60/60/24)+1;
			//console.log('date: ' + date);
			
			// 총결제금액 
			sum = price * date;
			//console.log('sum: ' + sum);
			
			// 3자리마다 콤마찍기
			sumComma = String(sum).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#totalPrice').text(sumComma);
			
			$('input[name=totalAmount]').attr('value', sum);
		});
		
		// DTO petSitterNo에 쿼리스트링으로 받은 펫시터넘버를 넣어준다.
		$('input[name=petSitterNo]').attr('value', sch_key);
		
		//======================================================================================
		
		
		// 4. 예약중복확인
		$.ajax({
			url: "/search/bookingList",
			method: "POST",
			success: function(list) {
				
				var userNo = $('input[name=petUserNo]').val();
				//console.log('>>>>>userNo:' , userNo);
				//console.log('>>>>>list:' , list);
				
				for(var i=0; i<list.length; i++){
					if(list[i].stepTypeCode == "31" || list[i].stepTypeCode == "32" || list[i].stepTypeCode == "33"){
						isUserNo = true;
					} //if
				} //for
			} //success
		}); //ajax
			
			
	}); //ready
}); //jq


// 5.검색필터 필수조건(서비스, 날짜)
function check(){
	// 값의 여부를 확인하기 위한 변수
	var serviceType = document.booking.serviceType.value;
	var startDate = document.booking.startDate.value;
	var endDate = document.booking.endDate.value;
	
	//console.log('>>>>>>>>>>isUserNo: ', isUserNo);
	
	if(serviceType == "서비스 선택"){
		swal("", "서비스를 선택해주세요.", "warning")
		document.booking.serviceType.focus();
		
		return false; 
		
	} else if(startDate == "" || startDate == null){
		swal("", "시작날짜를 선택해주세요.", "warning")
		
		return false;
		
	} else if(endDate == "" || endDate == null){
		swal("", "종료날짜를 선택해주세요.", "warning")
		document.booking.endDate.focus();
		
		return false;
		
	} else if(isUserNo){
		swal("중복예약입니다.", "예약이 불가합니다.", "error")
		
		return false;
	} //if-else
	
	return true;	

}; //check




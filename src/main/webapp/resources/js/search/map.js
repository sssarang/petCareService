
//======================================//
 //=========== 입력된주소-좌표 변환 ===========//
 //======================================//


 // 주소-좌표 변환 객체 생성
 var geocoder = new kakao.maps.services.Geocoder();
 
 //좌표 
 var coords;

 geocoder.addressSearch('서울특별시 강남구 역삼동 819-3', function(result, status) {

     console.log(result[0].x, result[0].y);      
     // result[0].x :  경도 값
     // result[0].y :  위도 값
   	 
	 //좌표로 변환한 주소
	 coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	 
	

	// 결과값으로 받은 위치를 마커로 표시합니다
	var marker = new kakao.maps.Marker({
		map: map,
		position: coords
	});

	// 지도의 중심을 결과값(주소)으로 받은 위치로 이동시킵니다
	map.setCenter(coords);

}); 

 //======================================//
 //============== 지도생성준비 ==============//
 //======================================//
 // mapContainer: 지도가 표시될 HTML element
 var mapContainer = document.getElementById('map'); 
 
 // mapOption : 지도 생성 기본옵션
 var mapOption = { 
     center: coords, // 중심좌표(필수)
     level: 4 		 // 지도의 확대/축소레벨		
 };

 //지도 생성 및 객체 리턴
 var map = new kakao.maps.Map(mapContainer, mapOption); 
 console.log(">>"+map);

 
 //======================================//
 //============= 지도타입컨트롤 ==============//
 //======================================//
 // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입컨트롤 생성
 var mapTypeControl = new kakao.maps.MapTypeControl();
 
 // 지도에 컨트롤을 추가해야 지도위에 표시 OK
 // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미
 map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
 
 
 //======================================//
 //============== 지도 줌컨트롤 =============//
 //======================================//
 // 지도 확대/축소를 제어할 수 있는  줌컨트롤 생성
 var zoomControl = new kakao.maps.ZoomControl();
 
 map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);



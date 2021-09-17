// 마커를 담을 배열입니다
var markers = [];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };   

// 지도를 생성합니다  
var map = new kakao.maps.Map(mapContainer, mapOption);    


//======================================//
//============== 지도 줌컨트롤 =============//
//======================================//
// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();

map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


//======================================//
//============= 지도타입컨트롤 ==============//
//=======================================//
// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입컨트롤 생성
var mapTypeControl = new kakao.maps.MapTypeControl();
 
// 지도에 컨트롤을 추가해야 지도위에 표시 OK
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);


// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow();


// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
    //var listEl = document.getElementById('placesList'), 
    //menuEl = document.getElementById('menu_wrap'),
    //fragment = document.createDocumentFragment(), 
    
	bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 지도에 표시되고 있는 마커를 제거(초기화)
    removeMarker();

    
    for( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].userLatitude, places[i].userLongitude),
            marker = addMarker(placePosition, i); 
            //itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title, userNo) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
            });
            
            kakao.maps.event.addListener(marker, 'click', function() {
                displayOnClick(userNo);
            });

            //itemEl.onmouseover =  function () {
            //    displayInfowindow(marker, title);
            //};

            //itemEl.onmouseout =  function () {
            //    infowindow.close();
            //};
        })(marker, places[i].userNickname, places[i].userNo);
		
    } //for


    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);

} //displayPlaces


// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = '/resources/assets/img/search/marker.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(45, 45),  // 마커 이미지의 크기
        imgOptions =  {offset: new kakao.maps.Point(27, 69)}, // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
} //addMarker

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {	
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
} //removeMarker

		
// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {

	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	var content = '<div style="padding:5px;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);

} //displayInfowindow


// 마커 클릭했을때 이벤트
function displayOnClick(userNo) {
	fnProfileOn(userNo);
	// 프로필 팝업호출
}


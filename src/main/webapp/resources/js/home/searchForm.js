// 1.반려동물 유형에 따라 강아지 선택 여부 생성
function fnDogTypeOn(){
	$('#dogType').show();		

} //fnDogTypeOn

function fnDogTypeOff(){
	$('#dogType').hide();    	

} //fnDogTypeOff

document.getElementById("dog").addEventListener("click", fnDogTypeOn);
document.getElementById("cat").addEventListener("click", fnDogTypeOff);


// 2.검색필터 필수조건(주소)
function check(){
	// 값의 여부를 확인하기 위한 변수
	var sido = document.search.addrSido.value;
	var sigugun = document.search.addrSigugun.value;
	var dong = document.search.addrDong.value;
	
	
	if(sido == "" || sido == null){
		swal("", "검색할 지역을 선택해주세요.", "warning")
		document.search.addrSido.focus();
		
		return false; 
	} else if(sigugun == "" || sigugun == null){
		swal("", "검색할 지역을 선택해주세요.", "warning")
		document.search.addrSigugun.focus();
		
		return false;
	} else if(dong == "" || dong == null){
		swal("", "검색할 지역을 선택해주세요.", "warning")
		document.search.addrDong.focus();
		
		return false;
	} //if
	
}; //check


// 3.해당 id의 value로 새로운 value 넘기기
$(document).ready(function() {
	
	$("#sido").change(function() {
		var selectVal  = $("#sido option:selected").text();
		//console.log(selectVal);
		
	    $('#sidoHd').val(selectVal);
	});
	
	$("#sigugun").change(function() {
		var selectVal  = $("#sigugun option:selected").text();
		//console.log(selectVal);
		
	    $('#sigugunHd').val(selectVal);
	});
	
	$("#dong").change(function() {
		var selectVal  = $("#dong option:selected").text();
		//console.log(selectVal);
		
	    $('#dongHd').val(selectVal);
	});
});



	

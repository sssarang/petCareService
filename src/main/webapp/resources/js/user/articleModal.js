$(function() {
	$('#myModal').show();

});

function pJoin(){
	var joinForm = document.joinForm;
	
	//필수 체크항목 검증
	var check1 = document.getElementById("necessary1");
	var check2 = document.getElementById("necessary2");
	var check3 = document.getElementById("necessary3");
			
	var isCheck1 = $(check1).prop("checked");
	var isCheck2 = $(check2).prop("checked");
	var isCheck3 = $(check3).prop("checked");
	
	if( (isCheck1 == false) || (isCheck2 == false) || (isCheck3 == false)) {
		swal({
			title : '',
			text : '필수항목을 체크해주세요',
			icon : 'warning',
		});
	} else {
		//펫시터 가입
		var sendData = "classify="+2;
		$.ajax({
			url:'userClassify',
			method: 'POST',
			data: sendData,
			success : function(resp){}
		})//.ajax
		$(this).attr("type","submit");
		window.location.href="http://localhost:8090/user/joinPage";
	}//if-else
}//pJoin

function nJoin(){
	var joinForm = document.joinForm;
	
	//필수 체크항목 검증
	var check1 = document.getElementById("necessary1");
	var check2 = document.getElementById("necessary2");
	var check3 = document.getElementById("necessary3");
	
	var isCheck1 = $(check1).prop("checked");
	var isCheck2 = $(check2).prop("checked");
	var isCheck3 = $(check3).prop("checked");
	
	if( (isCheck1 == true) && (isCheck2 == true) && (isCheck3 == true)) {
		//일반 회원으로 가입
		var sendData = "classify="+1;
		$.ajax({
			url:'userClassify',
			method: 'POST',
			data: sendData,
			success : function(resp){}
		})//.ajax
		$(this).attr("type","submit");
		window.location.href="http://localhost:8090/user/joinPage";
	} else {
		swal({
			title : '',
			text : '필수항목을 체크해주세요',
			icon : 'warning',
		});
	}//if-else
}//nJoin

//전체선택 버튼 클릭시
function selectAll(selectAll) {

	const checkboxes = document.getElementsByName('chk');
	
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})//forEach
}//selectAll

//선택된 버튼 개수와 전체 버튼 개수를 이용해 전체버튼 컨트롤
function checkSelectAll() {
	// 전체 체크박스
	const checkboxes = document.querySelectorAll('input[name="chk"]');
	// 선택된 체크박스
 	const checked = document.querySelectorAll('input[name="chk"]:checked');

	// select all 체크박스
	const selectAll = document.querySelector('input[name="chkAll"]');
	  
	if(checkboxes.length === checked.length)  {
	  selectAll.checked = true;
	}else {
	  selectAll.checked = false;
	}//if-else
}//checkSelectAll

//팝업 Close 기능
function close_pop() {
     $('#myModal').hide();
	 window.location.href="http://localhost:8090/user/loginPage";
};
//전체선택 버튼 클릭시
function selectAll(selectAll) {
	console.log("gd");
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

function pJoin(){
	var joinForm = document.joinForm;
	
	//필수 체크항목 검증
	var check1 = document.getElementById("necessary1");
	var check2 = document.getElementById("necessary2");
	var check3 = document.getElementById("necessary3");
			
	var isCheck1 = $(check1).prop("checked");
	var isCheck2 = $(check2).prop("checked");
	var isCheck3 = $(check3).prop("checked");
	
	console.log(isCheck1, isCheck2, isCheck3)
	
	if( (isCheck1 == true) && (isCheck2 == true) && (isCheck3 == true)) {
		//펫시터 가입
		var sendData = "classify="+2;
		$.ajax({
			url:'userClassify',
			method: 'POST',
			data: sendData,
			success : function(resp){}
		})//.ajax
		joinForm.submit();
	} else {
		alert('필수항목을 체크해주세요');
		return false;
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
	
	console.log(isCheck1, isCheck2, isCheck3)
	
	if( (isCheck1 == true) && (isCheck2 == true) && (isCheck3 == true)) {
		//일반 회원으로 가입
		var sendData = "classify="+1;
		$.ajax({
			url:'userClassify',
			method: 'POST',
			data: sendData,
			success : function(resp){}
		})//.ajax
		joinForm.submit();
	} else {
		alert('필수항목을 체크해주세요');
		return false;
	}//if-else
}//nJoin


/*function allCheck() {
    $("[name=check01]").prop("checked",true); 
	console.log("allCheck()");
}// 모두 체크하기
 
function oneCheck(a)
{
    var allChkBox = $("[name=check01]");
    var chkBoxName = $(a).attr("name");
 
    if( $(a).prop("checked") )
    {
        checkBoxLength = $("[name="+ chkBoxName +"]").length;
         //전체체크박스 수(모두동의하기 체크박스 제외)
        checkedLength = $("[name="+ chkBoxName +"]:checked").length;
        //체크된 체크박스 수 
		console.log("checked1()");
        if( checkBoxLength == checkedLength ) {
            allChkBox.prop("checked", true);
            //전체체크박스수 == 체크된 체크박스 수 같다면 모두체크
 			console.log("checked2()");
        } else {
            allChkBox.prop("checked", false);
            console.log("checked3()");
        }
    }
    else
    {
        allChkBox.prop("checked", false);
		console.log("checked4()");
    }
}
 
$(function(){
    $("[name=check01]").click(function(){
        allCheck(this);
        //모두동의하기 체크박스 클릭시
		console.log("allCheck2()");
    });
    $("[name=chk]").each(function(){
        $(this).click(function(){
            oneCheck(this);
			console.log("allCheck3()");
        });
		console.log("allCheck4()");
    });
});
*/
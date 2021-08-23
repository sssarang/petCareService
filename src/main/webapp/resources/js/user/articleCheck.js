function allCheck() {
    $("[name=check02]").prop("checked",true); 
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
    $("[name=check02]").each(function(){
        $(this).click(function(){
            oneCheck(this);
			console.log("allCheck3()");
        });
		console.log("allCheck4()");
    });
});

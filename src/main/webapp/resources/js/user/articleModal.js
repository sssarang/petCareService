jQuery(document).ready(function() {
        $('#myModal').show();
});
//팝업 Close 기능
function close_pop(flag) {
     $('#myModal').hide();
	 window.location.href="http://localhost:8090/user/loginPage";
};
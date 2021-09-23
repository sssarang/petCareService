$(function() {
	
	$(".faqList").click(function() {
		var buttonId = $(this).attr('id');
		alert(buttonId);
		
		//ajax를 이용하여 제목, 내용 가져오기
		var sendData = "buttonId="+buttonId;
		$.ajax({
			url:'/admin/showFAQ',
			method: 'GET',
			data: sendData,
			success : function(resp){
				console.log(resp);
				$('#FaqTitle').val(resp.faqQuestion);
				$('#FaqContents').val(resp.faqAnswer);					
			}
		})//.ajax
	});
})
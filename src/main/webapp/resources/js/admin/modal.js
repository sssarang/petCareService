var action = '';
var url = '';
var type = '';
var sequence = 0;

$(document).ready(function(){

	// 새 글 쓰기 버튼 클릭
	$("#create").click(function(){
		action='create';
		type = 'POST'
		$("#modal-title").text("새 글 작성");
		$("#myModal").modal();
	});
	
	// 수정하기 버튼 클릭
	$("button[name='modify']").click(function(){
		action='modify';
		type = 'PUT';
		sequence = this.value;

		// content 담기
		var row = $(this).parent().parent().parent();
		var tr = row.children();
		
		var faqQuestion = tr.eq(0).text();
		var faqAnswer = tr.eq(5).text();

		$("#modal-title").text("수정하기");

		$("#title").val(faqQuestion);
		$("#contents").val(faqAnswer);
		
		$("#myModal").modal();
	});
	
	// 삭제하기 버튼 클릭
	$("button[name='delete']").click(function(){
		sequence = this.value;
		
		var data = {
			"faqSequence" : sequence
		}
		
		$.ajax({
			url : '/admin/deleteFaq',
			type : 'POST',
			data : data
		});
		
		location.reload();
	})
	
	// Modal의 Submit 버튼 클릭
	$("#modalSubmit").click(function(){
		
		if(action == 'create'){
			sequence = 0;
			url = '/admin/createFaq';
			type='POST';
		}else if(action == 'modify'){
			url = '/admin/modifyFaq';
			type='POST';
		}

		var data = {
			"faqSequence" : sequence,
			"faqQuestion" : $("#title").val(),
			"faqAnswer" : $("#contents").val()
		}
		
		$.ajax({
			url : url,
			type : type,
			data : data
		})
		
		location.reload();
	});
	

});
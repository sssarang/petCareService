$(function() {
    //console.debug("faq...");

	$('#faqBtn').on("click", function(event){
		// 비동기식으로 데이터를 받아온다.
        $.ajax({
            url:"faq",
            method: "GET",
            success: function(list){
                //console.log(list);

                for(var i=0; i<list.length; i++){
                    var question = list[i].faqQuestion;
                    var answer = list[i].faqAnswer;

					//console.log(question);	                    
					//console.log(answer);	     
					
					// 리스트의 크기만큼 faq목록 생성 + 순서에 맞는 값을 넣어준다.
					$('#accordion').append('<div class="card"><div class="card-header"><a2 class="card-link" data-toggle="collapse" href="#collapse'+i+'">'+question+'</a2></div><div id="collapse'+i+'" class="collapse" data-parent="#accordion"><div class="card-body">'+answer+'</div></div></div>');

                } //for

            } //success
        }); //ajax

		// 이벤트 한번만 실행
		$( this ).off(event);
		
	}); //.onclick
    
}); //jq
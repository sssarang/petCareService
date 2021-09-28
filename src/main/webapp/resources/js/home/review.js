$(function(){
	//console.debug("review...");
	
	$(document).ready(function(){
		// 비동기식으로 데이터를 받아온다.
		$.ajax({
			url: "review",
			method: "GET",
			success: function(list) {
				//console.log(list);
				
				// 리스트에서 필요한 값만 배열로 담는다.	
				function getFields(input, field){
					var output = [];
					
					for(var i=0; i<input.length; i++){
						output.push(input[i][field]);
					} //for
					
					return output;
				} //getFields
				
				
				// 작성자
				var resultWriter = getFields(list, 'userNickname');
				
				$('#writer1').text(resultWriter[0]);
				$('#writer2').text(resultWriter[1]);
				$('#writer3').text(resultWriter[2]);
				
				// 컨텐츠
				var resultContent = getFields(list, 'revContent');
				
				$('#content1').text(resultContent[0]);
				$('#content2').text(resultContent[1]);
				$('#content3').text(resultContent[2]);
				
				// 프로필사진
				var resultPhoto = getFields(list, 'proPhoto');
				$('#photo1').attr('src', resultPhoto[0]);
				$('#photo2').attr('src', resultPhoto[1]);
				$('#photo3').attr('src', resultPhoto[2]);
				
			} //success
			
		}); //ajax
		
	}); //ready
	
}); //jq
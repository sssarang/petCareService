	<!-------------강아지타입 선택필터 생성----------------->
	 	
	function fnDogTypeOn(){
	    $('.btn-toggle').show();		
//		document.querySelector('.btn-toggle').style.display ='block';
	 
	} //fnDogTypeOn
	 
	function fnDogTypeOff(){
	    $('.btn-toggle').hide();    	
//		document.querySelector('.btn-toggle').style.display ='none';
	 
	} //fnDogTypeOff
	 
	document.getElementById("dog").addEventListener("click", fnDogTypeOn);
	document.getElementById("cat").addEventListener("click", fnDogTypeOff);
	
	
	<!----------해당 id의 value로 주소 name 가져오기-------------->
	
	$("#sido").change(function(){
		var selectVal  = $("#sido option:selected").text();
		
		$("#addrSido").val(selectVal);
	})
	
	$("#sigugun").change(function(){
		var selectVal  = $("#sigugun option:selected").text();
		
		$("#addrSigugun").val(selectVal);
	})
	
	$("#dong").change(function(){
		var selectVal  = $("#dong option:selected").text();
		
		$("#addrDong").val(selectVal);
	})

	<!----------선택항목 check(지역 선택여부, 금액확인)-------------->

	function check(){
		
		
		//1. 값의 여부를 확인하기 위한 변수
		var minPrice = parseInt(document.getElementById("min").value); 
		var maxPrice = parseInt(document.getElementById("max").value); 
	
		if(minPrice > maxPrice){
			alert("최저금액/최고금액을 확인해주세요.");
			document.getElementById("min").focus();
						
			return false;
		}
		
		//2. 서비스지역선택 여부를 확인하기 위한 변수
		var sido = document.getElementById('addrSido').value;		
		var sigugun = document.getElementById('addrSigugun').value;
		var dong = document.getElementById('addrDong').value;
			
		alert(sido);	
		alert(sigugun);	
		alert(dong);	

		if(sido == "" || sido == null){
			alert("검색할 지역을 선택해주세요.")
			document.getElementById('sido').focus();
			
			return false; 
		} else if(sigugun == ""){
			alert("검색할 지역을 선택해주세요.")
			document.getElementById('sigugun').focus();
			
			return false;
		} else if(dong == ""){
			alert("검색할 지역을 선택해주세요.")
			document.getElementById('dong').focus();
			
			return false;
		} //if-else
		
	}; //check
	
	
	<!-------------선택된 펫시터프로필 생성----------------->
	
	function fnProfileOn(userNo){
		
		//해당 프로필 회원번호(userNo)
		alert(userNo);

		$.ajax({
	        url:"/search/psProfile"
	      , method : 'POST'
	      , data : {				
	    	  userNo : userNo
	      } 		
	      , success :  function(result){
				alert("success");
				fnProfileOff();
		  		$('.profile').show();
	      }
	  })	
	
	} //fnProfileOn  


	function fnProfileOff(){
    	$('.profile').hide();    			
//		document.querySelector('.profile').style.display ='none';
	} //fnProfileOff

	document.getElementById("profileClose").addEventListener("click", fnProfileOff);
    
	<!-------------프로필 활동사진 생성----------------->
	
	window.onload = function(){
		var swiper = new Swiper('.swiper-container', {
					 pagination: '.swiper-pagination',
					 paginationType: 'progress',
					 slidesPerView: 'auto',
					 paginationClickable: true,
					 spaceBetween: 0,
					 freeMode: true,
					 nextButton: '.next',
					 prevButton: '.back'
		 });
	};

	
	<!-------------매칭창으로 연결----------------->
	
	function fnMatchingOn(userNo){
		
		//해당 프로필 회원번호(userNo)
		alert(userNo);

		$.ajax({
	        url:"/search/matching"
	      , method : 'POST'
	      , data : {				
	    	  userNo : userNo
	      } 		
	      , success :  function(result){
				alert("success");
		  		$('.profile').show();
	      }
	  })	
	
	} //fnMatchingOn  

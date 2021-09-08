	//-----------------------------------------------//
	// 1. 필터조건 Section
	//-----------------------------------------------//

	//-------------강아지타입 선택필터 생성-----------------//
	 	
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
	
	
	//----------해당 id의 value로 주소 name 가져오기--------------//
	
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

	//----------선택항목 check(지역 선택여부, 금액확인)--------------//

	function check(){
		
		
		//1. 서비스 최소-최대금액 확인
		var minPrice = parseInt(document.getElementById("min").value); 
		var maxPrice = parseInt(document.getElementById("max").value); 
	
		if(minPrice > maxPrice){
			swal("", "최저금액/최고금액을 확인해주세요.", "warning");
			document.getElementById("min").focus();
						
			return false;
		}
		
		//2. 서비스지역선택 여부 확인
		var sido = document.getElementById('sido').value;		
		var sigugun = document.getElementById('sigugun').value;
		var dong = document.getElementById('dong').value;
				
		if(sido == "" || sido == null){
			swal("", "검색할 지역을 선택해주세요.", "warning")
			document.getElementById('sido').focus();
			
			return false; 
		} else if(sigugun == ""|| sigugun == null){
			swal("", "검색할 지역을 선택해주세요.", "warning")
			document.getElementById('sigugun').focus();
			
			return false;
		} else if(dong == ""|| dong == null){
			swal("", "검색할 지역을 선택해주세요.", "warning")
			document.getElementById('dong').focus();
			
			return false;
		} //if-else
		
	}; //check
	
	
	//-----------------------------------------------//
	// 2. 펫시터프로필 Section
	//-----------------------------------------------//
		
	//-------------선택된 펫시터프로필 생성-----------------//
	
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
				//1.프로필 세팅
				
				//펫시터기본정보
				var resultPs = result.ps;				 
				console.log(resultPs.proPhoto);
				console.log(resultPs.userNickname);
				console.log(resultPs.userAddress);
				console.log(resultPs.introduce);
				
				$("#psNickname").text(resultPs.userNickname);
				$("#psNickname").text(resultPs.userNickname);
				$("#psAddress").text(resultPs.userAddress);
				$("#psIntroduce").text(resultPs.introduce);

				//서비스유형
				/*var resultSt = result.serviceType;
				console.log('serviceType'+resultSt);
				console.log(resultSt.serviceTypeCode);
				console.log(resultSt.price);
				
				$("#psServiceTypeCode").text(resultSt.serviceTypeCode);
				$("#psPrice").text(resultSt.price);
								
				//서비스일정	 
				var resultSc = result.serviceCalendar;   
				console.log(resultSc);
				console.log(resultSc.serviceDate);

				$("#psServiceDate").text(resultSc.serviceDate);

				//서비스펫유형
				var resultSp = result.servicePetKinds;	 
				console.log(resultSp);
				console.log(resultSp.petTypeCode);

				$("#psPetTypeCode").text(resultSp.petTypeCode);

				//펫시터스킬
				var resultSk = result.psSkill;			 
				console.log(resultSk);
				console.log(resultSk.skillTypeCode);

				$("#psSkillTypeCode").text(resultSk.skillTypeCode);

				//활동사진
				var resultAp = result.activityPhoto;     
				console.log(resultAp);
				console.log(resultAp.actPhoto);

				//리뷰
				var resultRv = result.review;			 
				console.log(resultRv);*/
				
				//2.프로필 열기 
		  		$('.profile').show();
	      }
	  })	
	
	} //fnProfileOn  


	function fnProfileOff(){
    	$('.profile').hide();    			
//		document.querySelector('.profile').style.display ='none';
	} //fnProfileOff

	document.getElementById("profileClose").addEventListener("click", fnProfileOff);
    
	//-------------프로필 활동사진 생성-----------------//
	
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

	
	//-------------매칭창으로 연결-----------------//
	
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

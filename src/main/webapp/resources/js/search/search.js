	//-----------------------------------------------//
	// 1. 필터조건 Section
	//-----------------------------------------------//

	//-------------강아지타입 선택필터 생성-----------------//
	 	
	function fnDogTypeOn(){
	    $('.btn-toggle').show();		
	} //fnDogTypeOn
	 
	function fnDogTypeOff(){
	    $('.btn-toggle').hide();    		 
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

	function fnCheck(){
		
		//1. 서비스 최소-최대금액 확인
		var minPrice = parseInt(document.getElementById("min").value); 
		var maxPrice = parseInt(document.getElementById("max").value); 
	
		if(minPrice > maxPrice){
			swal("", "최저금액/최고금액을 확인해주세요.", "warning");
			document.getElementById("min").focus();
						
			return false;
		} //if
		
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
		
	}; //fnCheck
	
		
	//-----------------------------------------------//
	// 2. 펫시터프로필 Section
	//-----------------------------------------------//
	
	//----------------서비스일정달력준비-------------------//
	
	function fnMakecalender(){    	
		calendar = document.getElementById("calendar");
        row = calendar.insertRow();
        
        for(i = 0; i < first_day; i++){
            cell = row.insertCell();
        } //for

        for(i = 1; i <= last_date; i++){
            if(first_day < 7){
                //셀추가
                cell = row.insertCell();
                //모든 셀에 id를 부여함
                cell.setAttribute('id', [i]);
                //추가된 셀에 i값 입력
                cell.innerHTML = [i];

                first_day += 1;
            } else{
                //행추가
                row = calendar.insertRow();

                cell = row.insertCell();
                cell.setAttribute('id', [i]);
                cell.innerHTML = [i];

                first_day = first_day - 6;
                //6을 빼는 이유는 매번 7에서 else문으로 넘어오고, if문이 6번만 하면 되기때문이다.
                //7을 빼버리면 0부터 시작해서 if문이 7번 실행되고 else로 넘어오므로 -6을한다.
            } //if-else
        } //for
    } //makecalender


    function fnServiceDateMarkup(targetDate, targetMonth){
		let today = new Date();   

		let month = today.getMonth() + 1;   // 월
		let date = today.getDate();         // 날짜
		let day = today.getDay();           // 요일
				
		if(targetMonth+1 == month){
			for(i=1; i<=last_date; i++){
	                set_id = document.getElementById([i]);

	                if(parseInt(date) == parseInt(set_id.getAttribute('id'))){
		                set_id.bgColor = "#e6e6e6";
	                } //if 
	    		} //for
		} //오늘날짜표시

		$.each(targetDate, function(i){			
			var serviceDate = targetDate[i].serviceDate;
			var monthDo =  serviceDate.substr(5, 2);
			var dayDo = serviceDate.substr(8, 2);
			
			
			if(parseInt(targetMonth+1) == parseInt(monthDo)){
				for(i=1; i<=last_date; i++){
	                set_id = document.getElementById([i]);

	                if(parseInt(dayDo) == parseInt(set_id.getAttribute('id'))){
		                set_id.bgColor = "#ffd993";
	                } //if 
	    		} //for
			} //if
		}) //each		
	}//fnServiceDateMarkup(targetDate: DB에서 가지고온 serviceDate
	 // 				   targetMonth: 달력 월(MarkupDate와 비교))
    

	function fnZeros(n, digits) {
	  var zero = '';
	  n = n.toString();
	
	  if (n.length < digits) {
	    for (var i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	} //fnZeros(n: 타겟/ digits: 자리수)
	    		
	//-------------선택된 펫시터프로필 생성-----------------//
	
	function fnProfileOn(userNo){
		
		$.ajax({
	        url:"/search/psProfile"
	      , method : 'POST'
	      , data : {				
	    	  userNo : userNo
	      } 		
	      , success :  function(result){		
				//================================//
				//           1.프로필 세팅
				//================================//
				
				//========== 펫시터 기본정보 ==========//
				var resultPs = result.ps;
				
				//회원번호---------------------------//
				var userNo = resultPs.userNo;
				
				//프로필사진(DB)----------------------//
				var proPhoto = resultPs.proPhoto;
				
				//기본프로필사진-----------------------//
				var petsitterPhoto = '/resources/assets/img/search/petsitter.jpg';

				if(proPhoto === null){
					$("#photo").attr('src', petsitterPhoto);										
				} else{
					$("#photo").attr('src', resultPs.proPhoto);					
				};
						
				//리뷰평점------------------------------//
				var avg = parseFloat(resultPs.avg).toFixed(1);
				
				if(avg > 0 && avg < 1){
					$("#star").text("☆ ");
    				$("#psAvg").text("("+avg+")");
				} else if(avg == 1){
					$("#star").text("★ ");
    				$("#psAvg").text("("+avg+")");					
				} else if(avg > 1 && avg < 2){
					$("#star").text("★☆ ");
    				$("#psAvg").text("("+avg+")");					
				} else if(avg == 2){
					$("#star").text("★★ ");
    				$("#psAvg").text("("+avg+")");					
				} else if(avg > 2 && avg < 3){
					$("#star").text("★★☆ ");
    				$("#psAvg").text("("+avg+")");					
				} else if(avg == 3){
					$("#star").text("★★★ ");
    				$("#psAvg").text("("+avg+")");					
				} else if(avg > 3 && avg < 4){
					$("#star").text("★★★☆ ");
    				$("#psAvg").text("("+avg+")");					
				} else if(avg == 4.0){
					$("#star").text("★★★★ ");
    				$("#psAvg").text("("+avg+")");					
				} else if(avg > 4 && avg < 5){
					$("#star").text("★★★★☆ ");
    				$("#psAvg").text("("+avg+")");					
				} else if(avg == 5){
					$("#star").text("★★★★★ ");
    				$("#psAvg").text("("+avg+")");					
				} else {
					$("#star").text("☆☆☆☆☆ ");
    				$("#psAvg").text("(0.0)");			
				}// if-else


			    //닉네임-------------------------------//		 
				var userNickname = resultPs.userNickname;
				
				//주소---------------------------------//	
				var userAddress = resultPs.userAddress;

				//자기소개-------------------------------//	
				var introduce = resultPs.introduce;
				
				//PS 기본정보입력						
				$("#psNickname").text(userNickname);
				$("#psAddress").text(userAddress);
				$("#psIntroduce").text(introduce);

				//matching버튼				
				$("#matching").attr('value',userNo);
				

				//========== 서비스 정보 ==========//

				//서비스일정-----------------------------//		
				var resultSc = result.serviceCalendar;
				
				const today = new Date();
		        let year = today.getFullYear();
		        let month = today.getMonth(); 
				
				let maxDate = new Date();
		        maxDate.setMonth(month+3);
				
		        YM = year + ". " + fnZeros((month+1), 2);   // JS는 0~11월로 표시해서 +1
		        
		        //첫날
		        first_date = new Date(year, month, 1).getDate();
		
		        //마지막날
		        last_date = new Date(year, month+1, 0).getDate();
		
		        //첫날 요일
		        first_day = new Date(year, month, 1).getDay();
		        // 원하는 요일부터 1일이 출력되게 하기 위함

				var scTable = "";
				scTable += "<thead><tr>";
				scTable += "<td></td>";
				scTable += "<td> <input id='calPre' type = 'button' value = '◀'/> </td>";
		        scTable += "<td id='YM' colspan='3' style='padding: 0; width: 43%;''>year-month</td>";
				scTable += "<td> <input id='calNext' type = 'button' value = '▶'/> </td>";
				scTable += "<td></td>";
				scTable += "</tr></thead>";
				scTable += "<tbody><tr id='day7'>";
				scTable += "<td>일</td> <td>월</td> <td>화</td> <td>수</td> <td>목</td> <td>금</td> <td>토</td>";
				scTable += "</tr></tbody>";
				
				$("#calendar").html(scTable);
				
				document.getElementById("YM").innerHTML = YM;
				document.getElementById("calPre").addEventListener("click", function before_month() {
					
					if(month == new Date().getMonth()){
												
						return false;
					} else{
						month = month-1;
						
						if(month === -1){
				            //0월이 되었을 때 이전연도 12월로 가도록 작업
				            //js에서 0월 = 실제 1월 이므로 -1로 맞춰야한다.
				            year = year - 1;
				            month = month + 12;
			        	}
			        
						while (calendar.rows.length > 2) {
			            //2줄이 남을 때 까지 줄을 지워줌
			            //버튼과 요일이 남아야 하기 때문에 2줄만 남기고 지운다.
			            calendar.deleteRow(calendar.rows.length-1);
				        } //while
				
						
				        YM = year + ". " + fnZeros((month+1), 2); 
				        document.getElementById("YM").innerHTML = YM;
				
				        first_date = new Date(year,month,1).getDate();
				        last_date = new Date(year,month+1,0).getDate();
				        first_day = new Date(year,month,1).getDay();
						
				        fnMakecalender();	
						fnServiceDateMarkup(resultSc, month);
							
					} //if-else
					
			    }); //before_month
    		    
				document.getElementById("calNext").addEventListener("click", function next_month() {
					
			        if(month === maxDate.getMonth()){
						swal("", "3개월 내에서 조회가능합니다", "warning");
						
						return false;
					} else{
						
						while (calendar.rows.length > 2) {
			            calendar.deleteRow(calendar.rows.length-1);
				        } //while
				
				        month = month+1;

						if(month === 12){
				            //13월이 되었을 때 다음연도 1월로 가도록 작업
				            //js에서 11월 = 실제 12월 이므로 12로 맞춰야한다.
				            year = year + 1;
				            month = month -12;
				        } //if
				        
						YM = year + ". " + fnZeros((month+1), 2); 
				        document.getElementById("YM").innerHTML = YM;
				
				        first_date = new Date(year,month,1).getDate();
				        last_date = new Date(year,month+1,0).getDate();
				        first_day = new Date(year,month,1).getDay();
	
				        fnMakecalender();	
						fnServiceDateMarkup(resultSc, month);
								
					} //if-else	
					
			    }); //next_month		
	
				fnMakecalender();
				fnServiceDateMarkup(resultSc,month);
				
				
				//서비스펫유형-----------------------------//	
				var resultPk = result.servicePetKinds;
				var pk ="";

				$.each(resultPk, function(i){
					if(resultPk[i].petTypeCode == 1){
						pk += "<li>강아지(대형견)</li> ";						
					}
					if(resultPk[i].petTypeCode == 2){
						pk += "<li>강아지(중형견)</li> ";						
					}
					if(resultPk[i].petTypeCode == 3){
						pk += "<li>강아지(소형견)</li> ";						
					}
					if(resultPk[i].petTypeCode == 4){
						pk += "<li>고양이</li> ";						
					}
				}) //each
				
				$("#psPetTypeCode").html(pk);


				//서비스유형 및 비용-------------------------//	
				var resultSt = result.serviceType;
				var st ="";
				
				$.each(resultSt, function(i){
					//금액 콤마(,)찍기
					var price = String(resultSt[i].price).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					
					if(resultSt[i].serviceTypeCode == 11){
						st += "<li>돌봄(All Day) - ("+price+"원)</li>";											
					}
					if(resultSt[i].serviceTypeCode == 12){
						st += "<li>돌봄(Half Day) - ("+price+"원)</li>";											
					}
					if(resultSt[i].serviceTypeCode == 13){
						st += "<li>방문(All Day) - ("+price+"원)</li>";											
					}
					if(resultSt[i].serviceTypeCode == 14){
						st += "<li>방문(Half Day) - ("+price+"원)</li>";											
					}
				})
				
				$("#psServiceTypeCode").html(st);

				
				//펫시터스킬------------------------------//	
				var resultSk = result.psSkill;			 
				var sk ="";
				
				if(resultSk.length === 0){
					$("#service4").hide();
					
				} else{
					$("#service4").show();
					
					$.each(resultSk, function(i){						
						if(resultSk[i].skillTypeCode == 21){
							sk += "<li>약 먹이기 가능 </li>";					
						}					
						if(resultSk[i].skillTypeCode == 22){
							sk += "<li>노령견 경험 有 </li>";					
						}					
						if(resultSk[i].skillTypeCode == 23){
							sk += "<li>환견/환묘 경험 有 </li>";					
						}					
						if(resultSk[i].skillTypeCode == 24){
							sk += "<li>애견관련 업종 경험 有 </li>";					
						}					
					}) //each
				} //if-else

				$("#psSkillTypeCode").html(sk);

				//활동사진-------------------------------//	
				var resultAp = result.activityPhoto;
				var ap ="";

				if(resultAp.length === 0){					
					var noActivityPhoto = '/resources/assets/img/search/act.png';
					
					ap += "<div class='noActivityPhoto'>";
					ap += "<img class='noActivityPhotoImg' src='"+ noActivityPhoto +"'></div>";
										
					$(".active_photo").empty();
					$(".active_photo").html(ap);

				} else if(resultAp.length === 1){
					$.each(resultAp, function(i){
						switch(resultAp[i].photoNo){
							case 1 : ap += "<div id='ap1'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
						} //switch
						
					}); //each
	
					ap += "<div id='ap2'><img class='apImg' src='/resources/assets/img/search/ap1.png'></div>";
					ap += "<div id='ap3'><img class='apImg' src='/resources/assets/img/search/ap2.png'></div>";
					ap += "<div id='ap4'><img class='apImg' src='/resources/assets/img/search/ap3.png'></div>";
					ap += "<div id='ap5'><img class='apImg' src='/resources/assets/img/search/ap4.png'></div>";
					
					$(".active_photo").empty();
					$(".active_photo").html(ap);
					
					$("#photomodalBox").html(ap);					
					$("#photomodalBox").append("<div id='photocloseBtn'><a>close</a></div>");
				} else if(resultAp.length === 2){
					$.each(resultAp, function(i){
						switch(resultAp[i].photoNo){
							case 1 : ap += "<div id='ap1'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
										break;
							case 2 : ap += "<div id='ap2'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
						} //switch
						
					}); //each
	
					ap += "<div id='ap3'><img class='apImg' src='/resources/assets/img/search/ap2.png'></div>";
					ap += "<div id='ap4'><img class='apImg' src='/resources/assets/img/search/ap3.png'></div>";
					ap += "<div id='ap5'><img class='apImg' src='/resources/assets/img/search/ap4.png'></div>";
					
					$(".active_photo").empty();
					$(".active_photo").html(ap);
					
					$("#photomodalBox").html(ap);					
					$("#photomodalBox").append("<div id='photocloseBtn'><a>close</a></div>");
					
				} else if(resultAp.length === 3){
					$.each(resultAp, function(i){
						switch(resultAp[i].photoNo){
							case 1 : ap += "<div id='ap1'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
										break;
							case 2 : ap += "<div id='ap2'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
										break;
							case 3 : ap += "<div id='ap3'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
						} //switch
						
					}); //each
	
					ap += "<div id='ap4'><img class='apImg' src='/resources/assets/img/search/ap3.png'></div>";
					ap += "<div id='ap5'><img class='apImg' src='/resources/assets/img/search/ap4.png'></div>";
					
					$(".active_photo").empty();
					$(".active_photo").html(ap);
					
					$("#photomodalBox").html(ap);					
					$("#photomodalBox").append("<div id='photocloseBtn'><a>close</a></div>");
					
				} else if(resultAp.length === 4){
					$.each(resultAp, function(i){
						switch(resultAp[i].photoNo){
							case 1 : ap += "<div id='ap1'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
										break;
							case 2 : ap += "<div id='ap2'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
										break;
							case 3 : ap += "<div id='ap3'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
										break;
							case 4 : ap += "<div id='ap4'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
							
						} //switch
						
					}); //each
	
					ap += "<div id='ap5'><img class='apImg' src='/resources/assets/img/search/ap4.png'></div>";
					
					$(".active_photo").empty();
					$(".active_photo").html(ap);
					
					$("#photomodalBox").html(ap);					
					$("#photomodalBox").append("<div id='photocloseBtn'><a>close</a></div>");
					
				} else{
					$.each(resultAp, function(i){
						switch(resultAp[i].photoNo){
							case 1 : ap += "<div id='ap1'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
										break;
							case 2 : ap += "<div id='ap2'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
										break;
							case 3 : ap += "<div id='ap3'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
										break;
							case 4 : ap += "<div id='ap4'><img class='apImg' src='"+ resultAp[i].actPhoto +"'></div>";
										break;
							case 5 : ap += "<div id='ap5'><img class='apImg' src='"+ resultAp[i].actPhoto +"'>";
  									 ap += "<div id='plusap'><p style='text-align: center; font-size: 100px; color: white;'>+</p></div></div>";
						} //switch
												
					}); //each
					
					
					$(".active_photo").empty();
					$(".active_photo").html(ap);
					
				} //if-else
		
		
				var modal = "";
				$.each(resultAp, function(i){
					modal += "<div class='modalap'><img class='modalapImg' src='"+ resultAp[i].actPhoto +"'></div>";
				}); //each
	
			
				$("#photomodalBox").html(modal);					
				$("#photomodalBox").append("<div id='photocloseBtn'><a>close</a></div>");

				if(resultAp.length != 0){
					document.getElementById("ap1").addEventListener("click", fnphotoModalOpen);
					document.getElementById("ap2").addEventListener("click", fnphotoModalOpen);
					document.getElementById("ap3").addEventListener("click", fnphotoModalOpen);
					document.getElementById("ap4").addEventListener("click", fnphotoModalOpen);
					document.getElementById("ap5").addEventListener("click", fnphotoModalOpen);
					
					document.getElementById("photocloseBtn").addEventListener("click", fnphotoModalClose);					
				} //if	
				
				
				//---------------활동사진 모달창 생성-------------------//
				
				function fnphotoModalOpen(){
					$('#photomodalBox').show();  
					$('.black_bg').show();

					document.getElementById("photomodalBox").scrollIntoView(); 
				}; //fnModalOpen
				
				
				function fnphotoModalClose(){
					$('#photomodalBox').hide();  
					$('.black_bg').hide(); 
 
				}; //fnModalOpen
				     

				//리뷰-----------------------------------//	
				var resultRv = result.review;			 
				var rev ="";
				
				
				if(resultRv.length === 0){
					var noReview = '/resources/assets/img/search/review.jpg';
					
					rev += "<div class='noReview'>";
					rev += "<img class='noReviewImg' src='"+ noReview +"'>";										
					rev += "<p>등록된 리뷰가 없습니다.</p></div>";
					
					$("#review-list").html(rev);

				} else{
					$.each(resultRv, function(i){
						
						//평점(별표시)
						var grade = parseFloat(resultRv[i].grade).toFixed(1);
						var star;
						
						if(grade == 1){
							star = "★";
						} else if(grade == 2){
							star = "★★";					
						} else if(grade == 3){
							star = "★★★";					
						} else if(grade == 4){
							star = "★★★★";					
						} else if(grade == 5){
							star = "★★★★★";					
						} //if-else	
						
						//기본프로필사진-----------------------//
						var petUserBasic = '/resources/assets/img/search/petuser.jpg';
						
						//리뷰div
						rev += "<div class='review'>"; 
						
						if(resultRv[i].petPhoto === null){
							rev += "<img class='revImg' src='"+ petUserBasic+"'>";										
						} else{
							rev += "<img class='revImg' src='"+ resultRv[i].petPhoto+"'>";					
						};
				
						rev += "<div>";
						rev += "<span class='star'>" + star + "</span>(" + grade + ")<br>";
						rev += "<span>" + resultRv[i].revWriter + " ("+resultRv[i].revDate + ")</span></div>";
						rev += "</div>";
						rev += "<div class='revContent'>" + resultRv[i].revContent + "</div>";
						rev += "</div>";
						
						//답글div
						if(resultRv[i].repContent != null){
							rev += "<div class='reply'>"; 
							rev += "<div>";
							rev += "<span style='font-weight: bold;'>" + resultRv[i].writer + " ("+resultRv[i].repDate + ")</span></div>";
							rev += "<div class='repContent'>" + resultRv[i].repContent + "</div>";
							rev += "</div>";
							
						}
							rev += "<hr>";
						
					}); //each
					
					$("#review-list").html(rev);
					/*$("#review-list").append("<input type='button' id='moreBtn' value='more'>");*/
					
					$("#modalBox").html(rev);
					$("#modalBox").append("<div id='closeBtn'><a>close</a></div>");
					
					/*document.getElementById("moreBtn").addEventListener("click", fnModalOpen);*/
					document.getElementById("closeBtn").addEventListener("click", fnModalClose);

					
				} //if-else
  
				 
				//---------------리뷰 모달창 생성-------------------//
				
				function fnModalOpen(){
					$('#modalBox').show();  
					$('.black_bg').show(); 
					
					document.getElementById("modalBox").scrollIntoView();  
				}; //fnModalOpen
				
				
				function fnModalClose(){
					$('#modalBox').hide();  
					$('.black_bg').hide();  
				}; //fnModalOpen


				//매칭버튼			
				//-------------로그인세션 회원유형 check-----------------//		
				var classify = result.classifySession;
				
				document.getElementById("matchingBtn").addEventListener("click", function (e){					
					if(classify != 1){						
						swal("", "반려인 회원만 이용가능한 서비스입니다.", "warning");
						event.preventDefault();
					} //if	
					
				});


				//================================//
				//           2.프로필 호출
				//================================//
		  		$('.profile').show();
	      
			} //success

	  }) //ajax	
	
	} //fnProfileOn(userNo: 해당회원번호)  
	
	
	function fnProfileOff(){
    	$('.profile').hide();    			
	} //fnProfileOff

	document.getElementById("profileClose").addEventListener("click", fnProfileOff);


	

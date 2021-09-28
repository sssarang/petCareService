<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>
     
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/mypage/sitterProfileManage.css" rel="stylesheet" />
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


		
    </head>
    <body>
    	
        <div class="d-flex" id="wrapper">
            <%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
            <!-- Page content wrapper-->
			<div id="profile_wrapper">
				<div class="navTitle">
                 	<p class="navTitleIn">마이페이지 > 프로필관리</p>
               	</div>
            	<hr class="hhr">
			<!-- page content -->
			<form action="/mypage/sitterProfileModify" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="userNo" value="${userNo}">
                <div id="part1">                	               		
                    <img src="/mypage/link/${userNo}" id="profilePhoto" onerror="this.src='/resources/assets/img/mypage/basicImg.jpg'">    
					<label for="proPhotoUpload" class="btn_proPhoto">사진 변경</label>
					<input type="file" name="proPhotoFile" id="proPhotoUpload">
					<button type="submit" id="btn_save1">저장</button>                                                       	            	            
                </div>
                <div id="part2">
					<label for="introduce"><img src="/resources/assets/img/mypage/comment.png" width="25px">&nbsp;&nbsp;About me</label><br>
                    <textarea name="introduce" class="notes" cols="70" rows="6" maxlength="100" placeholder="&nbsp;자기소개를 적어주세요." id="introduce">${sitterProfile.introduce}</textarea>
                    <button type="submit" id="btn_save2">저장</button>  
                </div>
                  
            </form>
			
                <div id="part3">                	
                    <p class="part_p"><img src="/resources/assets/img/mypage/dogfoot.png" width="25px">&nbsp;가능한 서비스 & 금액&nbsp;<img src="/resources/assets/img/mypage/dogfoot.png" width="25px"></p>
                    <div id="part345_2_1">	
	                	<form action="/mypage/serviceTypeModify" method="POST">
							<input type="hidden" name="userNo" value="${userNo}">
							<br>
	                    	<input type="hidden" name="arrServiceTypeCode" value="11">	                    	
	                        <label for="useYn">돌봄-All day&nbsp;&nbsp;</label>
	                        <input type="radio" name="careAllDay" value="Y">Y
	                        <input type="radio" name="careAllDay" value="N">N 
	                        <label for="price"></label>
	                        <input type="text" name="arrPrice" class="arrPrice" value="${serviceType[0].price}" size=1>&nbsp;원<br><br>
	                        
	                    	<input type="hidden" name="arrServiceTypeCode" value="12">	                    	
	                        <label for="useYn">돌봄-Half day</label>
	                       	<input type="radio" name="careHalfDay" value="Y">Y
	                        <input type="radio" name="careHalfDay" value="N">N
	                        <label for="price"></label>
	                        <input type="text" name="arrPrice" class="arrPrice" value="${serviceType[1].price}" size=1>&nbsp;원<br><br>
	                        
	                        <input type="hidden" name="arrServiceTypeCode" value="13">	                    	
	                        <label for="useYn">방문-All day&nbsp;&nbsp;</label>
	                       	<input type="radio" name="visitAllDay" value="Y">Y
	                        <input type="radio" name="visitAllDay" value="N">N
	                        <label for="price"></label>
	                        <input type="text" name="arrPrice" class="arrPrice" value="${serviceType[2].price}" size=1>&nbsp;원<br><br>
	                        
	                        <input type="hidden" name="arrServiceTypeCode" value="14">	                    	
	                        <label for="useYn">방문-Half day</label>
	                       	<input type="radio" name="visitHalfDay" value="Y">Y
	                        <input type="radio" name="visitHalfDay" value="N">N
	                        <label for="price"></label>
	                        <input type="text" name="arrPrice" class="arrPrice" value="${serviceType[3].price}" size=1>&nbsp;원<br><br>
	                        
	                        <button type="submit" id="btn_save3">저장</button> 
                    	</form>                    	        					                                              						                   
                    </div>	            	        
                </div>
             
            
            
                <div id="part4">
                    <p class="part_p"><img src="/resources/assets/img/mypage/dogfoot.png" width="25px">&nbsp;가능한 스킬&nbsp;<img src="/resources/assets/img/mypage/dogfoot.png" width="25px"></p>
                    <div id="part345_2_2">
                        <form action="/mypage/skillTypeModify" method="POST">
                            <input type="hidden" name="userNo" value="${userNo}">
							<br>
	                    	<input type="hidden" name="arrSkillTypeCode" value="21">	                    	
	                        <label for="useYn">약먹이기 가능여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	                        <input type="radio" name="takingMedicine" value="Y">Y
	                        <input type="radio" name="takingMedicine" value="N">N 
	                        <br><br> 
	                    	<input type="hidden" name="arrSkillTypeCode" value="22">	                    	
	                        <label for="useYn">노령펫 경험여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	                       	<input type="radio" name="oldPetExperience" value="Y">Y
	                        <input type="radio" name="oldPetExperience" value="N">N
	                        <br><br> 
	                        <input type="hidden" name="arrSkillTypeCode" value="23">	                    	
	                        <label for="useYn">환견/환묘 경험여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	                       	<input type="radio" name="sickPetExperience" value="Y">Y
	                        <input type="radio" name="sickPetExperience" value="N">N
	                        <br><br> 
	                        <input type="hidden" name="arrSkillTypeCode" value="24">	                    	
	                        <label for="useYn">애견관련 업종 경험유무</label>
	                       	<input type="radio" name="petJobExperience" value="Y">Y
	                        <input type="radio" name="petJobExperience" value="N">N
							<br>  
	                        
	                        <button type="submit" id="btn_save4">저장</button>                                 
                        </form>
                    </div>
                </div>
                <div id="part5">
                    <p class="part_p"><img src="/resources/assets/img/mypage/dogfoot.png" width="25px">&nbsp;가능한 반려동물&nbsp;<img src="/resources/assets/img/mypage/dogfoot.png" width="25px"></p>
                    <div id="part345_2_3">
                        <form action="/mypage/petTypeModify" method="POST">
                            <input type="hidden" name="userNo" value="${userNo}">
							<br> 
	                    	<input type="hidden" name="arrPetTypeCode" value="1">	                    	
	                        <label for="useYn">대형견&nbsp;&nbsp;</label>
	                        <input type="radio" name="bigDog" value="Y">Y
	                        <input type="radio" name="bigDog" value="N">N 
	                        <br><br> 
	                    	<input type="hidden" name="arrPetTypeCode" value="2">	                    	
	                        <label for="useYn">중형견&nbsp;&nbsp;</label>
	                       	<input type="radio" name="middleDog" value="Y">Y
	                        <input type="radio" name="middleDog" value="N">N
	                        <br><br>  
	                        <input type="hidden" name="arrPetTypeCode" value="3">	                    	
	                        <label for="useYn">소형견&nbsp;&nbsp;</label>
	                       	<input type="radio" name="smallDog" value="Y">Y
	                        <input type="radio" name="smallDog" value="N">N
	                        <br><br>
	                        <input type="hidden" name="arrPetTypeCode" value="4">	                    	
	                        <label for="useYn">고양이&nbsp;&nbsp;</label>
	                       	<input type="radio" name="cat" value="Y">Y
	                        <input type="radio" name="cat" value="N">N
							<br>  
	                        
	                        <button type="submit" id="btn_save5">저장</button>                                 
                        </form>
                    </div>
                </div>
                <div id="part6">
                    <div id="part6_2">
                    	<form action="/mypage/serviceDateModify" method="POST">						
							<table id="calendar"></table>
							<input type="hidden" id="serviceMonYear" name ="serviceYM">
							<button type="submit" id="btn_save6">저장</button>
						</form>
                    </div>
                </div>
                <div id="part7">
				    <p class="part_p">활동사진등록</p>
				    <span style="font-size:13px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
					<form name="dataForm" id="dataForm" onsubmit="return registerAction()">
						<button id="btn-upload" type="button">파일 추가</button>
						<input id="input_file" multiple="multiple" type="file" >
						
						<div class="data_file_txt" id="data_file_txt">
							<br>
							<div id="articlefileChange">
							</div>
						</div>
						<button type="submit" id="btn_save7">저장</button>
					</form> 
                    
                </div>
			</div>
           
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
        
     	// 파일 고유넘버
	    var fileNum = 0;
	    // 첨부파일 배열
	    var content_files = new Array()
	
        $(function(){
        	
        	$('input:radio[name="careAllDay"][value="${serviceType[0].useYn}"]').prop('checked', true);
        	$('input:radio[name="careHalfDay"][value="${serviceType[1].useYn}"]').prop('checked', true);
        	$('input:radio[name="visitAllDay"][value="${serviceType[2].useYn}"]').prop('checked', true);
        	$('input:radio[name="visitHalfDay"][value="${serviceType[3].useYn}"]').prop('checked', true);
        	
			$('input:radio[name="takingMedicine"][value="${petsitterSkillList[0].useYn}"]').prop('checked', true);
        	$('input:radio[name="oldPetExperience"][value="${petsitterSkillList[1].useYn}"]').prop('checked', true);
        	$('input:radio[name="sickPetExperience"][value="${petsitterSkillList[2].useYn}"]').prop('checked', true);
        	$('input:radio[name="petJobExperience"][value="${petsitterSkillList[3].useYn}"]').prop('checked', true);	
            		
			$('input:radio[name="bigDog"][value="${servicePetkindsList[0].useYn}"]').prop('checked', true);
        	$('input:radio[name="middleDog"][value="${servicePetkindsList[1].useYn}"]').prop('checked', true);
        	$('input:radio[name="smallDog"][value="${servicePetkindsList[2].useYn}"]').prop('checked', true);
        	$('input:radio[name="cat"][value="${servicePetkindsList[3].useYn}"]').prop('checked', true);
			
        	
        	//서비스 가능한 날짜 체크(DB 바탕으로)
        	<c:forEach items="${serviceCalendar}" var="item">
				$("input[type='checkbox'][name='serviceDateList'][value='${item.serviceDate}']").attr("checked", true);        
			</c:forEach>
            
        	
        	// 프로필 사진 미리보기
        	$(document).on("change", "input[name=proPhotoFile]", function(e){
        		   var $file = $(this);
        		   var $preview = $("#part1 img");
        		   
        		   var reader = new FileReader();
        		   reader.onload = function(e) {
        		      $preview.attr("src", e.target.result);
        		   };
        		   
        		   $preview[0].onerror = function() {
        		      $file.val(null);
        		      $preview.attr("src", "https://lh3.googleusercontent.com/proxy/R-A1fKbE6rbSnQSnECvrSghtWMBJTn6nvyGr1Chn4fqSbL_f2R5rfYhQ3oRSTZIELNtOpowx48OPDuVzhwDjIDyE7W_MYyWknX8");
        		   };
        		   
        		   reader.readAsDataURL($file[0].files[0]);
        		});
        	
        	
        	
        	// 버튼	
            $('#btn_save3').click(function(e) {
            	
            	if( $('[value="${serviceType[3].price}"]').val() == '0' ||
            		$('[value="${serviceType[2].price}"]').val() == '0' ||
            		$('[value="${serviceType[1].price}"]').val() == '0' || 
            		$('[value="${serviceType[0].price}"]').val() == '0' 
            	){
	        		e.preventDefault();
	                swal({
	                	title : '비용을 적어주세요!',
	                	icon : 'warning'
	                	})					                	
	                	                	
	        			$('.swal-button').click(function() {
	        				location.href="/mypage/sitterProfileManage";
	        				})	
            		}
            		
             }) // click
             
             //활동사진첨부파일확인
   	    	 // input file 파일 첨부시 fileCheck 함수 실행
 	    	 $("#input_file").on("change", fileCheck);
        	
 	         $('#btn-upload').click(function (e) {
 	            e.preventDefault();
 	            $('#input_file').click();
 	         });
 	         
 	         
 	         // 사진목록출력
 	         
 	        <c:forEach items="${activityPhotoList}" var="item">
 	       	fileNum = ${item.photoNo};
 	        content_files.push(fileNum);
        	$('#articlefileChange').append(
        			'<div id="file${item.photoNo}" onclick="fileDelete(\'file' + ${item.photoNo} + '\')">'
	           		+ '<input type="hidden" name="photoNoList" value="${item.photoNo}">'
	           		+ '<font style="font-size:15px">${item.fileName}</font>'  
	           		+ '<img src="/resources/assets/img/mypage/del.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
	           		+ '</p><div/>'
	           );
			</c:forEach>
			fileNum = fileNum+1;             
         

       	})	// jq
		
       	//////////////////////////////////////////////////////////////////////////////////

		function fnZeros(n, digits) {
		  var zero = '';
		  n = n.toString();
		
		  if (n.length < digits) {
		    for (var i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		} //fnZeros(n: 타겟/ digits: 자리수)       	
		
       	//----------------서비스일정달력준비-------------------//

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
        scTable += "<td> </td>";
        scTable += "<td> <input id='calPre' type = 'button' value = '◀'/> </td>";
        scTable += "<td id='YM' colspan='3' style='padding: 0; width: 43%;''>year-month</td>";
        scTable += "<td> <input id='calNext' type = 'button' value = '▶'/> </td>";
        scTable += "<br>";
        scTable += "<td> </td>";
        scTable += "</tr></thead>";
        scTable += "<tbody><tr id='day7'>";
        scTable += "<td>일</td> <td>월</td> <td>화</td> <td>수</td> <td>목</td> <td>금</td> <td>토</td>";
        scTable += "</tr></tbody>";

        $("#calendar").html(scTable);

        document.getElementById("YM").innerHTML = YM;
        document.getElementById("calPre").addEventListener("click", function before_month() {
        	console.log('before_month invoked.');
        	
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
        	} //if-else
        	
        }); //before_month

        document.getElementById("calNext").addEventListener("click", function next_month() {
        	console.log('next_month invoked.');
        	
            if(month === maxDate.getMonth()){
        		swal("", "날짜지정은 3개월 내에서 가능합니다", "warning");
        		
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
        	} //if-else	
        	
        }); //next_month		

        fnMakecalender();
        
       	
       	function fnMakecalender(){
	    	
			calendar = document.getElementById("calendar");
	        row = calendar.insertRow();
	      	
	        //년-월
        	var frontDate = year+"-"+fnZeros((month+1), 2);	        
	        //document.getElementById("serviceYearMonth");
	        $("#serviceMonYear").val(frontDate);
	        
	        
	        for(i = 0; i < first_day; i++){
	            cell = row.insertCell();
	        } //for
	
	        for(i = 1; i <= last_date; i++){

	        	//저장할 날짜
	        	var dateVal = year+"-"+fnZeros((month+1), 2)+"-"+fnZeros(i, 2);
	        	
	        	
	            if(first_day < 7){
	                //셀추가
	                cell = row.insertCell();
	                
	                //모든 셀에 id를 부여함
	                cell.setAttribute('id', [i]);
	                
	                //추가된 셀에 i값 입력
	             
	                var addTag ='<div class="btn-date"><input class="btn-date" id="cal'+i+'" type="checkbox" name="serviceDateList" value="'+dateVal+'"><label for="cal'+i+'">'+i+'</label></div>';
	                cell.innerHTML = addTag;
	                
	                first_day += 1;
	            } else{
	                //행추가
	                row = calendar.insertRow();
	
	                cell = row.insertCell();
	                cell.setAttribute('id', [i]); 
					
	                var addTag ='<div class="btn-date"><input class="btn-date" id="cal'+i+'" type="checkbox" name="serviceDateList" value="'+dateVal+'"><label for="cal'+i+'">'+i+'</label></div>';
	                cell.innerHTML = addTag;
	
	                first_day = first_day - 6;
	                //6을 빼는 이유는 매번 7에서 else문으로 넘어오고, if문이 6번만 하면 되기때문이다.
	                //7을 빼버리면 0부터 시작해서 if문이 7번 실행되고 else로 넘어오므로 -6을한다.
	            } //if-else
	        } //for
	        
        	<c:forEach items="${serviceCalendar}" var="item">
				$("input[type='checkbox'][name='serviceDateList'][value='${item.serviceDate}']").attr("checked", true);        
			</c:forEach>
	        
	    } //fnMakecalender

       	//----------------활동사진 파일업로드-------------------//
		
	    // 파일 현재 필드 숫자 totalCount랑 비교값
	    var fileCount = 0;
	    
	    // 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
	    var totalCount = 10;
	  
	    function fileCheck(e) {
	        var files = e.target.files;
	        var filesArr = Array.prototype.slice.call(files); //파일 배열 담기
	        
	        // 파일 개수 확인 및 제한
	        if (fileCount + filesArr.length > totalCount) {
				swal("", '파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.', "warning");

	          return;
	        } else {
	        	 fileCount = fileCount + filesArr.length;
	        } //if-else
			
	        // 각각의 파일 배열담기 및 기타
	        filesArr.forEach(function (f) {
	          var reader = new FileReader();
	          
	          reader.onload = function (e) {
				content_files.push(f);
	            $('#articlefileChange').append(
	           		'<div id="file' + (fileNum) + '" onclick="fileDelete(\'file' + (fileNum) + '\')">'
	           		+ '<input type="hidden" name="photoNoList" value='+(fileNum)+'>'
	           		+ '<font style="font-size:15px">' + f.name + '</font>'  
	           		+ '<img src="/resources/assets/img/mypage/del.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
	           		+ '</p><div/>'
	    		);
	            fileNum++;
	            
	          };
	          reader.readAsDataURL(f);
	        });
	        
	        //초기화 한다.
	        $("#input_file").val("");
	      } //fileCheck

	     // 파일 부분 삭제 함수
	     function fileDelete(num){
	    	console.log("fileNum : "+num);
	        var no = num.replace(/[^0-9]/g, "")-1;	//배열 0부터 시작 이므로 -1
	        console.log("no : "+no);
	        console.log(content_files);
	        if(typeof content_files[no] != "number"){
	        	content_files[no].is_delete = true;	
	        }
	    	$('#' + num).remove();
	    	fileCount--;
	     } //fileDelete

	     
		 //파일 등록
    	 function registerAction(){
    	 	
    	 var form = $("#dataForm")[0];        
     	 var formData = new FormData(form);
     	 console.log(formData);
    		for (var x = 0; x < content_files.length; x++) {
    			// 삭제 안한것만 담아 준다. 
    			if(!content_files[x].is_delete){
    				 formData.append("article_file", content_files[x]);
    			} //if
    		} //for
    		console.log(formData);
			//파일업로드 multiple ajax처리   
	    	$.ajax({
	       	      type: "POST",
	       	   	  enctype: "multipart/form-data",
	       	      url: "/mypage/fileUpload",
	           	  data : formData,
	           	  processData: false,
	       	      contentType: false,
	       	      success: function (data) {
	       	    	swal("파일업로드 성공!");
	       	      },
	       	      error: function (xhr, status, error) {
	       	    	swal("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
	       	     return false;
	       	      }
	       	    });
	       	    return false;
	    	}	    
		</script>
    </body>
</html>
  
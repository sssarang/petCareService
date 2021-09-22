<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
			<form action="/mypage/sitterProfileModify" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="userNo" value="${userNo}">
                <div id="part1">                	               		
                    <img src="${sitterProfile.proPhoto}" id="profilePhoto" width="300x" height="250px " onerror="this.src='/resources/assets/img/mypage/petsitter.jpg'">    
                    <!-- <label for="proPhotoUpload">사진 변경</label> -->
                    <input type="file" name="proPhotoFile"> <!-- id="proPhotoUpload" -->  
                    <button type="submit" id="btn_save12">저장</button>                 	            	            
                </div>
                <div id="part2">
					<label for="introduce">자기소개</label>
                    <textarea name="introduce" cols="60" rows="10" maxlength="50" placeholder="자개소개!">${sitterProfile.introduce}</textarea>
                    <button type="submit" id="btn_save12">저장</button>  
                </div>
                  
            </form>
			
                <div id="part3">                	
                    <p class="part_p">가능한 서비스 & 금액</p>
                    <div class="part345_2">	
	                	<form action="/mypage/serviceTypeModify" method="POST">
							<input type="hidden" name="userNo" value="${userNo}">
							
	                    	<input type="hidden" name="arrServiceTypeCode" value="11">	                    	
	                        <label for="useYn">돌봄-All day</label>
	                        <input type="radio" name="careAllDay" value="Y">Y
	                        <input type="radio" name="careAllDay" value="N">N 
	                        <label for="price"></label>
	                        <input type="text" name="arrPrice" value="${serviceType[0].price}" size=2>&nbsp;원 
	                        
	                    	<input type="hidden" name="arrServiceTypeCode" value="12">	                    	
	                        <label for="useYn">돌봄-Half day</label>
	                       	<input type="radio" name="careHalfDay" value="Y">Y
	                        <input type="radio" name="careHalfDay" value="N">N
	                        <label for="price"></label>
	                        <input type="text" name="arrPrice" value="${serviceType[1].price}" size=2>&nbsp;원
	                        
	                        <input type="hidden" name="arrServiceTypeCode" value="13">	                    	
	                        <label for="useYn">방문-All day</label>
	                       	<input type="radio" name="visitAllDay" value="Y">Y
	                        <input type="radio" name="visitAllDay" value="N">N
	                        <label for="price"></label>
	                        <input type="text" name="arrPrice" value="${serviceType[2].price}" size=2>&nbsp;원
	                        
	                        <input type="hidden" name="arrServiceTypeCode" value="14">	                    	
	                        <label for="useYn">방문-Half day</label>
	                       	<input type="radio" name="visitHalfDay" value="Y">Y
	                        <input type="radio" name="visitHalfDay" value="N">N
	                        <label for="price"></label>
	                        <input type="text" name="arrPrice" value="${serviceType[3].price}" size=2>&nbsp;원  
	                        
	                        <button type="submit" id="btn_save3">저장</button> 
                    	</form>                    	        					                                              						                   
                    </div>	            	        
                </div>
             
            
            
                <div id="part4">
                    <p class="part_p">가능한 스킬</p>
                    <div class="part345_2">
                        <form action="/mypage/skillTypeModify" method="POST">
                            <input type="hidden" name="userNo" value="${userNo}">

	                    	<input type="hidden" name="arrSkillTypeCode" value="21">	                    	
	                        <label for="useYn">약먹이기 가능여부</label>
	                        <input type="radio" name="takingMedicine" value="Y">Y
	                        <input type="radio" name="takingMedicine" value="N">N 
	                        <br> 
	                    	<input type="hidden" name="arrSkillTypeCode" value="22">	                    	
	                        <label for="useYn">노령펫 경험여부</label>
	                       	<input type="radio" name="oldPetExperience" value="Y">Y
	                        <input type="radio" name="oldPetExperience" value="N">N
	                        <br> 
	                        <input type="hidden" name="arrSkillTypeCode" value="23">	                    	
	                        <label for="useYn">환견/환묘 경험여부</label>
	                       	<input type="radio" name="sickPetExperience" value="Y">Y
	                        <input type="radio" name="sickPetExperience" value="N">N
	                        <br> 
	                        <input type="hidden" name="arrSkillTypeCode" value="24">	                    	
	                        <label for="useYn">애견관련 업종 경험유무</label>
	                       	<input type="radio" name="petJobExperience" value="Y">Y
	                        <input type="radio" name="petJobExperience" value="N">N
							<br>  
	                        
	                        <button type="submit" id="btn_save3">저장</button>                                 
                        </form>
                    </div>
                </div>
                <div id="part5">
                    <p class="part_p">가능한 반려동물</p>
                    <div class="part345_2">
                        <form action="/mypage/petTypeModify" method="POST">
                            <input type="hidden" name="userNo" value="${userNo}">

	                    	<input type="hidden" name="arrPetTypeCode" value="1">	                    	
	                        <label for="useYn">대형견</label>
	                        <input type="radio" name="bigDog" value="Y">Y
	                        <input type="radio" name="bigDog" value="N">N 
	                        <br> 
	                    	<input type="hidden" name="arrPetTypeCode" value="2">	                    	
	                        <label for="useYn">중형견</label>
	                       	<input type="radio" name="middleDog" value="Y">Y
	                        <input type="radio" name="middleDog" value="N">N
	                        <br> 
	                        <input type="hidden" name="arrPetTypeCode" value="3">	                    	
	                        <label for="useYn">소형견</label>
	                       	<input type="radio" name="smallDog" value="Y">Y
	                        <input type="radio" name="smallDog" value="N">N
	                        <br> 
	                        <input type="hidden" name="arrPetTypeCode" value="4">	                    	
	                        <label for="useYn">고양이</label>
	                       	<input type="radio" name="cat" value="Y">Y
	                        <input type="radio" name="cat" value="N">N
							<br>  
	                        
	                        <button type="submit" id="btn_save3">저장</button>                                 
                        </form>
                    </div>
                </div>
                <div id="part6">
                    <p class="part_p">가능한 날짜</p>
                    <div id="part6_2">
                    	<form action="/mypage/sitterProfileManage" method="POST">
							&nbsp;<input type="text" class="selector" placeholder="날짜를 선택하세요." name="serviceCalendar"/>
							<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
							
							<script type="text/javascript">
							$(".selector").flatpickr({ 
							dateFormat: "Y-m-d",
							minDate:"today",
							maxDate: new Date().fp_incr(30)
							});
							</script>
							<input type="submit" value="저장" id="part6_Btn">
						</form>
                    </div>
                </div>
                <div id="part7">
   					활동사진
                    
                </div>
			</div>
            
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/mypage/sideBarScripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        <script>
        $(function(){
        	
        	$('input:radio[name="careAllDay"][value="${serviceType[0].useYn}"]').prop('checked', true);
        	$('input:radio[name="careHalfDay"][value="${serviceType[1].useYn}"]').prop('checked', true);
        	$('input:radio[name="visitAllDay"][value="${serviceType[2].useYn}"]').prop('checked', true);
        	$('input:radio[name="visitHalfDay"][value="${serviceType[3].useYn}"]').prop('checked', true);
        	
			$('input:radio[name="takingMedicine"][value="${skillType[0].useYn}"]').prop('checked', true);
        	$('input:radio[name="oldPetExperience"][value="${skillType[1].useYn}"]').prop('checked', true);
        	$('input:radio[name="sickPetExperience"][value="${skillType[2].useYn}"]').prop('checked', true);
        	$('input:radio[name="petJobExperience"][value="${skillType[3].useYn}"]').prop('checked', true);	
            		
			$('input:radio[name="bigDog"][value="${petType[0].useYn}"]').prop('checked', true);
        	$('input:radio[name="middleDog"][value="${petType[1].useYn}"]').prop('checked', true);
        	$('input:radio[name="smallDog"][value="${petType[2].useYn}"]').prop('checked', true);
        	$('input:radio[name="cat"][value="${petType[3].useYn}"]').prop('checked', true);

        	
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
        	
        	
        })	// jq
		
		
		</script>
    </body>
</html>
  
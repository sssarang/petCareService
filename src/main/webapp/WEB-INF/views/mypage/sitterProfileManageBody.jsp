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
			<div id="part0">
			<h1 id="sitterProfile_head">프로필 관리</h1>
			</div>
			<form action="/mypage/sitterProfileModify" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="userNo" value="${userNo}">
                <div id="part1">  
                	<p id="profile_p">프로필 사진&nbsp;&sung;</p>              	               		
                    <img src="/mypage/link/${userNo}" id="profilePhoto" width="350x" height="300px" onerror="this.src='/resources/assets/img/mypage/basicImg.jpg'">    
					<label for="proPhotoUpload" class="btn_proPhoto">사진 변경</label>
					<input type="file" name="proPhotoFile" id="proPhotoUpload">
					<button type="submit" id="btn_save1">저장</button>                                                       	            	            
                </div>
                <div id="part2">
					<label for="introduce">About me&nbsp;&sung;</label><br>
                    <textarea name="introduce" cols="70" rows="8" maxlength="50" placeholder="&nbsp;자기소개를 적어주세요." id="introduce">${sitterProfile.introduce}</textarea>
                    <button type="submit" id="btn_save2">저장</button>  
                </div>
                  
            </form>
			
                <div id="part3">                	
                    <p class="part_p">가능한 서비스 & 금액&nbsp;&sung;</p>
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
                    <p class="part_p">가능한 스킬&nbsp;&sung;</p>
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
                    <p class="part_p">가능한 반려동물&nbsp;&sung;</p>
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
                    <p class="part_p">가능한 날짜&nbsp;&sung;</p>
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
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
            	
            	if( $('[value="${serviceType[0].price}"]').val() == '0' ||
            		$('[value="${serviceType[1].price}"]').val() == '0' ||
            		$('[value="${serviceType[2].price}"]').val() == '0' || 
            		$('[value="${serviceType[3].price}"]').val() == '0' 
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
    		
            
        	
        	
        })	// jq
		
		
		</script>
    </body>
</html>
  
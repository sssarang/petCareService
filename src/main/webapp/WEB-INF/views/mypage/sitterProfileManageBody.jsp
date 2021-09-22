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
	                    	<input type="hidden" name="serviceTypeCode" value="11">	                    	
	                        <label for="useYn">돌봄-All day</label>
	                        <input type="radio" name="useYn" value="Y">Y
	                        <input type="radio" name="useYn" value="N">N
	                        <label for="price"></label>
	                        <input type="text" name="price" value="${serviceType.price}" size=2>&nbsp;원
	                        
	                    	<input type="hidden" name="serviceTypeCode" value="12">	                    	
	                        <label for="useYn">돌봄-Half day</label>
	                        <input type="radio" name="useYn" value="Y">Y
	                        <input type="radio" name="useYn" value="N">N
	                        <label for="price"></label>
	                        <input type="text" name="price" value="${serviceType.price}" size=2>&nbsp;원  
	                        <button type="submit" id="btn_save3">저장</button> 
                    	</form>                    	        					                                              						                   
                    </div>	            	        
                </div>
             
            
            
                <div id="part4">
                    <p class="part_p">가능한 스킬</p>
                    <div class="part345_2">
                        <br> 
                        <c:forEach items="${petsitterSkillList}" var="i">
                            <input type="text" value="${i.codeName}" style="border:none" readonly>
                            <input type="checkbox" name="useYn2" value="${i.useYn}"><br><br>
                            
                        </c:forEach>
                        <button type="button" class="btn btn-primary btn-save2" data-dismiss="modal">저장</button>
                    </div>
                </div>
                <div id="part5">
                    <p class="part_p">가능한 반려동물</p>
                    <div class="part345_2">
                        <br> 
                        <c:forEach items="${servicePetkindsList}" var="i">
                            <input type="text" value="${i.codeName}" style="border:none" size=3 readonly>
                            <input type="checkbox" name="useYn3" value="${i.useYn}"><br><br>
                            
                        </c:forEach>
                        <button type="button" class="btn btn-primary btn-save3" data-dismiss="modal">저장</button>
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
        	
        	$('input:radio[name="useYn"][value="${serviceType.useYn}"]').prop('checked', true);
    		//$("input[type='checkbox'][name='useYn1'][value='Y']").attr("checked", true);
    		//$("input[type='checkbox'][name='useYn2'][value='Y']").attr("checked", true);
    		//$("input[type='checkbox'][name='useYn3'][value='Y']").attr("checked", true);
           
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
        	
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
  
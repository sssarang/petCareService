<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/mypage/sitterResvManage.css" rel="stylesheet" />
        <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
		<script type="text/javascript"></script>

    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
            <!-- Page content wrapper-->
            <div id="resv_wrapper">
                <br>
                <h1>&nbsp;&nbsp;- 서비스 요청 내역 -</h1>
                <br>
                <br>
                <c:forEach items="${resv}" var="i">
                	<br>		
                    <div id="resv_list">
                        <p>예약등록일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${i.regDate}" /></p>

                        <div id="resvImage">
                            <img src="${i.proPhoto}" id="proPhoto">
                        </div>
                        <div id="resvInformation">
                            <ul id="resvInformationUl">
                                <li>반려인 닉네임 : ${i.userNickname}</li>
                                <li>반려인 연락처 : ${i.userContact}</li>
                                <li>제공 서비스 유형 : ${i.codeName}</li> 
                                <li>금액 : ${i.price}원</li>
                                <li>서비스 시작일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${i.startDate}" /></li>
                                <li>서비스 종료일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${i.endDate}" /></li>                                                                                            
							</ul>
							<input type="hidden" name="serviceId" value="${i.serviceId}">
							<input type="hidden" name="codeName2" value="${i.codeName2}">
                            <input type="hidden" name="petName" value="${i.petName}">
                            <c:set var="now" value="<%=new java.util.Date()%>" />
                            <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
                            <c:set var="birthday"><fmt:formatDate value="${i.petBirthday}" pattern="yyyy" /></c:set>													
                            <!-- 계산한나이-->
                            <c:set var="age" value="${sysYear-birthday+1}" />
                            <input type="hidden" name="petBirthday" value="${age}">
                            <input type="hidden" name="petGender" value="${i.petGender}">
                            <input type="hidden" name="neutralization" value="${i.neutralization}">
                            <input type="hidden" name="medicine" value="${i.medicine}">
                            <input type="hidden" name="specialNote" value="${i.specialNote}">  
                            <!-- Button to Open the Modal -->
                            <button type="button" class="btn btn-primary btn-modal" id="resvModalBtn" data-toggle="modal" data-target="#modal">더보기</button>
                            <!-- The Modal -->
                            <div class="modal" id="modal">
        
                                <div class="modal-dialog">
                                    <div class="modal-content">
        
                                        <!-- Modal Header -->
        								상세정보!
                                        <!-- Modal body -->
                                        <div class="modal-body"> 
                                        	<input type="text" value="서비스번호" style="border:none" size=3><input type="text" id="serviceId" name="serviceIdNo" readonly><br>  
                                        	<input type="text" value="종류" style="border:none" size=3><input type="text" id="codeName2" readonly><br>  
                                        	<input type="text" value="펫이름" style="border:none" size=3><input type="text" id="petName" readonly><br> 
                                        	<input type="text" value="나이" style="border:none" size=3><input type="text" id="petBirthday" readonly><br> 
                                        	<input type="text" value="성별" style="border:none" size=3><input type="text" id="petGender" readonly><br> 
                                        	<input type="text" value="중성화" style="border:none" size=3><input type="text" id="neutralization" readonly><br> 
                                        	<input type="text" value="약복용" style="border:none" size=3><input type="text" id="medicine" readonly><br> 
                                        	<input type="text" value="특이사항" style="border:none" size=3><input type="text" id="specialNote" readonly><br>                                    	
                                
                                            <button type="button" class="btn btn-primary btn-approve" id="btn-approve" data-dismiss="modal">승인</button>
                                            <button type="button" class="btn btn-primary btn-refusal" id="btn-refusal" data-dismiss="modal">거절</button>                                                                                            
                                        </div>
        								
                                        <!-- Modal footer -->
										
                                    </div>
                                </div>
                            </div>                            
                        </div>

                    </div>
                </c:forEach>

            </div>
		</div>   
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/mypage/sideBarScripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
        <script>
  	    $(function() {      		      
    		
    		$(".btn-modal").click(function() {
    			var serviceId = $(this).parent().find('input[name="serviceId"]').val();
    			console.log(serviceId);
                var codeName2 = $(this).parent().find('input[name="codeName2"]').val();	                 
                console.log(codeName2);
                var petName = $(this).parent().find('input[name="petName"]').val();	 
                console.log(petName);
                var petBirthday = $(this).parent().find('input[name="petBirthday"]').val();	
                console.log(petBirthday);
                var petGender = $(this).parent().find('input[name="petGender"]').val();	
                console.log(petGender);
                var neutralization = $(this).parent().find('input[name="neutralization"]').val();
                console.log(neutralization);
                var medicine = $(this).parent().find('input[name="medicine"]').val(); 
                console.log(medicine);
                var specialNote = $(this).parent().find('input[name="specialNote"]').val();		
                console.log(specialNote);
                $('#serviceId').val(serviceId);
                $('#codeName2').val(codeName2);
                $('#petName').val(petName);
                $('#petBirthday').val(petBirthday); 
                $('#petGender').val(petGender); 
                $('#neutralization').val(neutralization);
                $('#medicine').val(medicine);
                $('#specialNote').val(specialNote); 
       		})	// click 
       		
            $('.btn-approve').click(function(){
    			
                var serviceId = $(this).parent().find('input[name="serviceIdNo"]').val();
                console.log(serviceId);	
                
                    $.ajax({
                        url: "/mypage/resvApprove",
                        method: "POST",
                        data: {
                            serviceId : serviceId
                        },
                        success: function(data){
                            console.log('success');
                            location.reload();
                        }
                    })	// ajax
                })	// click

            $('.btn-refusal').click(function(){
            
	            var serviceId = $(this).parent().find('input[name="serviceIdNo"]').val();
	            console.log(serviceId);	
	            
	                $.ajax({
	                    url: "/mypage/resvRefusal",
	                    method: "POST",
	                    data: {
	                        serviceId : serviceId
	                    },
	                    success: function(data){
	                        console.log('success');
	                        location.reload();
	                    }
                	})	// ajax
            	})	// click 
            	
  	    	}) // function

                   
        </script>

    </body>
</html>
  
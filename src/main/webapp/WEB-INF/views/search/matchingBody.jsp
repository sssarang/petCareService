<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- Core theme CSS (includes Bootstrap)-->
 <link href="/resources/css/search/matching.css" rel="stylesheet" />
 <!-- jstl -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 
 <%@ page import="com.bitcamp.petcare.matching.domain.MatchingVO" %>
 

<section class="layout bg-body">
    <div class="container">
        <div class="content bg-white">
            <h2 class="text-center">Contact Sitter</h2>
            
            <form action="/search/booking" method="POST" name="booking" onsubmit="return check();">
            	
            	<!-- DTO에 넣어야 하는 추가적인 값들 -->
            	<input type="hidden" name="petUserNo" value="${matching.userNo}">
            	<input type="hidden" name="regUserNo" value="${matching.userNo}">
            	<input type="hidden" name="petSitterNo" value="">
            	<input type="hidden" name="totalAmount" value="">
            	
            	
            	<div class="wrap pt-5">
            		 <div class="form-item">
                    	<p>※ 예약페이지에서는 정보확인만 가능합니다. 수정은 마이페이지에서 해주세요.</p>
                    </div>
                    
                    <div class="form-item pb-3">
                        <label for="nickname">닉네임</label>&nbsp;&nbsp;
                        <input type="text" id="nickname" placeholder="${matching.userNickname}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="contact">연락처</label>&nbsp;&nbsp;
                        <input type="text" id="contact" placeholder="${matching.userContact}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="address">주&nbsp;&nbsp;&nbsp;&nbsp; 소</label>&nbsp;&nbsp;
                        <input type="text" id="address" placeholder="${matching.userAddress}" readonly>
                    </div>
                </div>  
                
                <div class="wrap pt-3">
                    <p class="hr-sect pb-3">반려동물 정보</p>
                    
                    <div class="form-item pb-3 text-center d-inline-block">
                    	<!-- 프로필 이미지 유무에 따라 이미지 출력 -->
                    	<c:choose>
                    		<c:when test='${(matching.proPhoto == null)}'>
                    			<img class="img-fluid rounded-circle img-thumbnail" src="/resources/assets/img/search/petsitter.jpg"/>
                    		</c:when>
                    		
                    		<c:when test='${(matching.proPhoto != null)}'>
                    			<img class="img-fluid rounded-circle img-thumbnail" src="${matching.proPhoto}"/>
                    		</c:when>
                    	</c:choose>
				        
                        <div class="pt-2 pb-2">${matching.petName}</div>
                    </div>
                    <div class="form-item pb-3">
                        <label for="petType">반려동물 유형</label>
                        <input type="text" id="petType" placeholder="${matching.codeName}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="patAge">나이</label>
                        <input type="text" id="patAge" placeholder="${matching.petBirthday}" readonly>
                    </div>
                    <div class="form-item">
                        <label for="petGender">성별</label>
                        <input type="text" id="petGender" placeholder="${matching.petGender}" readonly>
                    </div>
                    <div class="form-item">
                    	<label></label>
                    	<p>(암컷-F &nbsp;&nbsp;수컷-M)</p>
                    </div>
                    
                    <div class="form-item">
                        <label for="isNeutralization">중성화 여부</label>
                        <input type="text" id="isNeutralization" placeholder="${matching.neutralization}" readonly>
                    </div>
                    <div class="form-item">
                    	<label></label>
                    	<p>(예-Y &nbsp;&nbsp;아니요-N)</p>
                    </div>
                    
                    <div class="form-item">
                        <label for="isMedicine">약 복용</label>
                        <input type="text" id="isMedicine" placeholder="${matching.medicine}" readonly>
                    </div>
                    <div class="form-item">
                    	<label></label>
                    	<p>(예-Y &nbsp;&nbsp;아니요-N)</p>
                    </div>
                    
                    <div class="form-item pb-3">
                        <label for="specialNote">특이사항</label>
                        <textarea id="specialNote" rows="10" cols="62" placeholder="${matching.specialNote}" readonly ></textarea>
                    </div>
                </div>  
                
                <div class="wrap pt-3">
                    <p class="hr-sect pb-3">상세 조건을 선택해 주세요.</p>
                    
                    <div class="form-item pb-3">
	                    <label for="address">Service Type</label>&nbsp;&nbsp;
	                    <select id="serviceType" name="serviceTypeCode" class="form-select" aria-label="Default select example">
	                        <option selected>서비스 선택</option>
	                    </select>
	                </div>
	                
	                <div class="form-item pb-3">
	                    <label for="address">Service Date</label>&nbsp;&nbsp;
	                    <div class="d-inline">
	                        <input class="flatpickr selector" id = "firstRangeInput" data-id="rangePlugin" type="text" placeholder="Start date" name="startDate" readonly="readonly">
	                    </div>
	                    &nbsp;~&nbsp;
	                    <div class="d-inline">
	                        <input class="flatpickr selector" id="secondRangeInput" type="text" placeholder="End date" name="endDate" readonly="readonly">
	                    </div>
	                </div>
                
                    
                    <div class="pt-3">
                        <!-- Button to Open the Modal -->
                        <input type="submit" id="regBtn" value="예약" >
                       <!-- <input type="submit" value="예약" id="regBtn" data-toggle="modal" data-target="#modal"> -->
                        <span class="sum">결제 금액: <span id="totalPrice"></span>￦</span>
                    </div>
                </div> 
            </form> 
        </div>
    </div>    
</section>    
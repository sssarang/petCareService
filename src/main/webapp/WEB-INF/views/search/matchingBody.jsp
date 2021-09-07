<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- Core theme CSS (includes Bootstrap)-->
 <link href="/resources/css/search/matching.css" rel="stylesheet" />
 <!-- jstl -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 

<section class="layout bg-body">
    <div class="container">
        <div class="content">
            <h2 class="text-center">- 예약하기 -</h2>
            
            <form action="/mypage/customerResvManage" method="GET" name="booking" onsubmit="return check();">
            	<div class="wrap pt-5">
                    <div class="form-item pb-3">
                        <label for="nickname">닉네임</label>&nbsp;&nbsp;
                        <input type="text" id="nickname" name="nickname" placeholder="${matching.userNickname}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="contact">연락처</label>&nbsp;&nbsp;
                        <input type="text" id="contact" name="contact" placeholder="${matching.userContact}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="address">주&nbsp;&nbsp;&nbsp;&nbsp; 소</label>&nbsp;&nbsp;
                        <input type="text" id="address" name="address" placeholder="${matching.userAddress}" readonly>
                    </div>
                </div>  
                
                <div class="form-item d-inline-block">
                    <select id="serviceType" name="serviceType" class="form-select" aria-label="Default select example">
                        <option selected>서비스 선택</option>
                    </select>
                </div> 
                
                <div class="pt-3 d-inline-block">
                    <div class="d-inline">
                        <input class="flatpickr selector" data-id="rangePlugin" type="text" placeholder="Start date" name="startDate" readonly="readonly">
                    </div>
                    &nbsp;~&nbsp;
                    <div class="d-inline">
                        <input class="flatpickr selector" id="secondRangeInput" type="text" placeholder="End date" name="endDate" readonly="readonly">
                    </div>
                </div>

                <div class="wrap pt-5">
                    <h3 class="ms-4">Pet</h3>
                    <div class="form-item pb-3 text-center" style="display: inline-block;">
                        <img class="img-fluid rounded-circle img-thumbnail" src="/resources/assets/img/matching/profile.jpg"/>
                        <div class="pt-2">${matching.petName}</div>
                    </div>
                    <div class="form-item pb-3">
                        <label for="petType">반려동물 유형</label>
                        <input type="text" id="petType" name="petType" placeholder="${matching.codeName}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="patAge">나이</label>
                        <input type="text" id="patAge" name="patAge" placeholder="${matching.petBirthday}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="petGender">성별</label>
                        <input type="text" id="petGender" name="petGender" placeholder="${matching.petGender}" readonly>
                    </div>
                    <div class="form-item">암컷(F) &nbsp;&nbsp;수컷(M)</div>
                    <div class="form-item pb-3">
                        <label for="isNeutralization">중성화 여부</label>
                        <input type="text" id="isNeutralization" name="isNeutralization" placeholder="${matching.neutralization}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="isMedicine">약 복용</label>
                        <input type="text" id="isMedicine" name="isMedicine" placeholder="${matching.medicine}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="specialNote">특이사항</label>
                        <textarea name="content" id="specialNote" rows="10" cols="60" placeholder="${matching.specialNote}" readonly ></textarea>
                    </div>
                    
                    <div class="pt-3">
                        <!-- Button to Open the Modal -->
                        <input type="submit" id="regBtn" value="예약" >
                       <!-- <input type="submit" value="예약" id="regBtn" data-toggle="modal" data-target="#modal"> -->
                        <div class="sum">결제 예상 금액: &nbsp;&nbsp;&nbsp;50,000￦</div>
                    </div>
                </div> 
            </form> 
        </div>
    </div>    
</section>    
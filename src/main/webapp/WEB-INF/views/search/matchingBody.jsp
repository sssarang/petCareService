<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- Core theme CSS (includes Bootstrap)-->
 <link href="/resources/css/search/matching.css" rel="stylesheet" />
 
 

<section class="layout bg-body">
    <div class="container">
        <div class="content">
            <h2 class="text-center">- 예약하기 -</h2>
            <div class="wrap pt-5">
            
                <form action="/search/matching" method="POST">
                
                    <div class="form-item pb-3">
                        <label for="nickname">닉네임</label>&nbsp;&nbsp;
                        <input type="text" id="nickname" name="nickname" placeholder="${matching.userNickname}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="contact">연락처</label>&nbsp;&nbsp;
                        <input type="text" id="contact" name="contact" value="${matching.userContact}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="address">주&nbsp;&nbsp;&nbsp;&nbsp; 소</label>&nbsp;&nbsp;
                        <input type="text" id="address" name="address" value="${matching.userAddress}" readonly>
                    </div>
                </form>
            </div>  
            <div class="form-item d-inline-block">
                <select name="service_type_code" class="form-select" aria-label="Default select example">
                    <option selected>서비스 선택</option>
                    <option value="1">방문-All day</option>
                    <option value="2">방문-Half day</option>
                    <option value="3">맡김-All day</option>
                    <option value="4">맡김-Half day</option>
                </select>
            </div> 
            <div class="pt-3 ms-3 d-inline-block">
                <input type="text" name="start_date" class="selector" placeholder="시작일" />
                &nbsp;~&nbsp;
                <input type="text" name ="end_date" class="selector" placeholder="종료일" />

                <!-- <a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a> -->
                
                <script type="text/javascript">

                    $(".selector").flatpickr({ 
                    
                    dateFormat: "Y-m-d",
                    
                    minDate:"today",
                    
                    maxDate: new Date().fp_incr(30)
                    
                    });
                    
                </script> 
            </div>  

            
            <div class="wrap pt-5">
                <h3 class="ms-4">Pet</h3>
                <form action="#">
                    <div class="form-item pb-3 text-center" style="display: inline-block;">
                        <img class="img-fluid rounded-circle img-thumbnail" src="/resources/assets/img/matching/profile.jpg"/>
                        <div class="pt-2">${matching.petName}</div>
                    </div>
                    <div class="form-item pb-3">
                        <label for="petType">반려동물 유형</label>
                        <input type="text" id="petType" name="petType" value="${matching.codeName}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="patAge">나이</label>
                        <input type="text" id="patAge" name="patAge" value="${matching.petBirthday}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="petGender">성별</label>
                        <input type="text" id="petGender" name="petGender" value="${matching.petGender}" readonly>
                    </div>
                    <div class="form-item">암컷(F) &nbsp;&nbsp;수컷(M)</div>
                    <div class="form-item pb-3">
                        <label for="isNeutralization">중성화 여부</label>
                        <input type="text" id="isNeutralization" name="isNeutralization" value="${matching.neutralization}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="isMedicine">약 복용</label>
                        <input type="text" id="isMedicine" name="isMedicine" value="${matching.medicine}" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="specialNote">특이사항</label>
                        <textarea name="content" id="specialNote" rows="10" cols="60" placeholder="${matching.specialNote}" readonly ></textarea>
                    </div>
                </form>
                <div class="pt-3">
                    <!-- Button to Open the Modal -->
                    <button type="button" id="regBtn" data-toggle="modal" data-target="#modal">예약</button>
                    <div class="sum">결제 예상 금액: &nbsp;&nbsp;&nbsp;50,000￦</div>

                    <!-- The Modal -->
                    <div class="modal" id="modal">

                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Modal Heading</h4>

                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    예약이 완료되었습니다.
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" id="reserveBtn" class="btn btn-danger" data-dismiss="modal">확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
    </div>    
</section>    
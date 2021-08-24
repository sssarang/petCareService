<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- Core theme CSS (includes Bootstrap)-->
 <link href="/resources/css/search/matching.css" rel="stylesheet" />

<section class="layout bg-body">
    <div class="container">
        <div class="content">
            <h2 class="text-center">- 예약하기 -</h2>
            <div class="wrap pt-5">
                <form action="#" method="POST">
                    <div class="form-item pb-3">
                        <label for="neckname">닉네임</label>&nbsp;&nbsp;
                        <input type="text" id="neckname" name="neckname" value="도복희" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="number">연락처</label>&nbsp;&nbsp;
                        <input type="text" id="number" name="number" value="010-2528-0747" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="address">주&nbsp;&nbsp;&nbsp;&nbsp; 소</label>&nbsp;&nbsp;
                        <input type="text" id="address" name="title" value="서울 성동구 용답동" readonly>
                    </div>
                </form>
            </div>  
            <div class="form-item" style="display: inline-block;">
                <select class="form-select" aria-label="Default select example">
                    <option selected>서비스 선택</option>
                    <option value="1">방문-All day</option>
                    <option value="2">방문-Half day</option>
                    <option value="3">맡김-All day</option>
                    <option value="4">맡김-Half day</option>
                </select>
            </div> 
            <div class="pt-3 ms-3" style="display: inline-block;">
                <spen><input type="text" class="selector" placeholder="시작일" /></spen>
                <span>&nbsp;~&nbsp;</span> 
                <spen><input type="text" class="selector" placeholder="종료일" /></spen> 

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
                <form action="#" method="POST">
                    <div class="form-item pb-3 text-center" style="display: inline-block;">
                        <img class="img-fluid rounded-circle img-thumbnail" src="/resources/assets/img/matching/profile.jpg"/>
                        <div class="pt-2">복희</div>
                    </div>
                    <div class="form-item pb-3">
                        <label for="neckname">반려동물 유형</label>
                        <input type="text" id="neckname" name="neckname" value="고양이" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="number">나이</label>
                        <input type="text" id="number" name="number" value="4살" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="number">성별</label>
                        <input type="text" id="address" name="title" value="암컷" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="number">중성화 여부</label>
                        <input type="text" id="number" name="number" value="중성화 완료" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="number">약 복용</label>
                        <input type="text" id="address" name="title" value="-" readonly>
                    </div>
                    <div class="form-item pb-3">
                        <label for="content">특이사항</label>
                        <textarea name="content" id="content" rows="10" cols="60" placeholder="내용 블라블라" ></textarea>
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
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
    </div>    
</section>    
<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/home/home.css" rel="stylesheet" />


<!-- 통합검색 -->
<header class="search">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-7">
                <div>
                    <div class="text-center text-white">
                        <!-- Page heading -->
                        <h1>펫시터가 필요하신가요?</h1>
                        <h2 class="mb-5">펫시터를 찾아보세요!</h2>
                    </div>
                    <div class="wrap">
                        <form action="/search/main" method="GET" name="search" onsubmit="return check();">
                        	<!-- 동물 유형 선택 -->
                            <fieldset>
                                I'm looking for service for my: &nbsp;&nbsp;
                                
                                Dog <input type="radio" id="dog" name="petType" value="dog" checked />&nbsp;
                                Cat <input type="radio" id="cat" name="petType" value="4"/>    
                            </fieldset>
                        
                            <hr>
                        
                        	<fieldset>
                                <div id="dogType" class="pt-2">
                                    <div>Dog Size</div>
                                    
                                    <div class="input-group">
                                        <div class="select">
                                            <input type="radio" id="small" name="dogType" value="3" checked>
                                            <label for="small">소형견<br>7kg 미만</label>
                                        </div>

                                        <div class="select">
                                            <input type="radio" id="medium" name="dogType" value="2" />
                                            <label for="medium">중형견<br>7 - 14.9kg</label>
                                        </div>

                                        <div class="select">
                                            <input type="radio" id="large" name="dogType" value="1" />
                                            <label for="large">대형견<br>15kg 이상</label>
                                        </div>
                                    </div>

                                </div>
                            </fieldset>

                            <fieldset>
	                            <div class="pt-1 pb-2 d-flex">
								  	<div>
									    <span>Service Date</span>
									    <br>
									    <input class="flatpickr" data-id="rangePlugin" type="text" placeholder="Start date" name="startDate" readonly="readonly">
								  	</div>
								  	<br>&nbsp;~&nbsp;
								  	<div>
									    <br>
									    <input class="flatpickr" id="secondRangeInput" type="text" placeholder="End date" name="endDate" readonly="readonly">
								  	</div>
								</div>
								
                                <div>
                                    <div>Service Location</div> 
                                    <select id="sido" name="addrSido">
                                        <option value="">::시/도::</option>
                                    </select>
                                    <select id="sigugun" name="addrSigugun">
                                        <option value="">::시/군/구::</option>
                                    </select>
                                    <select id="dong" name="addrDong">
                                        <option value="">::읍/면/동:</option>
                                    </select>
                                </div>
                                                            
	                            <input type="hidden" id="sidoHd" name="addrSidoNm" value="" >
	                            <input type="hidden" id="sigugunHd" name="addrSigugunNm" value="" >
	                            <input type="hidden" id="dongHd" name="addrDongNm" value="" >
                            
                            </fieldset>
                            
                            <fieldset>
                                <div class="pt-3">Service Type</div>
                                
                                <div class="input-group pb-3">
                                	<div class="select">
                                        <input type="checkbox" id="leave-All-day" name="serviceType" value="11" />
                                        <label for="leave-All-day">돌봄<br>All day</label>
                                    </div>

                                    <div class="select">
                                        <input type="checkbox" id="leave-Half-day" name="serviceType" value="12" />
                                        <label for="leave-Half-day">돌봄<br>Half day</label>
                                    </div>
                                    
                                    <div class="select">
                                        <input type="checkbox" id="visit-All-day" name="serviceType" value="13" />
                                        <label for="visit-All-day">방문<br>All day</label>
                                    </div>

                                    <div class="select">
                                        <input type="checkbox" id="visit-Half-day" name="serviceType" value="14" />
                                        <label for="visit-Half-day">방문<br>Half day</label>
                                    </div>
                                </div>
                            </fieldset>

                            <!-- 검색버튼 -->
                           	<input type="submit" value="검색" id="searchBtn">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="blank1"></div>

 <!-- 서비스 설명, faq-->
<section class="showcase bg-body">
    <div class="container">
        <div class="row g-0">
            <div class="col-lg-6 order-lg-2 text-white showcase-img">
                <div>
                    <img class="img-fluid d-block mx-auto" src="/resources/assets/img/home/dog.png"/>
                </div>
            </div>
            <div class="col-lg-6 order-lg-1 my-auto showcase-text pt-5">
                <h2>안심하고 맡길 수 있는<br> 우리 아이를 위한 맞춤 케어</h2>
                <p class="lead mb-0">여행, 출장, 늦은 퇴근에 집에 혼자있는 우리아이..<br>
									 쓰담쓰담과 함께라면 이제 걱정 끝!<br>
									 가족같은 펫시터가 내 아이와 함께합니다.</p>
                
                <!-- Button to Open the Modal -->
                <div class="button">
                    <button type="button" class="mainBtn" data-toggle="modal" data-target="#serviceInfo">상세보기</button>

                    <!-- The Modal -->
                    <div class="modal fade" id="serviceInfo">
                        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                	<img class="img-fluid float-start" src="/resources/assets/img/home/manual.png" width="50px"/>
                                    <h3 class="modal-title">&nbsp;&nbsp;쓰담쓰담 안내서</h3>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
									<ul class="list-inline">
										<li><b>방문 All day</b></li>
										<li class="info mb-3 text-secondary">펫시터가 고객의 집으로 찾아가 반려동물과 집을 돌봅니다.<br>반려동물은 집을 떠나는 스트레스를 줄일 수 있고 편안한 공간에서 안전하게 관리 받습니다.<br><p class="text-danger">※ 귀중품은 따로 보관부탁드립니다. 분실 시 책임지지 않습니다.</p></li>
										<li><b>방문 Half day</b></li>
										<li class="info mb-3 text-secondary">고객의 집으로 찾아가 돌봄을 진행하는것은 '방문 All day'와 같지만, Half day는 일정기간동안 반려동물과 놀고, 사료를 채워주고, 배변처리를 제공합니다.<br><p class="text-danger">※ 귀중품은 따로 보관부탁드립니다. 분실 시 책임지지 않습니다.</p></li>
										<li><b>맡김 All day</b></li>
										<li class="info mb-3 text-secondary">고객의 반려동물이 시터의 집에서 하룻밤을 지냅니다.<br>여러마리의 반려동물을 수용하여 맞춤케어가 힘든 호텔이나 병원과는 달리 가정집에서 밀착케어를 통해 안전하게 지낼 수 있습니다.<br><p class="text-danger">※ 펫시터에게 필요한 물품을 제공해주시기 바랍니다.</p></li>
										<li><b>맡김 Half day</b></li>
										<li class="info mb-3 text-secondary">반나절동안 고객의 반려동물이 시터의 집에서 시간을 보냅니다.<br>펫시터의 집에 머무는 동안 가족의 일원과 같이 대우받으며 편안하고 즐거운 시간을 보냅니다.<br><p class="text-danger">※ 펫시터에게 필요한 물품을 제공해주시기 바랍니다.</p></li>
									</ul>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                   <button type="button" class="modalBtn" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>            
                    </div>
                </div>
            </div>
        </div>
        <div class="blank1"></div>
        <div class="row g-0 ">
            <div class="col-lg-6 order-lg-1 text-white showcase-img">
                <div>
                    <img class="img-fluid d-block" src="/resources/assets/img/home/cat.png" alt="..." />
                </div>
            </div>
            <div class="col-lg-6 order-lg-2 my-auto showcase-text">
                <h2>FAQs. <br> 자주 묻는 질문</h2>
                <p class="lead mb-0">펫시터가 되고 싶으신가요?<br>펫시터가 필요 하신가요?<br>이용하시기전에 궁금증을 여기서 해결하세요!<br>다양한 질문과 답변이 준비되어 있습니다.</p>
                
                <!-- Button to Open the Modal -->
                <div class="button">
                    <button type="button" id="faqBtn" class="mainBtn" data-toggle="modal" data-target="#faq">질문보기</button>

                    <!-- The Modal -->
                    <div class="modal fade" id="faq">
                        <div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                <img class="img-fluid float-start" src="/resources/assets/img/home/questionMark.png" width="40px"/>
                                    <h3 class="modal-title">&nbsp;&nbsp;자주 묻는 질문과 답변</h3>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div id="accordion">
                                        <!-- 동적으로 faq목록 생성 -->
                                    </div>
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                	<button type="button" class="modalBtn" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>            
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="blank1"></div>

 <!-- 후기 -->
 <section class="reviews text-center">
    <div class="container">
        <h2 class="mb-5">쓰담쓰담의<br> 솔직담백 후기!</h2>
        <div class="row">
            <div class="col-lg-4">
                <div class="reviews-item mx-auto mb-5 mb-lg-0">
                    <img id="photo1" class="img-fluid rounded-circle mb-3" src="" alt="..." />
                    <h5 id="writer1"></h5>
                    <p id="content1" class="font-weight-light mb-0"></p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="reviews-item mx-auto mb-5 mb-lg-0">
                    <img id="photo2" class="img-fluid rounded-circle mb-3" src="" alt="..." />
                    <h5 id="writer2"></h5>
                    <p id="content2" class="font-weight-light mb-0"></p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="reviews-item mx-auto mb-5 mb-lg-0">
                    <img id="photo3" class="img-fluid rounded-circle mb-3" src="" alt="..." />
                    <h5 id="writer3"></h5>
                    <p id="content3" class="font-weight-light mb-0"></p>
                </div>
            </div>
        </div>
    </div>
</section>
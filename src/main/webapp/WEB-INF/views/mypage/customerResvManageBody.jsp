<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>customerResvManageBody.jsp</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/mypage/customerResvManage.css" rel="stylesheet" />
        <!-- Google fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom ">마이페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="userInfoManage">회원정보관리</a>
                    <a class="list-group-item list-group-item-action p-3" href="customerProfileManage">프로필관리</a>
                    <a class="list-group-item list-group-item-action p-3" href="customerHistoryManage">이력/리뷰 관리</a>
                    <a class="list-group-item list-group-item-action p-3" href="customerResvManage">예약관리</a>
                    <a class="list-group-item list-group-item-action p-3" href="#!">회원탈퇴</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
                <div id="customerResv">
                    <div id="customerResvManage">
                        <h1 id="head">서비스 예약 내역</h1>

                        <div id="reservation">
                            <div>
                            <p>서비스 예약 날짜 어떻게 넣지 ?</p>
                            
                            <button id="btn_state">승인</button>
                            </div>
                            <span id="historyImage">
                                <img src="/resources/assets/img/mypage/jjang5.jpg" id="proPhoto">
                            </span>
                            <span id="psInfo">
                                <ul id="psInfoUl">
                                    <li>시터 닉네임</li>
                                    <li>시터 연락처</li>
                                    <li>서비스 유형(금액)</li>
                                    <li>서비스 일자</li>
                                    <li>서비스 시간</li>
                                </ul>    
                                         
                                <button type="button" id="btn_charge">결제</button>
                                <button type="button" id="btn_cancel">예약취소</button>

                            </span>

                        </div>

                        <div id="resvExplain">
                            <h4 id="head2">진행 상황</h4>

                            <span>
                            <button type="button" id="btn_wait">대기</button>
                            <p> 펫시터가 예약을 확인하고 있습니다.</p>
                            </span>
                            <span>
                            <button type="button" id="btn_approve">승인</button>
                            <p> 예약이 승인되었습니다.</p>
                            </span>
                            <span>
                            <button type="button" id="btn_refuse">거절</button>
                            <p> 예약이 거절되었습니다.</p>
                            </span>
                        </div>
						
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
  
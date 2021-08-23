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
        <title>customerHistoryManageBody.jsp</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/mypage/customerHistoryManage.css" rel="stylesheet" />
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
                <div id="customerHistory">
                    <div id="customerHistoryManage">
                        <h1 id="head">서비스 이용 내역</h1>
						
						<div class="history">
                        	<p>서비스 이용 날짜 어떻게 넣지 ?</p>
                        
                            <span id="historyImage">
                                <img src="/resources/assets/img/mypage/jjang2.jpg" id="proPhoto">
                            </span>
                            <span id="psInfo">
                                <ul id="psInfoUl">
                                    <li>시터 닉네임</li>
                                    <li>시터 연락처</li>
                                    <li>서비스 유형</li>
                                    <li>이용시간 (11:00~23:00)</li>
                                    <a href="" class="writeReview">리뷰남기기</a>
                                </ul>
                                
                            </span>
                        </div>
                        <div class="history">
                        	<p>서비스 이용 날짜 어떻게 넣지 ?</p>
                        
                            <span id="historyImage">
                                <img src="/resources/assets/img/mypage/jjang4.jpg" id="proPhoto">
                            </span>
                            <span id="psInfo">
                                <ul id="psInfoUl">
                                    <li>시터 닉네임</li>
                                    <li>시터 연락처</li>
                                    <li>서비스 유형</li>
                                    <li>이용시간 (11:00~23:00)</li>
                                    <a href="" class="writeReview">리뷰남기기</a>
                                </ul>
                                
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
  
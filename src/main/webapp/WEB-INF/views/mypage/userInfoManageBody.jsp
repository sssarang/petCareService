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
        <title>userInfoManageBody.jsp</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/mypage/userInfoManage.css" rel="stylesheet" />
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
                <div class="userInfoModify">
                    <div id="modify_flex">
                        <form action="/mypage/userInfoModify" method="POST">
                            <h1 id="head">회원정보관리</h1>
                            <div id="form-group">
                                    <label>닉네임 </label>
                                    <input type="text" name="user_nickname" class="form-control" placeholder="Nickname">
                                    <button tpye="submit" class="btn_nickname">확인</button>

                                    <label>아이디 </label>
                                    <input type="text" name="user_id" class="form-control" placeholder="ID" readonly>
                                    
                                    <label>비밀번호 </label>
                                    <input type="password" name="user_pw" class="form-control" >
                                    
                                    <label>비밀번호 확인 </label>
                                    <input type="password" name="user_pw" class="form-control" >
                                    
                                    <label>연락처 </label>
                                    <input type="tel" name="user_contact" class="form-control" placeholder="010-4786-3153">
                                    
                                    <label>주소 </label>
                                    <input type="text" name="user_address" class="form-control" placeholder="서울시 영등포구 여의도동">
                                    
                                    <label>성별</label>
                                    <input type="radio" name="gender" class="gender" value="female" checked>여성
                                    <input type="radio" name="gender" class="gender" value="male">남성

                                    <button type="submit" class="btn_userInfo">저장</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/mypage/sideBarScripts.js"></script>
    </body>
</html>
  
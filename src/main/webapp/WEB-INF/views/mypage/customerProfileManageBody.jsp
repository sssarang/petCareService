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
        <title>customerProfileManageBody.jsp</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/mypage/customerProfileManage.css" rel="stylesheet" />
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
                <div class="customerProfileModify">
                    <form action="/mypage/customerProfileModify" method="POST">
                        <h1 id="head">프로필관리</h1>
                        <div id="proImg">
                            <img src="/resources/assets/img/mypage/hello.jpg" id="proPhoto">
                            <button type="" id="btn_proPhotoModify">변경</button>
                        </div>

                        <div id="petInfo">
                            <label>동물 종류 선택</label>
                            <select name="petType" id="petType">
                                <option value="" selected>동물의종류</option>
                                <option value="1">대형견</option>
                                <option value="2">중형견</option>
                                <option value="3">소형견</option>
                                <option value="4">고양이</option>
                            </select>

                            <label>이름</label>
                            <input type="text" name="petName" class="form-control">

                            <label>생일</label>
                            <input type="date" name="petBirthday">

                            <label>성별</label>
                            <input type="radio" name="petGender" class="gender" value="female" checked>암컷
                            <input type="radio" name="petGender" class="gender" value="male">수컷

                            <label>중성화</label>
                            <input type="radio" name="neutralization" class="neutralization" value="yes" checked>유
                            <input type="radio" name="neutralization" class="neutralization" value="no">무

                            <label>약복용</label>
                            <input type="radio" name="medicine" class="medicine" value="yes" checked>유
                            <input type="radio" name="medicine" class="medicine" value="no">무
                        </div>

                        <div id="specialNote">
                            <label>특이사항</label>
                            <textarea name="specialNote" id="specialNoteText" cols="60" rows="10" maxlength="500">특이사항을 입력하세요!</textarea>
                        </div>
                    

                        <div id="btn_cusPro">
                        <button type="submit" class="btn_cusPro">저장</button>
                        <button type="reset" class="btn_cusPro">다시쓰기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        Core theme JS
        <script src="/resources/js/mypage/sideBarScripts.js"></script> -->
    </body>
</html>
  
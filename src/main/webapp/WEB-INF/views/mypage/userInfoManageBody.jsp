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
        <!-- Modal -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">

	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
        <%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %> 
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
                <div class="userInfoModify">
                    <div id="modify_flex">
                        <form action="/mypage/userInfoModify" method="POST">
                            <h1 id="head">회원정보관리</h1>
                            <div id="form-group">
                                <div>
                                    <label>닉네임 </label>
                                    <label  id="nickNameLabel" class="warning-label"></label>
                                    <button type="button" class="check-button" id="nickNameBtn">중복확인</button>
                                    <input type="text" id="nickName" name="userNickname" class="form-control" placeholder="Nickname" value="${info.userNickname}">
                                    
                                </div>
                                    <label>아이디 </label>
                                    <input type="text" name="user_id" class="form-control" placeholder="${info.userId}" readonly>
                                    

                                    <label>연락처 </label>
                                    <label id="phoneLabel" class="warning-label">* ex)010-1234-5678 '-'를 포함하여 작성해 주세요.</label>
                                    <input type="text" id="inputPhone" name="userContact" class="form-control" value="${info.userContact}">
                                    
                                    <label>주소 </label>
		                            <label class="warning-label">* 지번주소를 입력해 주세요.</label>
                                    <input type="button" onclick="sample4_execDaumPostcode()" class="check-button" value="우편번호 찾기">
                                    <input type="text" id="inputAddress" name="userAddress" class="form-control" placeholder="주소" value="${info.userAddress}" readonly>
                                    
                                    <input type="hidden" name="userLatitude" value="${info.userLatitude}">
                                    <input type="hidden" name="userLongitude" value="${info.userLongitude}">
                                    
                                    <label>성별</label>
                                    <input type="radio" name="gender" class="gender" value="female" checked>여성
                                    <input type="radio" name="gender" class="gender" value="male">남성
                                    
                                    <br>

									<!-- Button to Open the Modal -->
							        <!-- NOTE 1: if ( data-toggle="modal" ) not exists, modal window not appeared. -->
							        <!-- NOTE 2: if ( data-target="#myModal" ) not exists or incorrect, modal window not appeared. -->
							        <button type="button" class="btn-password" data-toggle="modal" data-target="#myModal">
							            비밀번호 변경하기
							        </button>
							
							        <!-- The Modal -->
							        <!-- NOTE 3: if (  class="modal" ) not exists, the below <div> box appeared without button click. -->
							        <div class="modal fade" id="myModal">
							            <!-- NOTE 4: if ( class="modal-dialog" ) not exists, modal window appeared by full width on viewport. -->
							            <div class="modal-dialog modal-lg">
							
							                <!-- NOTE 5: if ( class="modal-content" ) not exists, the background of modal window not appeared. -->
							                <div class="modal-content">
							
							                    <!-- Modal Header -->
							                    <div class="modal-header">
							                        <h4 class="modal-title">비밀번호 변경하기</h4>
							
							                        <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
							                        <button type="button" class="close" data-dismiss="modal">&times;</button>
							                    </div>
							
							                    <!-- Modal body -->
							                    <div class="modal-body">
							                        <div class="modal-password">
							                        <label>기존비밀번호 </label>
				                                    <label id="oldPwLabel" class="warning-label"></label>
				                                    <input type="password" id="inputOldPw" name="userPw" class="form-control" placeholder="기존 비밀번호를 입력하세요.">
							                        
													<label>새비밀번호 </label>
				                                    <label id="newPwLabel" class="warning-label"></label>
				                                    <input type="password" id="inputNewPw" name="userPw" class="form-control" placeholder="숫자와 문자포함 6~12자리 이내">
				                                    </div>
				                                    
				                                    <button type="button" id="btn-changePw">비밀번호 변경</button>
							                    </div>
							
							                    <!-- Modal footer -->
							                    <div class="modal-footer">
							                        <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
							                        <button type="button" class="btn btn-secondary btn_modalClose" data-dismiss="modal">닫기</button>
							                    </div>
							
							                </div>
							
							            </div>
							        </div>
                                    <button type="submit" class="btn_userInfo" id="submitBtn">저장</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <!-- jquery -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
	    
	    <!-- 카카오 지도 api -->
	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36768b2f76471ae95e3d92b023d2b626"></script>
	    
	    <script>
	    		$(function(){
				 	 //닉네임 중복검사
					$('#nickNameBtn').click(function (){
						console.log('버튼눌림');
						var nickName = $('#nickName').val();
						$('#nickNameLabel').css("color", "red");
						
						if(nickName.trim() == ''){
							//닉네임을 입력하지 않은 경우
							$('#nickNameLabel').text("* 닉네임을 입력하세요");
							return;
						} else {
							 if(nickName.length < 1 || nickName.length > 8){
								$('#nickNameLabel').text("* 닉네임은 1~8자 이내로 가능합니다.");
								return;
							 }
						}//if-else
						
						var sendData = "nickName="+nickName;
						$.ajax({
							url: '/user/nickNameCheck',
							method: 'GET',
							data: sendData,
							success :function(resp){
								
								if(resp == 'success'){
									//인증성공
									$('#nickNameLabel').css("color", "blue");
									$('#nickNameLabel').text("* 사용 가능한 닉네임입니다.");
									nickNameCheck = nickName;
								} else{
									$('#nickNameLabel').text("* 이미 사용중인 닉네임입니다.");
								}//if-else
							}
						})//.ajax
					});//end function
					
					
					var isPwCheck = false;
					
					//새비밀번호 체크
					$('#inputNewPw').on("propertychange change keyup paste input", function (){
						var pwReg = /^[A-Za-z0-9]{6,12}$/;
						var pw = $('#inputNewPw').val();
						$('#newPwLabel').css("color", "red");
						
						if(pw.trim() == ''){
							$('#newPwLabel').text("* 비밀번호를 입력하세요");
							return;
						} else {
							if(pw.match(pwReg) == null){
								//비밀번호 형식에 맞지 않는 경우
								$('#newPwLabel').text("* 숫자와 문자포함 6~12자리 이내");
								isPwCheck = false;
								return;
							} else {
								$('#newPwLabel').css("color", "blue");
								$('#newPwLabel').text("* 사용할 수 있는 비밀번호 입니다");
								passwordCheck = pw;
								isPwCheck = true;
							}
						}//if-else
					});//end function
					
					// 비밀번호 변경시 기존 비밀번호 동일 체크
					$('#btn-changePw').click(function(){
						var inputOldPw = $('#inputOldPw').val();
						console.log(inputOldPw);
						
						$.ajax({
							url: "/mypage/readPw",
							method: "POST",
							data: {
								oldPw : inputOldPw
							},
							dataType : 'json',
							success: function(data){
								console.log(data);
								
								if(data == false){
									$('#oldPwLabel').text("*비밀번호가 맞지 않습니다.");
									$('#oldPwLabel').css("color", "red");
								}
							}
						})
						
						
					})	// click
					
					//전화번호 유효성 체크
					$('#inputPhone').on("propertychange change keyup paste input", function (){
						var phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;
						var phone = $('#inputPhone').val();
						$('#phoneLabel').css("color", "red");
						
						if(phone.trim() == ''){
							$('#phoneLabel').text("* ex)010-1234-5678");
							return;
						} else {
							if(phone.match(phoneReg) == null){
								//전화번호 형식에 맞지 않는 경우
								$('#phoneLabel').text("* 전화번호 형식이 일치하지 않습니다.");
								return;
							} else {
								$('#phoneLabel').css("color", "blue");
								$('#phoneLabel').text("* 전화번호 형식이 일치합니다.");
								phoneNumberCheck = phone;
							}
						}//if-else
					});//end function
	    		});
	    		
				function sample4_execDaumPostcode() {
				    new daum.Postcode({
				        oncomplete: function(data) {
				            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				            var roadAddr = data.roadAddress; // 도로명 주소 변수
				            var extraRoadAddr = ''; // 참고 항목 변수

				            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                extraRoadAddr += data.bname;
				            }
				            // 건물명이 있고, 공동주택일 경우 추가한다.
				            if(data.buildingName !== '' && data.apartment === 'Y'){
				               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				            }
				            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				            if(extraRoadAddr !== ''){
				                extraRoadAddr = ' (' + extraRoadAddr + ')';
				            }

				            // 우편번호와 주소 정보를 해당 필드에 넣는다.
				            //document.getElementById('sample4_postcode').value = data.zonecode;
				            //document.getElementById("sample4_roadAddress").value = roadAddr;
				            document.getElementById("inputAddress").value = data.jibunAddress;
				            
				            
				            
							if(data.autoJibunAddress) {
				                var expJibunAddr = data.autoJibunAddress;
				                document.getElementById("inputAddress").value = expJibunAddr;
				                
				                
				            }
				        }
				    }).open();
				}
				
				//위치 좌표로 변경
				function kakaoMap(){
				    var geocoder = new kakao.maps.services.Geocoder();

				    geocoder.addressSearch($('#inputAddress').val(), function(result, status) {
				       
					    if (status === kakao.maps.services.Status.OK) {
				           console.log(result[0].x, result[0].y);    
						   //result[0].x : 경도
						   //result[0].y : 위도
						   var x = result[0].x;
						   var y = result[0].y;
						   console.log(x, y);
									
						   var sendData = "x="+x+'&y='+y;
						   $.ajax({
						        url:'coordinate',
						        type : 'POST',
						        data: sendData,
								success: function(resp){}
					   	   })//.ajax
					    }//if
					});
				}
				
				//전체 확인 (submit)버튼시 검사하는 항목들
				//비밀번호, 전화번호, 주소, 성별
				$('#submitBtn').click(function (){
					var joinForm = document.joinForm;
					kakaoMap();
					
					
					
					if(checkExistData($('#inputPw').val(), "비밀번호를") == false){
						$('#pwLabel').text("");
						$('#inputPw').val('');
						return false;
					} else if(passwordCheck != $('#inputPw').val()) {
						alert('비밀번호를 다시 설정해주세요.')
						$('#pwLabel').text("");
						$('#inputPw').val('');
						return false;
					}//if-else
					
					if(checkExistData($('#nickName').val(), "닉네임을") == false){
						$('#nickNameLabel').text("");
						$('#nickName').val('');
						return false;
					} else if(nickNameCheck != $('#nickName').val()) {
						alert('닉네임 중복확인 버튼을 클릭하세요.')
						$('#nickNameLabel').text("");
						return false;
					}
					
					if(checkExistData($('#inputPhone').val(), "전화번호를") == false){
						$('#phoneLabel').text("");
						$('#inputPhone').val('');
						return false;
					} else if(phoneNumberCheck != $('#inputPhone').val()) {
						alert('전화번호를 정확히 입력해주세요.');
						$('#phoneLabel').text("* ex)010-1234-5678");
						return false;
					}
					
					if(checkExistData($('#inputAddress').val(), "주소를") == false){
						$('#inputAddress').text("");
						$('#inputAddress').val('');
						return false;
					} else {
						//최종 확인
						$(this).attr("type","submit");
						window.location.href="http://localhost:8090/user/loginPage";
					}//if-else
				});//beforeSubmit
				

	    </script>
	    
	    
	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36768b2f76471ae95e3d92b023d2b626&libraries=services"></script>
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    
    </body>
</html>
  
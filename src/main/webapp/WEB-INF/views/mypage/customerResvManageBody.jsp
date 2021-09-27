<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   

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
            	<div class="navTitle">
            		<p class="navTitleIn">마이페이지 > 서비스 이용 내역</p>
            	</div>
            	<hr class="hhr">
                <!-- Page content-->
                <div id="customerResv">
                    <div id="customerResvManage">

                        <div id="reservation">
                            <div>
                            <p>예약 하신 날짜 : ${resv.regDate}</p>
                            
                            
                            <input type="text" id="stepTypeCodeName" name="stepTypeCodeName" value="${resv.stepTypeCodeName}" readonly>
                            <img id="reload-btn" src="/resources/assets/img/mypage/reload.png" width="20px" height="20px">
                            </div>
                            <span id="historyImage">
                                <img src="${resv.proPhoto}" id="proPhoto">
                            </span>
                            <span id="psInfo">
                                <ul id="psInfoUl">
                                	<input type="hidden" name="serviceId" value="${resv.serviceId}">
                                	<input type="hidden" name="paymentUserNo" value="${payment.userNo}">
                                    <label for="userNickname">시터 닉네임</label>
                            		<input type="text" name="userNickname" class="form-control" value="${resv.userNickname}" readonly>
                            		<label for="userContact">시터 연락처</label>
                            		<input type="text" name="userContact" class="form-control" value="${resv.userContact}" readonly>
                            		<label for="serviceCodeName">서비스 유형</label>
                            		<input type="text" name="serviceCodeName" class="form-control" value="${resv.serviceCodeName}" readonly>
                            		<label for="price">금액</label>
                            		<input type="text" name="price" class="form-control" value="${resv.totalAmount}원" readonly>
                            		<br>
                            		<label for="startDate">서비스 시작 일자</label>
                            		<input type="text" name="startDate" class="form-control" value="<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${resv.startDate}" />" readonly>
                            		<input type="hidden" name="forDDay" value="<fmt:formatDate pattern="yyyy,MM,dd" value="${resv.startDate}" />"/>
                            	
                            		
                                </ul>    
                                        
                                <button type="button" class="btn-modal" data-toggle="modal" data-target="#myModal1" id="btn_charge">결제</button>
                                
						
						        <!-- The Modal -->
						        <!-- NOTE 3: if (  class="modal" ) not exists, the below <div> box appeared without button click. -->
						        <div class="modal fade" id="myModal1">
						            <!-- NOTE 4: if ( class="modal-dialog" ) not exists, modal window appeared by full width on viewport. -->
						            <div class="modal-dialog modal-lg">
						
						                <!-- NOTE 5: if ( class="modal-content" ) not exists, the background of modal window not appeared. -->
						                <div class="modal-content">
						
						                    <!-- Modal Header -->
						                    <div class="modal-header">
						                        <h4 class="modal-title">결제방법 선택하기</h4>
						
						                        <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
						                        <button type="button" class="close" data-dismiss="modal">&times;</button>
						                    </div>
						
						                    <!-- Modal body -->
						                    <div class="modal-body">
						                        <div class="nonData">
						                        	<form action="/mypage/paymentSend" method="POST" class="nonDataForm">
						                        	<input type="hidden" name="serviceId" value="${resv.serviceId}">
						                        	<input type="hidden" name="price" value="${resv.totalAmount}">
						                        	<input type="hidden" name="userNo" value="${resv.petUserNo}">
						                        	
						                        	<label>결제 방식 선택</label>
						                        	<br>
						                            <select name="paymentTypeCode">
						                                <option value="41" selected>신용카드 결제 방식</option>
						                                <option value="42" >무통장입금 결제 방식</option>
						                            </select>
						                            
						                            <button type="submit" class="btn-payment" > 결제 </button>
						                            </form>
						                        </div>
						                        <div class="dataExist">
						                        	<p>고객님께선 이미 결제를 완료하셨습니다!</p>
						                        	<br>
						                        	<p>다가올 서비스 일자를 기대해주세요!</p> 
						                        	<br>
						                        	<br>
						                        	<p>서비스 시작까지 </p><p class="diffDate" value="" style="color : red;"><p>일 남았습니다!</p>
						                        </div>
						                    </div>
						
						
						                </div>
						
						            </div>
						        </div>
						        <button type="button" class="btn-modal" data-toggle="modal" data-target="#myModal2" id="btn_cancel">예약취소</button>
                                
						        <!-- The Modal -->
						        <!-- NOTE 3: if (  class="modal" ) not exists, the below <div> box appeared without button click. -->
						        <div class="modal fade" id="myModal2">
						            <!-- NOTE 4: if ( class="modal-dialog" ) not exists, modal window appeared by full width on viewport. -->
						            <div class="modal-dialog modal-sm">
						
						                <!-- NOTE 5: if ( class="modal-content" ) not exists, the background of modal window not appeared. -->
						                <div class="modal-content2">
						
						                    <!-- Modal Header -->
						                    <div class="modal-header">
						                        <h4 class="modal-title">예약 취소하기</h4>
						
						                        <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
						                        <button type="button" class="close" data-dismiss="modal">&times;</button>
						                    </div>
						
						                    <!-- Modal body -->
						                    <div class="modal-body">
						                        <div class="cancelResv">
						                        <p>예약 취소는 서비스 시작일(<p><fmt:formatDate pattern="yyyy-MM-dd" value="${resv.startDate}" /></p><p>)</p>
						                        <br>
						                        <p>3일 전까지만 가능합니다.
						                        <br>
						                        <br>
						                        <p id="cancelPossible">예약을 취소하시겠습니까 ?</p>
						                        <br>
						                        <p id="cancelImpossible">예약 취소가 불가능합니다.</p>
						                        </div>
						                        <button type="button" class="btn_cancelYes" data-dismiss="modal">예약 취소</button>
						                    </div>
						
						                    <!-- Modal footer -->
						                    <div class="modal-footer">
						                        
						                        
						                    </div>
						
						                </div>
						
						            </div>
						        </div>

                            </span>

                        </div>

                        <div id="resvExplain">
                            <h4 id="head2">진행 상황</h4>

                            <span>
                            <button type="button" id="btn_wait">서비스예약</button>
                            <p> 펫시터가 예약을 확인하고 있습니다.</p>
                            </span>
                            <span>
                            <button type="button" id="btn_approve">예약승인</button>
                            <p> 예약이 승인되었습니다.</p>
                            </span>
                            <span>
                            <button type="button" id="btn_refuse">예약거절</button>
                            <p> 예약이 거절되었습니다.</p>
                            </span>
                        </div>
						
                    </div>
                </div>
            </div>
        </div>
        <!-- alert js -->
      	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      	
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        <script>
        
        	$(function() {
        		
        		//==================== 서비스까지 남은 날짜 구하기====================
        			
        		var today = new Date();											// 현재날짜
        		var dday = new Date($('input[name=forDDay]').val());			// 서비스시작날짜
        		
        		var gap = dday.getTime() - today.getTime();						// 남은 날짜(밀리초 단위)
        		var result = Math.ceil(gap / (1000 * 60 * 60 * 24));			// 남은 날짜(날 단위)
        		console.log('디데이 : ' + result);

				$('.diffDate').html(result);
        		
        		//==================== 승인 되었을때만 결제버튼 활성화 ================
        		var stepTypeCodeName = $('input[name=stepTypeCodeName]').val()
        		if(stepTypeCodeName != "예약승인"){
        			$('#btn_charge').hide();
        		}
        		
        		//==================== 서비스 예약, 예약 승인일때만 취소 버튼 활성화 =====
        		/* if(stepTypeCodeName == "예약거절"){
        			$('#btn_cancel').hide();
        		} */
        			
        		//==================== 새로고침표시 클릭시 페이지 리로드 ===============
        		$('#reload-btn').click(function(){
        			location.reload();
        		});
        		
        		//==================== 결제버튼 클릭시 결제테이블 데이터 조회 =========== 
        		$('#btn_charge').click(function(){
        			
        			var payment = $('input[name=paymentUserNo]').val();
        			console.log(payment);
        			
        			if(payment == ""){
        				$('.dataExist').hide();
        			} else{
        				$('.nonData').hide();
        			};
        		})	// click
        		
        		//==================== 예약 취소시 진행단계코드 변경 ==================
        		
        		$('#btn_cancel').click(function(){
        			
        		var serviceId = $('input[name=serviceId]').val();
        		console.log(serviceId);	
        		console.log('디데이 : ', result);
        		
        		if(result > 3){
        			$('#cancelImpossible').hide();
        			
        			$('.btn_cancelYes').click(function(){					
        				$.ajax({
        				url: "/mypage/cancelResv",
        				method: "POST",
        				data: {
        					serviceId : serviceId
        				},
        				success: function(data){
        					console.log('success');
        					location.reload();
        				}	// success
        				})	// ajax
        			});	// click
        		} else{
        			$('#cancelPossible').hide();
        		};	// if- else
        		
        			
        			
        			
        		});	// click
        		
        		//==================== 예약 없을 시 알림창 + 메인 마이페이지로 이동 ======
        	        		
        		if($('input[name=userNickname]').val() == ""){
        			
        			swal({
        				title : '예약이 없습니다!',
        				text : '서비스를 예약하시면 확인하실 수 있습니다.',
        				icon : 'info',
        				closeOnClickOutside: false,
        				button: {
        					text: "돌아가기"
        					
        				}
        			});
        			
        			$('.swal-button').click(function(){
        				location.href="main";
        			});
        			
        		}	// if
        		
        		//==================== 서비스 시작일자까지 남은 일 수 계산 =============
        		
        		/* function dateFormat(date) {
			        let month = date.getMonth() + 1;
			        let day = date.getDate();
			
			        month = month >= 10 ? month : '0' + month;
			        day = day >= 10 ? day : '0' + day;
			
			        return date.getFullYear() + '-' + month + '-' + day;
			  	} //dateFormat
        			
        		const currDay = new Date();
        		console.log(currDay);
        		
        		const currDay1 = dateFormat(currDay);
        		console.log(currDay1);
        		
        		const serviceDay = new Date(<fmt:formatDate pattern="yyyy-MM-dd" value="${resv.startDate}" />);
        		console.log(serviceDay);
        		
        		const serviceDay1 = dateFormat(serviceDay);
        		console.log(serviceDay1);
        		
        		const diffDay = Math.floor((serviceDay.getTime() - currDay1.getTime()) / (1000 * 60 * 60 * 24));
        		console.log(diffDay);
        		
        		$('.diffDate').html(diffDay); */
        		
        		//==================== 예약 취소 클릭시 진행단계코드 수정 ==============
	        			
       			/* $(".btn-cancel").click(function({
       				
       				var serviceId = $('input[name="serviceId"]').val();
       				console.log(serviceId);
       			
       				$.ajax({
        				url: "/mypage/cancelResv",
        				method: "POST",
        				data:{
        					serviceId : serviceId
        				},
        				success:function(data){
        					
        				}
        			}); // ajax
       			}) // click */
        		
        	})	// jq
        	
        
        
        </script>
        
    </body>
</html>
  
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
                            <input type="hidden" name="stepTypeCodeName" value="${resv.stepTypeCodeName}" readonly>
                            <input type="hidden" name="userNo" value="${resv.petUserNo}">
                            <c:choose>
                            <c:when test="${resv.stepTypeCodeName eq '서비스예약'}"><button type="button" class="btn-outline-secondary stepTypeCode">승인 대기</button></c:when>
                            <c:when test="${resv.stepTypeCodeName eq '예약승인'}"><button type="button" class="btn btn-outline-success stepTypeCode">예약 승인</button></c:when>
                            <c:when test="${resv.stepTypeCodeName eq '예약거절'}"><button type="button" class="btn btn-outline-danger stepTypeCode">예약 거절</button></c:when>
                            <c:otherwise></c:otherwise>
                            </c:choose>
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
                            		<input type="text" name="userNickname" class="form-control" value="${resv.userNicknameP}" readonly>
                            		<label for="userContact">시터 연락처</label>
                            		<input type="text" name="userContact" class="form-control" value="${resv.userContactP}" readonly>
                            		<label for="serviceCodeName">서비스 유형</label>
                            		<input type="text" name="serviceCodeName" class="form-control" value="${resv.serviceCodeName}" readonly>
                            		<label for="price">금액</label>
                            		<input type="text" name="price" class="form-control" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${resv.totalAmount}" />원" readonly>
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
						            <div class="modal-dialog modal-sm">
						
						                <!-- NOTE 5: if ( class="modal-content" ) not exists, the background of modal window not appeared. -->
						                <div class="modal-content">
						
						                    <!-- Modal Header -->
						                    <div class="modal-header">
						                        <h4 class="modal-title">주문서</h4>
						
						                        <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
						                        <button type="button" class="close" data-dismiss="modal">&times;</button>
						                    </div>
						
						                    <!-- Modal body -->
						                    <div class="modal-body">
						                        <div class="nonData">
						                        	<div  class="order">
							                        	<h5>주문 정보</h5>
							                        	<ul>
							                        	<table>
															  <tr class="tr">
															    <td class="boldText">주문 번호</th>
															    <td class="dataIn">${resv.serviceId}</th>
															  </tr>
															  <br>
															  <tr class="tr">
															    <td class="boldText">주문자 명</td>
															    <td class="dataIn">${resv.userNicknameC}</td>
															  </tr>
															  <tr class="tr">
															  	<td class="boldText">서비스 종류</td>
															  	<td class="dataIn">${resv.serviceCodeName}</td>
															  </tr>
															  <tr class="tr">
															  	<td class="boldText">서비스 기간</td>
															  	<td class="dataIn"><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${resv.startDate}" /> 시작 <br> <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${resv.endDate}" /> 종료</td>
															  </tr>
															  <tr class="tr">
															  	<td class="boldText">금액</td>
															  	<td class="dataIn"><fmt:formatNumber type="number" maxFractionDigits="3" value="${resv.totalAmount}" />원</td>
															  </tr>
															</table>
	
							                        	
							                        	
							                        	</ul>
							                        	<input type="hidden" name="serviceId" value="${resv.serviceId}">
							                        	<input type="hidden" name="price1" value="${resv.totalAmount}">
							                        	<!-- input type="hidden" name="userNo" value="${resv.petUserNo}"> -->
							                        	<input type="hidden" name="userNicknameC" value="${resv.userNicknameC}">
							                        	<input type="hidden" name="userContactC" value="${resv.userContactC}">
							                        	<input type="hidden" name="userId" value="${resv.userId}">
							                        	<input type="hidden" name="userAddress" value="${resv.userAddress}">
							                        	<!-- <label>결제 방식 선택</label>
							                        	<br>
							                            <select name="paymentTypeCode">
							                                <option value="41" selected>신용카드 결제 방식</option>
							                                <option value="42" >무통장입금 결제 방식</option>
							                            </select> -->
							                        </div>    
							                            
							                            <button type="button" class="btn-payment1" > 결제하기 </button>
						             				
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
						                    <div class="modal-body2">
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
                            <button type="button" class="btn-outline-secondary stepTypeCode stepTypeCodeInfo">승인 대기</button>
                            <p> 펫시터가 예약을 확인하고 있습니다.</p>
                            </span>
                            <span>
                            <button type="button" class="btn btn-outline-success stepTypeCode stepTypeCodeInfo">예약 승인</button>
                            <p> 예약이 승인되었습니다.</p>
                            </span>
                            <span>
                            <button type="button" class="btn btn-outline-danger stepTypeCode stepTypeCodeInfo">예약 거절</button>
                            <p> 예약이 거절되었습니다. 펫시터와 연락바랍니다.</p>
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
        
         <!-- jQuery -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<!-- iamport.payment.js -->
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
        <script>
        
        
        
        	$(function() {
        		
        		//==================== 결제를 위한 jq ============================
        		var IMP = window.IMP; // 생략 가능
        		IMP.init("imp01777109"); // 예: imp00000000
        		
        		var userNo = $('input[name=userNo]').val();
        		var payment = $('input[name=paymentUserNo]').val();
        		
        		$('.btn-payment1').click(function(){
        			// IMP.request_pay(param, callback) 결제창 호출
        		      IMP.request_pay({ // param
        		          pg: "html5_inicis",
        		          pay_method: "card",
        		          merchant_uid: $('input[name=serviceId]').val(),		// 구매번호
        		          name: $('input[name=serviceCodeName]').val(),			// 구매상품 이름
        		          amount: $('input[name=price1]').val(),					// 금액
        		          buyer_email: $('input[name=userId]').val(),			// 구매자 id
        		          buyer_name: $('input[name=userNicknameC]').val(),		// 구매자 닉네임
        		          buyer_tel: $('input[name=userContactC]').val(),		// 구매자 연락처
        		          buyer_addr: $('input[name=userAddress]').val(),		// 구매자 주소
        		          buyer_postcode: "01181"
        		      }, function (rsp) { // callback
        		          if (rsp.success) {	// 결제 성공 시 로직
        		        	  $.ajax({
        	        				url: "/mypage/paymentSend",
        	        				method: "POST",
        	        				data: {
        	        					serviceId : rsp.merchant_uid,
        	        					paymentTypeCode : 41,
        	        					price : amount,
        	        					userNo : userNo,
        	        					paymentId : rsp.imp_uid
        	        				},
        	        				success: function(data){
        	        					console.log('success');
        	        					location.reload();
        	        				}	// success
        	        				})	// ajax
        		          } else {
        		              
        		          }
        		      });
        			
        			
        		})	// click
        			
        			
        		//==================== 서비스까지 남은 날짜 구하기====================
        			
        		var today = new Date();											// 현재날짜
        		var dday = new Date($('input[name=forDDay]').val());			// 서비스시작날짜
        		
        		var gap = dday.getTime() - today.getTime();						// 남은 날짜(밀리초 단위)
        		var result = Math.ceil(gap / (1000 * 60 * 60 * 24));			// 남은 날짜(날 단위)

				$('.diffDate').html(result);
        		
        		//==================== 승인 되었을때만 결제버튼 활성화 ================
        		var stepTypeCodeName = $('input[name=stepTypeCodeName]').val()
        		if(stepTypeCodeName != "예약승인"){
        			console.log('스텝타입코드');
        			$('#btn_charge').hide();
        		}
        		
        			
        		//==================== 새로고침표시 클릭시 페이지 리로드 ===============
        		$('#reload-btn').click(function(){
        			location.reload();
        		});
        		
        		//==================== 결제버튼 클릭시 결제테이블 데이터 조회 =========== 
        		$('#btn_charge').click(function(){
        			
        			var payment = $('input[name=paymentUserNo]').val();
        			
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
        		
        	})	// jq
        	
        
        
        </script>
        
    </body>
</html>
  
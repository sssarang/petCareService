<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
	    
	    <style>
	    </style>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
            	<div class="navTitle">
            		<p class="navTitleIn">마이페이지 > 이력/리뷰 관리</p>
            	</div>
            	<hr class="hhr">
                <!-- Page content-->
                <div id="customerHistory">
                    <div id="customerHistoryManage">
						
						<c:forEach items="${history}" var="i">
						<div class="history">
                        	<p>서비스 이용 날짜 : <fmt:formatDate pattern="yyyy-MM-dd" value="${i.startDate}" /></p>
                        	
                            <span id="historyImage">
                                <img src="${i.proPhoto}" id="proPhoto">
                            </span>
                            <span id="psInfo">
                                <ul id="psInfoUl">
                                	<input type="hidden" name="serviceId" value="${i.serviceId}">
                                	<input type="hidden" name="userNo" value="${userNo}">
                                	<input type="hidden" name="totalAmount" value="${i.totalAmount}">
                                	
                                	<table>
                                		<tr>
                                			<td class="boldText">닉네임</td>
                                			<td class="dataIn">${i.userNickname}</td>
                                		</tr>
                                		<tr>
                                			<td class="boldText">연락처</td>
                                			<td class="dataIn">${i.userContact}</td>
                                		</tr>
                                		<tr>
                                			<td class="boldText">서비스 유형</td>
                                			<td class="dataIn">${i.codeName}</td>
                                		</tr>
                                		<tr>
                                			<td class="boldText">금액</td>
                                			<td class="dataIn"><fmt:formatNumber type="number" maxFractionDigits="3" value="${i.totalAmount}" />원</td>
                                		</tr>
                                		                                	
                                	</table>
                                	<!-- Button to Open the Modal -->
							        <!-- NOTE 1: if ( data-toggle="modal" ) not exists, modal window not appeared. -->
							        <!-- NOTE 2: if ( data-target="#myModal" ) not exists or incorrect, modal window not appeared. -->
							        <button type="button" class="btn-modal" id="btn_reviewModal" data-toggle="modal" data-target="#myModal" data-backdrop="static">
							            리뷰 남기기&nbsp;<img src="/resources/assets/img/mypage/pencil.png" width="25px">
							        </button>
							
							        <!-- The Modal -->
							        <!-- NOTE 3: if (  class="modal" ) not exists, the below <div> box appeared without button click. -->
							        <div class="modal" id="myModal">
							
							            <!-- NOTE 4: if ( class="modal-dialog" ) not exists, modal window appeared by full width on viewport. -->
							            <div class="modal-dialog modal-lg">
							
							                <!-- NOTE 5: if ( class="modal-content" ) not exists, the background of modal window not appeared. -->
							                <div class="modal-content">
							
							                    <!-- Modal Header -->
							                    <div class="modal-header">
							                        <h4 class="modal-title">리뷰 남기기</h4>
							
							                        <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
							                        <button type="button" class="close" data-dismiss="modal">&times;</button>
							                    </div>

                                                <form action="/mypage/customerHistoryManage" method="POST">
							                    <!-- 별점주기 -->
												<div class="star-rating">
													<input type="hidden" name="serviceIdIn" value="">
                                                    
												    <input type="radio" id="5-stars" name="grade" value="5" />
												    <label for="5-stars" class="star">&#9733;</label>
												    <input type="radio" id="4-stars" name="grade" value="4" />
												    <label for="4-stars" class="star">&#9733;</label>
												    <input type="radio" id="3-stars" name="grade" value="3" />
												    <label for="3-stars" class="star">&#9733;</label>
												    <input type="radio" id="2-stars" name="grade" value="2" />
												    <label for="2-stars" class="star">&#9733;</label>
												    <input type="radio" id="1-star" name="grade" value="1"  />
												    <label for="1-star" class="star">&#9733;</label>
												    
												</div>
												
							                    <!-- Modal body -->
							                    <div class="modal-body">
							                        <textarea name="revContent" id="revContent" cols="80" rows="15" maxlength="300" placeholder="따뜻한 서비스 후기를 입력 해주세요❤" value=""></textarea>
							                        
							                        <button type="button" class="btn btn-save" id="btn_save" data-dismiss="modal">저장</button>
							                    </div>

                                                
												</form>
							                </div>
							                
							            </div>
							
							        </div>
                                </ul>
                            </span>    
                        </div>
                        </c:forEach>
                    </div>
                </div>
                
                <div id="noHistory">
                	<img src="/resources/assets/img/mypage/NoHistory1.png" class="noHistoryImg">
                	<div class="noHistoryText">
                		<h1>서비스 이용 내역이 없습니다.</h1>
                	</div>
                </div>
                                
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        <script>
        
      	  $(function() {
      		  	// 이력 내역이 없을때
				 if($('input[name=serviceId]').val() == null){
					$('#customerHistory').hide(); 
				 }else{
					 $('#noHistory').hide();
				 }
    
        		<!-- 리뷰남기기 버튼 클릭시 리뷰 DB 불러오기 -->
        		$(".btn-modal").click(function() {
        			
        			var serviceId = $(this).parent().find('input[name="serviceId"]').val();
	        		console.log(serviceId);
	        		
	        		$('input[name=serviceIdIn]').val(serviceId);
	        		
	        		
        			$.ajax({
        				url: "/mypage/customerReviewManage",
        				method: "GET",
        				data: {
        					serviceId : serviceId
        				},
        				dataType : 'json',
        				success: function(data){
        					console.log(data);
        					
        					var revContent = data.revContent;
        					var grade = data.grade;
        					
        					console.log(revContent);        					
        					console.log(grade);
        					
        					$('#revContent').html(revContent);
        					
        					$('input:radio[name="grade"][value='+ grade + ']').prop('checked', true);
        				}
        		
        			});	// ajax
        		
        		})	// click
        		
        		<!-- 리뷰 저장 버튼 클릭시 페이지 전환 없이 데이터 전송 -->
				$("#btn_save").click(function() {
					
					var $parent = $(this).parent().parent();
					var $parents = $(this).parents();
					
					var serviceId = $parent.find('input[name="serviceIdIn"]').val();
	        		console.log('서비스아디 : '+serviceId);
	        		var revContent = $parent.find('textarea[name="revContent"]').val();
	        		console.log(revContent);
	        		var grade = $parent.find('input:radio[name="grade"]:checked').val();
	        		console.log(grade);
	        		var userNo = $parents.find('input[name="userNo"]').val();
	        		console.log("userNo" + userNo);
	        		
	        		
        			$.ajax({
        				url: "/mypage/customerReviewSend",
        				method: "POST",
        				data: {
        					serviceId : serviceId,
        					revContent : revContent,
        					grade : grade,
        					userNo : userNo
        				},
        				success: function(data){
							location.reload();
        				}	// success	
        			});	// ajax
        		
        		})	// click
				        		
				 $(".close").click(function(){
					 location.reload();
				 })
						 
        	})	// jq
        	
        </script>
        
    </body>
</html>
  
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
            <!-- Sidebar-->
            <div class="border-end" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom ">마이페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action p-3" href="userInfoManage">회원정보관리</a>
                    <a class="list-group-item list-group-item-action p-3" href="customerProfileManage">프로필관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="customerHistoryManage">이력/리뷰 관리</a>
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
						
						<c:forEach items="${history}" var="i">
						<div class="history">
                        	<p>서비스 이용 날짜 : <fmt:formatDate pattern="yyyy-MM-dd" value="${i.startDate}" /></p>
                        
                            <span id="historyImage">
                                <img src="${i.proPhoto}" id="proPhoto">
                            </span>
                            <span id="psInfo">
                                <ul id="psInfoUl">
                                	<input type="hidden" name="serviceId" value="${i.serviceId}">
                                	<li>펫시터 닉네임 : ${i.userNickname}</li>
                                    <li>펫시터 연락처 : ${i.userContact}</li>
                                    <li>서비스 유형 : ${i.codeName}</li>
                                    <br>
                                 	  <!-- Button to Open the Modal -->
							        <!-- NOTE 1: if ( data-toggle="modal" ) not exists, modal window not appeared. -->
							        <!-- NOTE 2: if ( data-target="#myModal" ) not exists or incorrect, modal window not appeared. -->
							        <button type="button" class="btn btn-primary btn-modal" data-toggle="modal" data-target="#myModal">
							            리뷰 남기기❤❤
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
													<input type="hidden" name="serviceId" value="${i.serviceId}">
                                                    <input type="hidden" name="userNickname" value="${i.userNickname})">
                                                    
                                                    
												    <input type="radio" id="5-stars" name="grade" value="5" />
												    <label for="5-stars" class="star">&#9829;</label>
												    <input type="radio" id="4-stars" name="grade" value="4" />
												    <label for="4-stars" class="star">&#9829;</label>
												    <input type="radio" id="3-stars" name="grade" value="3" />
												    <label for="3-stars" class="star">&#9829;</label>
												    <input type="radio" id="2-stars" name="grade" value="2" />
												    <label for="2-stars" class="star">&#9829;</label>
												    <input type="radio" id="1-star" name="grade" value="1"  />
												    <label for="1-star" class="star">&#9829;</label>
												    
												</div>
												
							                    <!-- Modal body -->
							                    <div class="modal-body">
							                        <textarea name="revContent" id="revContent" cols="80" rows="15" maxlength="300" placeholder="따뜻한 서비스 후기를 입력 해주세요❤" value=""></textarea>
							                    </div>

                                                
                                                
							                    <!-- Modal footer -->
							                    <div class="modal-footer">
							                        <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
							                        <button type="button" class="btn btn-save" data-dismiss="modal">저장</button>
							                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
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
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        <script>
        
      	  $(function() {
      		  
    
        		<!-- 리뷰남기기 버튼 클릭시 리뷰 DB 불러오기 -->
        		$(".btn-modal").click(function() {
        			
        			var serviceId = $(this).parent().find('input[name="serviceId"]').val();
	        		console.log(serviceId);
					
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
				$(".btn-save").click(function() {
					
									var $parent = $(this).parent().parent();
									
									
									var serviceId = $parent.find('input[name="serviceId"]').val();
					        		console.log(serviceId);
					        		var revContent = $parent.find('textarea[name="revContent"]').val();
					        		console.log(revContent);
					        		var grade = $parent.find('input:radio[name="grade"]:checked').val();
					        		console.log(grade);
					        		//var userNickname = $('input[name="userNickname"]').val();
					        		//console.log(userNickname);
					        		
				        			$.ajax({
				        				url: "/mypage/customerReviewSend",
				        				method: "POST",
				        				data: {
				        					serviceId : serviceId,
				        					revContent : revContent,
				        					grade : grade
				        				},
				        				success: function(data){
				        				}	// success	
				        			});	// ajax
				        		
				        		})	// click
        		
        		
        	})	// jq
        	
        </script>
        
    </body>
</html>
  
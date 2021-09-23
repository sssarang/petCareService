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
        <title>Simple Sidebar - Start Bootstrap Template</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/mypage/sitterHistoryManage.css" rel="stylesheet" />
    </head>
    <body>
        <div class="d-flex" id="wrapper">
			<%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
            <!-- Page content wrapper-->
            <div id="history_wrapper">
              <div id="sitterHistory">
                <br>
                <h1 id="sitterHistory_head">서비스 제공 내역</h1>
                <br>
                <br>
                <c:forEach items="${history}" var="i">
                    <div id="history_list">
                        <p>서비스 제공 날짜 : <fmt:formatDate pattern="yyyy-MM-dd" value="${i.startDate}" /></p>
                                                
                        <div id="historyImage">
                            <img src="${i.proPhoto}" id="proPhoto">
                        </div>
                        <div id="historyInformation">
                            <ul id="historyInformationUl">
                              <li>반려인 닉네임 : ${i.userNickname}</li>
                              <li>반려동물 이름 : ${i.petName}</li>
                              <li>제공 서비스 유형 : ${i.codeName}</li>                                                  
                            </ul>
                            <!-- Button to Open the Modal -->
                            <button type="button" class="btn-primary btn-modal" id="reviewBtn" data-toggle="modal" data-target="#modal">리뷰 확인</button>
                            <!-- The Modal -->
                            <div class="modal" id="modal">        
                              <div class="modal-dialog modal-lg">
                                <div class="modal-content">
        
                                  <!-- Modal Header -->
                                  <div class="modal-header">
                                    <h4 class="modal-title">리뷰 확인</h4>
        
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div> 
                                  <form action="/mypage/sitterHistoryManage" method="POST"> 
                                  <input type="hidden" name="serviceId" value="${i.serviceId}">
                                  <input type="hidden" name="userNickname" value="${i.userNickname}">                                                                                                                                                          	
                                  <!-- Modal body -->
                                  <div class="modal-body">
                                    <div class="review"> 
                                    <h5 class="revrep_head">달린 리뷰</h5>
			                        <c:choose>
                                    <c:when test="${i.grade > 0 && i.grade < 1}">
                                    <span>☆</span>(${i.grade})
                                    </c:when>
                                    <c:when test="${i.grade == 1}">
                                    <span style='color:red;'>★</span>(${i.grade})
                                    </c:when>
                                    <c:when test="${i.grade > 1 && i.grade < 2}">
                                    <span style='color:red;'>★☆</span>(${i.grade})
                                    </c:when>
                                    <c:when test="${i.grade == 2}">
                                    <span style='color:red;'>★★</span>(${i.grade})
                                    </c:when>
                                    <c:when test="${i.grade > 2 && i.grade < 3}">
                                    <span style='color:red;'>★★☆</span>(${i.grade})
                                    </c:when>
                                    <c:when test="${i.grade == 3}">
                                    <span style='color:red;'>★★★</span>(${i.grade})
                                    </c:when>
                                    <c:when test="${i.grade > 3 && i.grade < 4}">
                                    <span style='color:red;'>★★★☆</span>(${i.grade})
                                    </c:when>
                                    <c:when test="${i.grade == 4}">
                                    <span style='color:red;'>★★★★</span>(${i.grade})
                                    </c:when>
                                    <c:when test="${i.grade > 4 && i.grade < 5}">
                                    <span style='color:red;'>★★★★☆</span>(${i.grade})
                                    </c:when>
                                    <c:when test="${i.grade == 5}">
                                    <span style='color:red;'>★★★★★</span>(${i.grade})
                                    </c:when>
                                    <c:otherwise>
                                    <span style='color:red;'>☆☆☆☆☆</span>(0.0)	                              	
                                    </c:otherwise>
                                    </c:choose>
                                    
                                    <label for="revContent"></label>
                                    <input type="text" id="revContent" name="revContent" style="width:740px; height:150px;" value="${i.revContent}" readonly><br>
                                    </div>                                                                                                                
                                      <div class="reply">
                                      <br>
                                      <h5 class="revrep_head">답글 남기기</h5>
                                      
                                      <textarea name="repContent" id="repContent" cols="100" rows="6" maxlength="300"></textarea>
                                      </div>
                                  </div>
            
                                  <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn-primary btn-save" id="reply_btn1" data-dismiss="modal">저장</button>
                                        <button type="button" class="btn-primary" id="reply_btn2" data-dismiss="modal">닫기</button>
                                    </div>
                                  </form>      
                                </div>
                              </div>
                            </div>
                        </div>    
                    </div>    
                </c:forEach>
              </div>  
         	  <div id="noHistory">
	        	  <img src="/resources/assets/img/mypage/NoHistory1.png" class="noHistoryImg">
	        	  <div class="noHistoryText">
	        		<h1>서비스 이용 내역이 없습니다.</h1>
	        	  </div>
              </div>               
            </div> 
        </div>
        
            
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/mypage/sideBarScripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        <script>        
      	  $(function() {
      		  
    		  	// 이력 내역이 없을때
				 if($('input[name=serviceId]').val() == null){
					$('#sitterHistory').hide(); 
					console.log('폼 사라짐!');
				 }else{
					 $('#noHistory').hide();
					 console.log('사진 사라짐!');
				 }
      		  
      		  
        		<!-- 리부확인 버튼 클릭시 리뷰 DB 불러오기 -->
        		$(".btn-modal").click(function() {
        			
        			var serviceId = $(this).parent().find('input[name="serviceId"]').val();
	        		console.log(serviceId);
					
        			$.ajax({
        				url: "/mypage/sitterReplyManage",
        				method: "GET",
        				data: {
        					serviceId : serviceId
        				},
        				dataType : 'json',
        				success: function(data){
        					console.log(data);
        					
        					var repContent = data.repContent;
        					
        					console.log(repContent);        					
        					
        					$('#repContent').html(repContent);       				
        				}
        		
        			});	// ajax
        		
        		})	// click
        		
        		<!-- 리뷰 저장 버튼 클릭시 페이지 전환 없이 데이터 전송 -->
				$(".btn-save").click(function() {
					
					var $parent = $(this).parent().parent();
																		
					var serviceId = $parent.find('input[name="serviceId"]').val();
					console.log(serviceId);
					var repContent = $parent.find('textarea[name="repContent"]').val();
					console.log(repContent);
					var userNickname = $('input[name="userNickname"]').val();
	        		console.log(userNickname);
					        		
	        			$.ajax({
	        				url: "/mypage/sitterReplySend",
	        				method: "POST",
	        				data: {
	        					serviceId : serviceId,
	        					repContent : repContent,
	        					userNickname : userNickname
	        				},
	        				success: function(data){
	                            console.log('success');
	                            location.reload();
	        				}	// success	
	        			});	// ajax
	        		})	// click
        		       		
        	})	// jq
        	
        </script>        
    </body>
</html>
  
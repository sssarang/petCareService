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
				<div class="navTitle">
                	<p class="navTitleIn">마이페이지 > 이력/리뷰 관리</p>
               	</div>
            	<hr class="hhr">
				<!-- Page content-->
				<div id="sitterHistory">
					<div id="sitterHistoryManage">
						<c:forEach items="${history}" var="i">
							<div id="history_list">
								<table>
									<tr>
										<td id="historyTable_td">서비스 제공 날짜 : <fmt:formatDate pattern="yyyy-MM-dd" value="${i.startDate}" /></td>
									</tr>
								</table>
								<div id="historyImage">
									<img src="${i.proPhoto}" id="proPhoto">
								</div>
								<div id="historyInformation">
									<ul id="historyInformationUl">
										<input type="hidden" name="serviceId" value="${i.serviceId}">
										<table id="historyTable">
											<tr>
												<td class="tdText">닉네임</td>
												<td class="tdData">${i.userNickname}</td>
											</tr>
											<tr>
												<td class="tdText">펫이름</td>
												<td class="tdData">${i.petName}</td>
											</tr>
											<tr>
												<td class="tdText">서비스 유형</td>
												<td class="tdData">${i.codeName}</td>
											</tr>																						
										</table>
									
										<!-- Button to Open the Modal -->
										<button type="button" class="btn-primary btn-modal" id="reviewBtn" data-toggle="modal" data-target="#modal1" data-backdrop="static">
										리뷰 확인&nbsp;<img src="/resources/assets/img/mypage/pencil.png" width="25px">
										</button>
										<!-- The Modal -->	
										<div class="modal" id="modal1">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<form action="/mypage/sitterHistoryManage" method="POST"> 
													<input type="hidden" name="serviceId" value="${i.serviceId}">
													<input type="hidden" name="userNickname" value="${userNickname}">
													
													<!-- Modal Header -->
													<input type="hidden" name="serviceIdIn" value="">
													<div class="modal-header">
														<h4 class="modal-title">리뷰 확인</h4>
        
														<button type="button" class="close" data-dismiss="modal" id="close" >&times;</button>
													</div>

													<!-- Modal body -->	
													<div class="modal-body">
														<div class="review">
															<h6 class="revrep">&nbsp;&nbsp;달린 리뷰&nbsp;</h6>
															
															<input type="text" id="grade5" class="star" size="8" readonly value="★★★★★"/>
															<input type="text" id="grade4" class="star" size="8" readonly value="★★★★☆"/>
															<input type="text" id="grade3" class="star" size="8" readonly value="★★★☆☆"/>
															<input type="text" id="grade2" class="star" size="8" readonly value="★★☆☆☆"/>
															<input type="text" id="grade1" class="star" size="8" readonly value="★☆☆☆☆"/>
																	
																													
															<label for="revContent"></label>
															<textarea name="revContent" id="revContent" cols="85" rows="5" maxlength="300" style="resize: none;" placeholder="아직 리뷰가 달리지 않았습니다." value="" readonly></textarea><br>
														</div>
														<div class="reply">
															<br><br>
															<h6 class="revrep">&nbsp;&nbsp;답글 남기기</h6>
															
                                      						<label for="repContent"></label>	
															<textarea name="repContent" id="repContent" cols="85" rows="5" maxlength="300"></textarea>	
														</div>	
														<button type="button" class="btn-primary btn-save" id="saveBtn" placeholder="답글을 달아주세요." >저장</button>
													</div>
													<!-- Modal footer -->
													</form>
												</div>
											</div>
										</div>
									</ul>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div id="noHistory">
					<img src="/resources/assets/img/mypage/NoHistory1.png" class="noHistoryImg">
					<div class="noHistoryText">
						<h1>서비스 제공 내역이 없습니다.</h1>
					</div>
				</div>
			</div>
		</div>
		
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>        
      		$(function() {   
      		  
  		  		// 이력 내역이 없을때
				if($('input[name=serviceId]').val() == null){
					$('#sitterHistory').hide(); 
				}else{
					$('#noHistory').hide();
				}
  		  		
  		  		$("#close").click(function(){
  		  			location.reload();	
  		  		})
      		        		  
        		<!-- 리부확인 버튼 클릭시 리뷰 DB 불러오기 -->
        		$(".btn-modal").click(function() {
        			
        			var serviceId = $(this).parent().find('input[name="serviceId"]').val();
	        		console.log(serviceId);
	        		
	        		$('input[name=serviceIdIn]').val(serviceId);
        		
	        			$.ajax({
	        				url: "/mypage/sitterReviewManage",
	        				method: "GET",
	        				data: {
	        					serviceId : serviceId
	        				},
	        				dataType : 'json',
	        				success: function(data){
	        					console.log(data);  
	        					
	        					var grade = data.grade;
	        					var revContent = data.revContent;
	        					
	        					console.log(grade);
	        					console.log(revContent);
	        						        					
	   							$('#grade').val(grade);
	        					$('#revContent').html(revContent); 
	        					
	        					if(grade == 5){
	        						$('#grade4').hide();
	        						$('#grade3').hide();
	        						$('#grade2').hide();
	        						$('#grade1').hide();     
	        					}	        					
	        					else if(grade == 4){
	        						$('#grade5').hide();
	        						$('#grade3').hide();
	        						$('#grade2').hide();
	        						$('#grade1').hide();     
	        					}
	        					else if(grade == 3){
	        						$('#grade5').hide();
	        						$('#grade4').hide();
	        						$('#grade2').hide();
	        						$('#grade1').hide();     
	        					}
	        					else if(grade == 2){
	        						$('#grade5').hide();
	        						$('#grade4').hide();
	        						$('#grade3').hide();
	        						$('#grade1').hide();     
	        					}
	        					else if(grade == 1){
	        						$('#grade5').hide();
	        						$('#grade4').hide();
	        						$('#grade3').hide();
	        						$('#grade2').hide();     
	        					}
	        					else if(grade == null || grade == ""){
	        						$('#grade5').hide();
	        						$('#grade4').hide();
	        						$('#grade3').hide();
	        						$('#grade2').hide(); 
	        						$('#grade1').hide();
	        					}
	        				}        		
	        			});	// ajax	 
	        			
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
																		
					var serviceId = $parent.find('input[name="serviceIdIn"]').val();
					console.log(serviceId);
					var repContent = $('textarea[name="repContent"]').val();
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
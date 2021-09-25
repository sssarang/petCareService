<%@page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>


<!-- Core theme CSS -->
<link rel="stylesheet" href="/resources/css/search/search.css" />
<!-- Font-family-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
 
 <!----------------- 전체 div ----------------->
 <div id="wrapper">
 
     <!-------------필터링검색----------------->
     <aside>
         <div class="sidebar-search">
         
            <!-- <div class="title"><span>상세조건선택</span></div> -->
			
            <form id="searchForm" name = "filterForm" onsubmit="return fnCheck();">
            	<input type="hidden" id = "currPageNo" name="currPage" value="1">	
	       		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	       		<input type="hidden" name="pagesPerPage" value="${pageMaker.cri.pagesPerPage}">
	       		
	            <div class="form-group">
                    <p id="searchTitle">상세검색</p>
                    <hr>
                    <p></p>
                    <p>Pet Type</p>
                    <input type="radio" id="dog" name="petType" value="dog"
                    	    <c:if test='${filter.petType eq "dog"}'>checked</c:if>>
                    <label for="dog">&nbsp;강아지(Dog)</label>
                    <input type="radio" id="cat" name="petType" value="4"
                    		<c:if test='${filter.petType eq "4"}'>checked</c:if>>
                    <label for="cat">&nbsp;고양이(Cat)</label>
                </div>
                 
                 <div class="form-group">
                     <div class="btn-toggle">
                         <input type="radio" id="small" name="dogType" value="3" checked><label for="small">소형견<p style="font-size: 0.7rem; line-height: 1px;">(7kg 미만)</p></label>
                         <input type="radio" id="middle" name="dogType" value="2"><label for="middle">중형견<p style="font-size: 0.7rem; line-height: 1px;">(7 - 14.9kg)</p></label>
                         <input type="radio" id="large" name="dogType" value="1" ><label for="large">대형견<p style="font-size: 0.7rem; line-height: 1px;">(15kg 이상)</p></label>
                     </div>
                 </div>     
                 
                 <hr>
                 
                 <div class="form-group">
                     <p>Service Location</p>
                     <ul>
                     <li>시/도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 
                     	<select id="sido" title="시/도선택" name="addrSido">
                        	<option value="">::시/도::</option>
                        </select>
                     <input type="hidden" id="addrSido" name="addrSidoNm" value="${filter.addrSidoNm}">   
                     <li class="sigugunException" >시/군/구 | 
                     	<select id="sigugun" class="sigugunException" title="시/군/구선택" name="addrSigugun">
                        	<option value="">::시/군/구::</option>
                     	</select>
                     	<input type="hidden" id="addrSigugun" name="addrSigugunNm" value="${filter.addrSigugunNm}">
                     <li>읍/면/동 | 
                     	<select id="dong" title="읍/면/동선택" name="addrDong">
                        	<option value="">::읍/면/동::</option>
                     	</select>
                     	<input type="hidden" id="addrDong" name="addrDongNm" value="${filter.addrDongNm}">
                     </ul>
                 </div>

                 <hr>
                 
                 <div class="form-group">
                     <p>Service Type</p>
                     <span>
	                     <p><input id="careAll" type="checkbox" name="serviceType" value="11"><label for="careAll">&nbsp; 돌봄(All Day)</label></p>
	                     <p><input id="careHalf" type="checkbox" name="serviceType" value="12"><label for="careHalf">&nbsp; 돌봄(Half Day)</label></p>
	                     <p><input id="visitAll" type="checkbox" name="serviceType" value="13"><label for="visitAll">&nbsp; 방문(All Day)</label></p>
	                     <p><input id="visitHalf" type="checkbox" name="serviceType" value="14"><label for="visitHalf">&nbsp; 방문(Half Day)</label></p>
					</span>
                 </div>

                 <hr>

				 <div class="form-group">
                     <p>Service Date</p>
                     <span>
                         시작일 | <input type="text" class="flatpickr" data-id="rangePlugin" name="startDate" placeholder="Start date" value="${filter.startDate}" readonly="readonly"/><br>
                         종료일 | <input type="text" class="flatpickr" id="secondRangeInput" name="endDate" placeholder="End date" value="${filter.endDate}" readonly="readonly"/> 
                     </span>
                 </div>

                 <hr>

                 <div class="form-group">
                     <p>Service Cost(1Day)</p>  
                     
                     <span>
                         <input id="min" type="number" name="minPrice" value="${filter.minPrice}" min="1000" max="500000" placeholder="최소"/>&nbsp;원&nbsp;-&nbsp;
                         <input id="max" type="number" name="maxPrice" value="${filter.maxPrice}" min="1000" max="500000" placeholder="최대"/>&nbsp;원
                     </span>
                     <br>
                     
                 </div>

                 <hr>

                 <div class="form-group">
                     <p>Petsitter Skill</p>  
                         <div class="checklist"> 
                             <p><input type="checkbox" name="skillType" id="check1" class="checklist-input" value="21">
                             <label for="check1">&nbsp; 약 먹이기 가능여부</label>
                             </p>

                             <p><input type="checkbox" name="skillType" id="check2" class="checklist-input" value="22">
                             <label for="check2">&nbsp; 노령견 경험유무</label>
                             </p>

                             <p><input type="checkbox" name="skillType" id="check3" class="checklist-input" value="23">
                             <label for="check3">&nbsp; 환견/환묘 경험유무</label>
                             </p>
                         
                             <p><input type="checkbox" name="skillType" id="check4" class="checklist-input" value="24">
                             <label for="check4">&nbsp; 애견관련 업종 경험유무</label>
                             </p>
                         </div>
                 </div>
                 
                 <div class="form-group">
                     <input type="submit" id="searchBtn" value="검색">
            	 </div>

             </form>
             
         </div>
     </aside>
     
     
     <!-------------펫시터리스트----------------->
     <aside>
         <div class="sidebar-list">
              <!-- <div class="title">Pet Sitter List</div> --> 
                  
              <div id="psList">
               	 <table id="psTable">
						<colgroup>
							<col>
						</colgroup>
	                    <tbody>
		                    <c:forEach items="${list}" var="ps">
		                          <tr>
		                          <c:choose>
			                          <c:when test="${ps.proPhoto == null}">
			                          	<td rowspan="3" class="line1">
			                          		<div id="pslistphoto">
			                          			<a href="javascript:fnProfileOn(${ps.userNo});">
			                          				<img id="listphoto" src='/resources/assets/img/search/petsitter.jpg'>
			                          			</a>
			                          			<input type="hidden" class="userNo" name="userNo" value="${ps.userNo}">
		                              		</div>
		                              	</td>
			                          </c:when>
			                          <c:otherwise>
		                              	<td rowspan="3" class="line1">
			                          		<div id="pslistphoto">
			                          			<a href="javascript:fnProfileOn(${ps.userNo});">
			                          				<img id="listphoto" src='${ps.proPhoto}'>
												</a>
			                          			<input type="hidden" class="userNo" name="userNo" value="${ps.userNo}">
		                              		</div>
		                              	</td>
		                              </c:otherwise>
		                          </c:choose>
		                              
		                              <td class="line2">닉네임</td>
		                              <td class="line3">${ps.userNickname}
 		                              		<%-- <input type="button" class="profileBtn" onclick="fnProfileOn(${ps.userNo})" name="detail" value="프로필보기"> --%>		                              
		                              </td>
		                          </tr>
		                          <tr>
		                              <td class="line2">지&nbsp;&nbsp;&nbsp;역</td>
		                              <td class="line3">${ps.userAddress}</td>
		                          </tr>
		                          <tr>
		                              <td class="line2">평&nbsp;&nbsp;&nbsp;점</td>
		                              <c:choose>
		                              	<c:when test="${ps.avg > 0 && ps.avg < 1}">
		                                	<td class="line3"><span class="star">☆</span>(${ps.avg})</td>
		                              	</c:when>
		                              	<c:when test="${ps.avg == 1}">
		                                	<td class="line3"><span class="star">★</span>(${ps.avg})</td>
		                              	</c:when>
		                              	<c:when test="${ps.avg > 1 && ps.avg < 2}">
		                                	<td class="line3"><span class="star">★☆</span>(${ps.avg})</td>
		                              	</c:when>
		                              	<c:when test="${ps.avg == 2}">
		                                	<td class="line3"><span class="star">★★</span>(${ps.avg})</td>
		                              	</c:when>
		                              	<c:when test="${ps.avg > 2 && ps.avg < 3}">
		                                	<td class="line3"><span class="star">★★☆</span>(${ps.avg})</td>
		                              	</c:when>
		                              	<c:when test="${ps.avg == 3}">
		                                	<td class="line3"><span class="star">★★★</span>(${ps.avg})</td>
		                              	</c:when>
		                              	<c:when test="${ps.avg > 3 && ps.avg < 4}">
		                                	<td class="line3"><span class="star">★★★☆</span>(${ps.avg})</td>
		                              	</c:when>
		                              	<c:when test="${ps.avg == 4}">
		                                	<td class="line3"><span class="star">★★★★</span>(${ps.avg})</td>
		                              	</c:when>
		                              	<c:when test="${ps.avg > 4 && ps.avg < 5}">
		                                	<td class="line3"><span class="star">★★★★☆</span>(${ps.avg})</td>
		                              	</c:when>
		                              	<c:when test="${ps.avg == 5}">
		                                	<td class="line3"><span class="star">★★★★★</span>(${ps.avg})</td>
		                              	</c:when>
		                              	<c:otherwise>
		                                	<td class="line3"><span class="star">☆☆☆☆☆</span>(0.0)</td>		                              	
		                              	</c:otherwise>
		                              </c:choose>
		                          </tr>
	 	                    </c:forEach>
	                    </tbody>
                    </table>
                    
          	 	<div id="pagination">
        	
	        		<ul>
	        			<c:if test="${pageMaker.prev}">
	        				<li class="prev"><a class="prev" href="javascript:fnPageMove('${pageMaker.startPage - 1}')">&lt;</a> </li>
	        			</c:if> 
	        			
	        			<!-- begin ~ end 까지 반복하고, 현재의 번호값을 var속성에 넣어준다. -->
	        			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
	        				
	        				 <li class="${pageMaker.cri.currPage == pageNum? 'currPage' : ''}">
			                     <a    
			                        class="${pageMaker.cri.currPage == pageNum? 'currPage' : ''}"
			                        href="javascript:fnPageMove('${pageNum}')">
			                        ${pageNum}
			                     </a>
			                  </li>                     
	        			</c:forEach>
	        			
	        			<c:if test="${pageMaker.next}">
	        				<li class="next"><a class="next" href="javascript:fnPageMove('${pageMaker.endPage + 1}')">&gt;</a></li>
	        			</c:if>
	        			
	        		</ul>
        		
        		</div>
        		
          	 </div>
              	 
          </div>
     </aside>   
     

     <!-------------content 1. 지도조회----------------->
     <section>
         <div id="map" class="content" >
         </div>
     </section>

     <!-------------content 2. 검색결과 없을때--------------->
	 <div id="noSearch">
	 	<div class="noSearch"> 
	 		<img id="imgId1" src="/resources/assets/img/search/g.jpg">
	 		<span>요청하신 내역에 대한 검색결과가 없습니다. <br>
	 		선택하신 검색항목을 확인해주세요.</span>
	 	</div>
	 	<img id="imgId2" src="/resources/assets/img/search/gg.jpg">
	 </div>

     <!-------------content 3. 펫시터프로필----------------->

     <div class="profile">
        <div class="profile_close" id="profileClose"><a>close</a></div>
        
        <div id="profile_wrap">
        	<h1>프로필</h1>
        	<hr>
        	<header>
	        	<div id="profile_head">
	        		<div id="profile_photo" class="flex_item" >
					    <img id="photo" src="">
					</div>
	        		<div id="psInfo" class="flex_item">
	        			<h3 align="right"><span id="star"></span><span id="psAvg"></span></h3>
	        			<h4>닉네임 : <span id="psNickname"></span></h4>
	        			<hr>
	        			<h4>지&nbsp;&nbsp;&nbsp;역 : <span id="psAddress"></span></h4>
	        			<div id="psIntroduce"></div> 
		        		<form action="/search/matching" method="GET">
			        		<input type="hidden" id="matching" name="userNo" value="">        			
			        		<input type="submit" id="matchingBtn" value="matching">  
		        		</form>  			
	        		</div>        		
	        	</div>
			</header>
			
			<div id="profile_content">
				<aside id="profile_side">
					<div id="serviceInfo" class="flex_item">
						<div id = service1>						
		        			<h5>서비스제공 날짜</h5>
		        			<span id="psServiceDate"></span>
		        			<table id="calendar">
						    </table>
						</div>
						
						<div id = service2>						
							<h5>반려동물 유형</h5>
		        			<ul class="liImg" id="psPetTypeCode" style="padding: 7px 1px; margin: 0;"></ul>
						</div>
	        			
						<div id = service3>						
		        			<h5>서비스 유형 및 비용</h5>
		        			<ul class="liImg" id="psServiceTypeCode" style="padding: 7px 1px; margin: 0;"></ul>
						</div>
	        			
						<div id = service4>						
		        			<h5>스킬</h5>
		        			<ul class="liImg" id="psSkillTypeCode" style="padding: 7px 1px; margin: 0;"></ul>
						</div>
	        			
	        		</div>
				</aside>
	        	
	        	<section id="profile_body">
	        		<div class="active_photo"><!-- 활동사진 --> </div>

		        	<div class="black_bg"></div>
		        	<div id="photomodalBox">
		        		<div class="photoModal" >  <!-- 모달창-활동사진 --> </div>
		        	</div>
		        		        		
	        		<div id="review-list" class="flex_item"> <!-- 리뷰리스트 출력 --> </div>
		        	
		        	<div class="black_bg"></div>
		        	<div id="modalBox">
		        		<div class="reviewModal" >  <!-- 모달창-리뷰 --> </div>
		        	</div>
		        	
	        	</section>
			</div>
        </div>
     </div>            

 </div>

 <!----------------- float 해제----------------->
 <div id="clear"></div>    
 
 <!----------------- 페이징 처리----------------->
 <script>
	 
	 function fnPageMove(page){
		 var urlParams = new URLSearchParams(location.search);
		 
		 if(page != urlParams.get("currPage")){
			 urlParams.set("currPage",page);
			 location.href="/search/main?"+urlParams.toString();	 
	
		 } //if
		 
	 } //fnPageMove
	 
 </script>
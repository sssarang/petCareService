<%@page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- Core theme CSS -->
<link rel="stylesheet" href="/resources/css/search/search.css" />
<!-- Font-family-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
 
 
 <!----------------- 전체 div ----------------->
 <div id="wrapper">
 
     <!-------------필터링검색----------------->
     <aside>
         <div class="sidebar-search">
         
            <div class="title"><span>상세조건선택</span></div>

            <form id="searchForm">
                <div class="form-group">
                    <p>Pet Type</p>
                    <input type="radio" id="dog" name="petType" value="dog"
                    	    <c:if test='${filter.petType eq "dog"}'>checked</c:if>>
                    <label for="dog">&nbsp;강아지</label>
                    <input type="radio" id="cat" name="petType" value="4"
                    		<c:if test='${filter.petType eq "4"}'>checked</c:if>>
                    <label for="cat">&nbsp;고양이</label>
                </div>
                 
                 <div class="form-group">
                     <div class="btn-toggle">
                         <input type="radio" id="small" name="dogType" value="3" checked><label for="small">소형견</label>
                         <input type="radio" id="middle" name="dogType" value="2"><label for="middle">중형견</label>
                         <input type="radio" id="large" name="dogType" value="1" ><label for="large">대형견</label>
                     </div>
                 </div>     
                 
                 <hr>
                 
                 <div class="form-group">
                     <p>Service Location</p>
                     <ul>
                     <li>시/도 : 
                     	<select id="sido" title="시/도선택" name="addrSidoList">
                        	<option value="">::시/도::</option>
                        </select>
                     <input type="hidden" id="addrSido" name="addrSido" value="">   
                     <li class="sigugunException" >시/군/구 : 
                     	<select id="sigugun" class="sigugunException" title="시/군/구선택" name="addrSigugunList">
                        	<option value="">::시/군/구::</option>
                     	</select>
                     	<input type="hidden" id="addrSigugun" name="addrSigugun" value="">
                     <li>읍/면/동 : 
                     	<select id="dong" title="읍/면/동선택" name="addrDongList">
                        	<option value="">::읍/면/동::</option>
                     	</select>
                     	<input type="hidden" id="addrDong" name="addrDong" value="">
                     </ul>
                 </div>

                 <hr>
                 
                 <div class="form-group">
                     <p>Service Type</p>
                     <input id="careAll" type="checkbox" name="serviceType" value="11"><label for="careAll">&nbsp; 돌봄(All Day)</label><br>
                     <input id="careHalf" type="checkbox" name="serviceType" value="12"><label for="careHalf">&nbsp; 돌봄(Half Day)</label><br>
                     <input id="visitAll" type="checkbox" name="serviceType" value="13"><label for="visitAll">&nbsp; 방문(All Day)</label><br>
                     <input id="visitHalf" type="checkbox" name="serviceType" value="14"><label for="visitHalf">&nbsp; 방문(Half Day)</label><br>
                 </div>

                 <hr>

				 <div class="form-group">
                     <p>Service Date</p>
                     <span>
                         <p/> 시작일 : <input type="text" class="flatpickr" data-id="rangePlugin" name="startDate" placeholder="Start" value="${filter.startDate}" readonly="readonly"/>
                         <p/> 종료일 : <input type="text" class="flatpickr" id="secondRangeInput" name="endDate" placeholder="End" value="${filter.endDate}" readonly="readonly"/> 
                     </span>
                 </div>

                 <hr>

                 <div class="form-group">
                     <p>Service Cost(1Day)</p>  
                     
                     <span>
                         <input id="cost" type="number" name="minPrice" value="" min="1000" max="500000" placeholder="최소"/>&nbsp;원&nbsp;&nbsp;-&nbsp;&nbsp;
                         <input id="cost" type="number" name="maxPrice" value="" min="1000" max="500000" placeholder="최대"/>&nbsp;원
                     </span>
                     <br>
                     
                 </div>

                 <hr>

                 <div class="form-group">
                     <p>Petsitter Skill</p>  
                         <div class="checklist"> 
                             <p><input type="checkbox" name="skillType" id="check1" class="checklist-input" value="21">
                             <label for="check1">약 먹이기 가능여부</label>
                             </p>

                             <p><input type="checkbox" name="skillType" id="check2" class="checklist-input" value="22">
                             <label for="check2">노령견 경험유무</label>
                             </p>

                             <p><input type="checkbox" name="skillType" id="check3" class="checklist-input" value="23">
                             <label for="check3">환견/환묘 경험유무</label>
                             </p>
                         
                             <p><input type="checkbox" name="skillType" id="check4" class="checklist-input" value="24">
                             <label for="check4">애견관련 업종 경험유무</label>
                             </p>
                         </div>
                 </div>

             </form>
             <div class="form-group">
                     <input type="button" id="searchBtn" class="btn btn-primary py-3 px-5">
             </div>
         </div>
     </aside>
     
     
     <!-------------펫시터리스트----------------->
     <aside>
         <div class="sidebar-list">
              <div class="title">Pet Sitter List</div>
                  
              <div id="psList">
               	 <table id="psTable" class="table table-hover">
						<colgroup>
							<col>
						</colgroup>
	                    <tbody>
		                    <c:forEach items="${list}" var="ps">
		                          <tr>
		                              <td rowspan="3" class="line">사진 ${ps.proPhoto}
		                              <input type="button" class="profileBtn" onclick="fnProfileOn()" name="detail" value="프로필보기">
		                              </td>
		                              <td class="line">이 름 : ${ps.userNickname}</td>
		                          </tr>
		                          <tr>
		                              <td class="line">평 점 : 5.0(★★★★★)</td>
		                          </tr>
		                          <tr>
		                              <td class="line">지 역 : ${ps.userAddress}</td>
		                          </tr>
	 	                    </c:forEach>
	                    </tbody>
                    </table>
          	 </div>
              	 
          </div>
     </aside>   
     

     <!-------------지도조회----------------->
     <section>
         <div id="map" class="content" ></div>
     </section>



     <!-------------펫시터프로필----------------->

     <div class="profile">
        <div class="profile_close" id="profileClose"><a href="">close</a></div>
        
        <div id="profile_wrap">
        	<h1>프로필</h1>
        	<hr>
        	<header>
	        	<div id="profile_head">
	        		<div id="profile_photo" class="flex_item" >
					    <img id="photo" src="">
					</div>
	        		<div id="psInfo" class="flex_item">
	        			<h4>닉네임 : </h4>
	        			<hr>
	        			<h4>평 점 : </h4>
	        			<hr>
	        			<h4>지 역 : </h4>
	        			<hr>
	        			<h4>소개글 : </h4>
		        		<hr>
		        		<input type="button" name="matching" value="matching">        			
	        		</div>
	        	</div>
			</header>
			
			<div id="profile_content">
				<aside id="profile_side">
					<div id="serviceInfo" class="flex_item">
	        			서비스 정보
	        		</div>
				</aside>
	        	
	        	<section id="profile_body">
	        		
	        		<div id="active_photo" class="flex_item">
	        			활동사진
	        		</div>
	        		<div id="review-list" class="flex_item">
	        			리뷰목록
	        		</div>
	        	</section>
			</div>
        </div>
     </div>            

 </div>

 <!----------------- float 해제----------------->
 <div id="clear"></div>    


 <!----------------- script --------------------->
 
 <script>
	<!----------금액에 콤마 찍기-------------->
 	const input = document.querySelector('#cost');
 	input.addEventListener('keyup', function(e){
 		let value = e.target.value;
     	value = Number(value.replaceAll(',', ''));
     	
     	if(isNaN(value)) {         //NaN인지 판별
     		input.value = 0;   
     	} else {                   //NaN이 아닌 경우
     	    const formatValue = value.toLocaleString('ko-KR');
     	    input.value = formatValue;
     	}
 	})
	
	<!----------해당 id의 value로 주소 name 가져오기-------------->
	
	$("#sido").change(function(){
		var selectVal  = $("#sido option:selected").text();
		
		$("#addrSido").val(selectVal);
	})
	
	$("#sigugun").change(function(){
		var selectVal  = $("#sigugun option:selected").text();
		
		$("#addrSigugun").val(selectVal);
	})
	
	$("#dong").change(function(){
		var selectVal  = $("#dong option:selected").text();
		
		$("#addrDong").val(selectVal);
	})

	
	
	<!-------------필터조건에 따른 리스트 생성----------------->
	
	function fnSearch(){
		$.ajax({
	          url:"/search/searchList"
	        , method : 'POST'
	        , data : $("form").serialize() 
	        , success :  function(result){
	        	//프로필창 닫기
	        	fnProfileOff();
	        	
	        	var list = result.list;
	        	var strHtml = "";
	        	$.each(list, function(i){
	        		strHtml += "<tr>";
	        		strHtml += "<td rowspan='3' class='line'>사진"+ list[i].proPhoto;
	        		strHtml += "<input type='button' class='profileBtn' onclick='fnProfileOn()' name='detail' value='프로필보기'></td>";
	        		strHtml += "<td class='line'>이 름 :"+ list[i].userNickname+"</td>";
	        		strHtml += "</tr>";
	        		strHtml += "<tr>";
	        		strHtml += "<td class='line'>평점 :"+"5.0(★★★★★)"+"</td>";
	        		strHtml += "</tr>";
	        		strHtml += "<tr>";
	        		strHtml += "<td class='line'>지역 :"+list[i].userAddress+"</td>";
	        		strHtml += "</tr>";
	        	})
	        	
	        	//html에 strHtml 내용 추가 --> 리스트 생성
	        	$("#psTable").html(strHtml);
	        	
	        	//map API 호출+출력
	        	displayPlaces(list);	
	        }
	    })	
	} //fnSearch

	document.getElementById("searchBtn").addEventListener("click", fnSearch);

	
	<!-------------선택된 펫시터프로필 생성----------------->
	
	function fnProfileOn(){
		$('.profile').show();
//		document.querySelector('.profile').style.display ='block';
	} //fnProfileOn

	function fnProfileOff(){
    	$('.profile').hide();    			
//		document.querySelector('.profile').style.display ='none';
	} //fnProfileOff

	document.getElementById("profileClose").addEventListener("click", fnProfileOff);
	

    
 	
 </script>
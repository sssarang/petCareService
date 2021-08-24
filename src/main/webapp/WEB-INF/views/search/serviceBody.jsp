<%@page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!-- Core theme CSS -->
<link rel="stylesheet" href="/resources/css/search/search.css" />
<!-- Font-family-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<!-- address.js-->
<script src="/resources/js/common/address.js" type="application/javascript"></script>
 
 
 <!----------------- 전체 div ----------------->
 <div id="wrapper">
     <!-------------필터링검색----------------->
     <aside>
         <div class="sidebar-search">
         
            <div class="title"><span>상세조건선택</span></div>

            <form action="#">
                <div class="form-group">
                    <p>Pet Type</p>
                    <input type="radio" id="dog" name="petType" value="dog">
                    <label for="dog">&nbsp;강아지</label>
                    <input type="radio" id="cat" name="petType" value="cat">
                    <label for="cat">&nbsp;고양이</label>
                </div>
                 
                 <div class="form-group">
                     <div class="btn-toggle">
                         <input type="radio" id="small" name="dog-size" value="small"><label for="small">소형견</label>
                         <input type="radio" id="middle" name="dog-size" value="middle"><label for="middle">중형견</label>
                         <input type="radio" id="large" name="dog-size" value="large"><label for="large">대형견</label>
                     </div>
                 </div>     
                 
                 <hr>
                 
                 <div class="form-group">
                     <p>Service Type</p>
                     <input id="careAll" type="checkbox" name="serviceType" value="careAll"><label for="careAll">&nbsp; 돌봄(All Day)</label><br>
                     <input id="careHalf" type="checkbox" name="serviceType" value="careHalf"><label for="careHalf">&nbsp; 돌봄(Half Day)</label><br>
                     <input id="visitAll" type="checkbox" name="serviceType" value="visitAll"><label for="visitAll">&nbsp; 방문(All Day)</label><br>
                     <input id="visitHalf" type="checkbox" name="serviceType" value="visitHalf"><label for="visitHalf">&nbsp; 방문(Half Day)</label><br>
                 </div>

                 <hr>

                 <div class="form-group">
                     <p>Service Location</p>
                     <ul>
                     <li>시/도 : 
                     	<select id="sido" title="시/도선택">
                        	<option value="">::시/도::</option>
                        </select>
                     <li>시/군/구 : 
                     	<select id="sigugun" title="시/군/구선택">
                        	<option value="">::시/군/구::</option>
                     	</select>
                     <li>읍/면/동 : 
                     	<select id="dong" title="읍/면/동선택">
                        	<option value="">::읍/면/동::</option>
                     	</select>
                     </ul>
                 </div>

                 <hr>

                 <div class="form-group">
                     <p>Service Date</p>
                     <span>
                         <input type="text" class="selector" placeholder="날짜를 선택하세요." />
						 <a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
                         
                         <input type="text" class="selector" placeholder="날짜를 선택하세요." />
						 <a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
                     </span>
                 </div>

                 <hr>

                 <div class="form-group">
                     <p>Service Cost(1Day)</p>   
                     <span>
                         <input type="number" value="1000" name="low-cost" min="1000" max="250000" />   -
                         <input type="number" value="500000" name="high-cost" min="250000" max="500000" />
                     </span>
                     <br>
                     <br>
                     <div class="range-slider">
                         <input type="range" name="low-cost" value="1000" min="1000" max="250000" step="1000" />
                         <input type="range" name="high-cost" value="500000" min="250000" max="500000" step="1000" />
                     </div>
                 </div>

                 <hr>

                 <div class="form-group">
                     <p>Petsitter Skill</p>  
                         <div class="checklist"> 
                             <p><input type="checkbox" name="petsitterSkill" id="check1" class="checklist-input">
                             <label for="check1">약 먹이기 가능여부</label>
                             </p>

                             <p><input type="checkbox" name="petsitterSkill" id="check2" class="checklist-input">
                             <label for="check2">노령견 경험유무</label>
                             </p>

                             <p><input type="checkbox" name="petsitterSkill" id="check3" class="checklist-input">
                             <label for="check3">환견/환묘 경험유무</label>
                             </p>
                         
                             <p><input type="checkbox" name="petsitterSkill" id="check4" class="checklist-input">
                             <label for="check4">애견관련 업종 경험유무</label>
                             </p>
                         </div>
                 </div>
                                     
                 <div class="form-group">
                     <input type="submit" value="search" class="btn btn-primary py-3 px-5">
                 </div>

             </form>
         </div>
     </aside>

     <!-------------펫시터리스트----------------->
     <aside>
         <div class="sidebar-list">
              <div class="title">Pet Sitter List</div>
                  
                  <div id="psList" class="">
                      <ul id="psList"></ul>
     			      <div id="pagination"></div>
              	 </div>
              	 
          </div>
     </aside>   

     <!-------------지도조회----------------->
     <section>
         <div id="map" class="content" ></div>
     </section>

 </div>

 <!----------------- float 해제----------------->
 <div id="clear"></div>    



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
        <title>myPageMainBody.jsp</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/mypage/myPageMain.css" rel="stylesheet" />
        <!-- Google fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
        
      
	      
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
                <div class="container-fluid">
                     <!-- <img src="/resources/assets/img/mypage/main/pet1.jpg" id="mypageMainImg"/>-->
                     <div id="slideShow"> 
                     	<ul class="slides"> 
                     		<li><img src="/resources/assets/img/mypage/main/pet1.jpg"></li> 
                     		<li><img src="/resources/assets/img/mypage/main/pet2.jpg"></li> 
                     		<li><img src="/resources/assets/img/mypage/main/pet3.jpg"></li> 
                     		<li><img src="/resources/assets/img/mypage/main/pet4.jpg"></li> 
                     		<li><img src="/resources/assets/img/mypage/main/pet5.jpg"></li> 
                     		<li><img src="/resources/assets/img/mypage/main/pet6.jpg"></li> 
                     	</ul> 
                     	<p class="controller"> 
                     	<!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 --> 
                     	<span class="prev">&lang;</span> 
                     	<span class="next">&rang;</span> 
                     	</p> 
                     </div>
                  
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/mypage/sideBarScripts.js"></script>
        <!-- jquery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        
        
        
        <script>
        	let slides = document.querySelector(".slides"); 
        	let slideImg = document.querySelectorAll(".slides li"); 
        	currentIdx = 0; slideCount = slideImg.length; prev = document.querySelector(".prev"); 
        	next = document.querySelector(".next"); 
        	slideWidth = 300; slideMargin = 100; 
        	slides.style.width = (slideWidth + slideMargin)*slideCount + "px"; 
        	
        	function moveSlide(num){ 
        		// 왼쪽으로 400px씩 이동 
        		slides.style.left = -num * 400 + "px"; currentIdx = num; } prev.addEventListener('click', function(){ 
        		// 첫 번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 
        		// currentIdx !==0일때만 moveSlide 함수 불러옴 
        		if(currentIdx !== 0) moveSlide(currentIdx - 1); }); 
        		
        		next.addEventListener('click', function(){ 
        			// 마지막 슬라이드로 표시 됐을때는 다음 버튼 눌러도 아무런 반응 없게 하기 위해 
        			// currentIdx !==slideCount - 1 일때만 moveSlide 함수 불러옴 
        			if(currentIdx !== slideCount - 1) moveSlide(currentIdx + 1); })

        </script>
        
    </body>
</html>
  
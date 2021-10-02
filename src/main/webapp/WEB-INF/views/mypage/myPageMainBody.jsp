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
        <!-- Swiper -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
      
	      
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
                <!-- 클래스명은 변경하면 안 됨 -->
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide"><img src="/resources/assets/img/mypage/main/pet1.jpg"></div>
						<div class="swiper-slide"><img src="/resources/assets/img/mypage/main/pet2.jpg"></div>
						<div class="swiper-slide"><img src="/resources/assets/img/mypage/main/pet3.jpg"></div>
						<div class="swiper-slide"><img src="/resources/assets/img/mypage/main/pet4.jpg"></div>
						<div class="swiper-slide"><img src="/resources/assets/img/mypage/main/pet5.jpg"></div>
						<div class="swiper-slide"><img src="/resources/assets/img/mypage/main/pet6.jpg"></div>
						<div class="swiper-slide"><img src="/resources/assets/img/mypage/main/pet7.png"></div>
						<div class="swiper-slide"><img src="/resources/assets/img/mypage/main/pet8.jpeg"></div>
					</div>
				
					<!-- 네비게이션 -->
					<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
					<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
				
					<!-- 페이징 -->
					<div class="swiper-pagination"></div>
				</div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jquery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        
        
        
        <script>
	        new Swiper('.swiper-container', {
	
	        	// 자동높이 사용여부 : 사용하지 않을시 기본값은 false
	        	autoHeight : true,
	        	effect : 'fade',
	
	        	loop : true, // 슬라이드 반복
	        	autoplay : { // 자동 재생
	        		delpay : 1500
	        	},
	        	speed : 2000,
	        	
	        	pagination : { // 페이징
	        		el : '.swiper-pagination',
	        		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	        	},
	        	navigation : { // 네비게이션
	        		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
	        		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	        	},
	        });
        </script>
        
    </body>
</html>
  
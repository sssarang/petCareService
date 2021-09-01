<%@page 
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
	
	    <title>쓰담쓰담 | 펫시터 예약 서비스</title>
	
	    <!-- Favicon-->
	    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon2.ico" />
	    <!-- Bootstrap icons-->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
	    <!-- Google fonts-->
	    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
	
		<!-- Jquery -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
		
		<!-- flatpickr -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
		
		<!-- address.js-->
		<script src="/resources/js/common/address.js" type="application/javascript"></script>
     
		
	</head>
	
	<body>
		    
		<%@include file="/WEB-INF/views/common/header2.jsp" %> 
				
        <%@include file="/WEB-INF/views/search/searchBody.jsp" %>
			    
		<%@include file="/WEB-INF/views/common/footer.jsp" %> 
		
		<!-- Bootstrap core JS-->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	    <!-- Core theme JS-->
	    <script src="/resources/js/common/scripts.js"></script>
	    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	    <!-- * *                               SB Forms JS                               * *-->
	    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
					
		<!-- 달력폼 -->
		<script src="/resources/js/search/flatpickr.js"></script>						     

	    <!-- map API(App-key 포함) -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=앱키&libraries=services&libraries=clusterer"></script>
		<script src="/resources/js/search/map.js"></script>
		
		<script>
		
		 <!-- get방식으로 받은 데이터 바탕으로 리스트 출력 -->
		 $(function(){
            console.log('jq started.')
			//document.getElementsByClassName("profile_close").addEventListener("click", fnProfileOff);
			var list = new Array();
			 
			<c:forEach items="${list}" var="item">
				var jsonObject = new Object(); 
				
				jsonObject.userNickname = '${item.userNickname}';	//닉네임
				jsonObject.userLatitude = '${item.userLatitude}';	//위도
				jsonObject.userLongitude = '${item.userLongitude}'; //경도
				
				list.push(jsonObject);
			</c:forEach>
			 
			//map API 호출+출력
			displayPlaces(list);
		
		 });

		</script>	     

	</body>
	
</html>
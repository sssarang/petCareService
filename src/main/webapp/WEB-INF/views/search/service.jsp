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
	
		<!-- 달력폼 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
		
		<!-- Jquery -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script> 
		
	</head>
	
	<body>
		    
		<%@include file="/WEB-INF/views/common/header1.jsp" %> 
				
        <%@include file="/WEB-INF/views/search/serviceBody.jsp" %>
			    
		<%@include file="/WEB-INF/views/common/footer.jsp" %> 
		
		<!-- Bootstrap core JS-->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	    <!-- Core theme JS-->
	    <script src="/resources/js/scripts.js"></script>
	    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	    <!-- * *                               SB Forms JS                               * *-->
	    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
		
		<!-- 달력form js -->
		<script src="/resources/js/search/flatpickr.js"></script>	     
			     
	    <!-- map API(App-key 포함) -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7afbe56dc1ee3af63401f5dcfe39978&libraries=services&libraries=clusterer"></script>
		<script src="/resources/js/search/map.js"></script>	     
	
	</body>
	
</html>
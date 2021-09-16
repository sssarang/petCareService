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

    <title>쓰담쓰담 | 펫시터 예약 서비스</title>

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon2.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet" type="text/css" />
    
    <!-- jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

     <!-- flatpickr -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/rangePlugin.js"></script>
    
    
</head>
<body>

    <!-- header -->
	<%@ include file="/WEB-INF/views/common/header2.jsp" %>
	
    <!-- mainpage -->
	<%@ include file="/WEB-INF/views/search/matchingBody.jsp" %>
	
	<!-- footer -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    
    
	<!-- bookingForm js -->
	<script type="text/javascript" src="/resources/js/matching/bookingForm.js"></script>
	
	<!-- alert js -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
</body>
</html>
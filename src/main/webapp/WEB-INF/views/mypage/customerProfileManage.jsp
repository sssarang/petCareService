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

    <title>쓰담쓰담 | 마이페이지</title>

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon2.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
<!--     <link href="/resources/css/common/styles.css" rel="stylesheet" /> -->
</head>
<body>
    
	<%@ include file="/WEB-INF/views/common/header1.jsp" %>

	<%@ include file="/WEB-INF/views/mypage/customerProfileManageBody.jsp" %>
	
	
	
	<!-- <div class="bg-body" style="height: 1000px;"></div> -->

    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    
     <!-- Bootstrap core JS-->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
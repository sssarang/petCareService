<%@page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
    
<!DOCTYPE html>

<html lang="ko">
	<head>
	    <meta charset="utf-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	    <meta name="description" content="" />
	    <meta name="author" content="" />
	
	    <title>쓰담쓰담 | 펫시터 검색</title>
	
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
	    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/rangePlugin.js"></script>
		
		
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
					
		<!-- 기본 js -->
		<script src="/resources/js/search/search.js"></script>						     

		<!-- alert js -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<!-- 달력 js -->
		<script src="/resources/js/search/flatpickr.js"></script>						     

		<!-- address.js-->
		<script src="/resources/js/common/address2.js" type="application/javascript"></script>

	    <!-- map(App-key 포함) js -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69ee49c8ad00e09bd2df373af87ef12f&libraries=services&libraries=clusterer"></script>
		<script src="/resources/js/search/map.js"></script>

		<script>
		
		
		 $(function(){
            <!-- ================================ -->
			<!-- 1. 쿼리스트링으로 받은 데이터 조작         -->
            <!-- ================================ -->
            //petType, serviceDate는 form태그에 추가

            //dogType
            if($("input[type='radio'][name='petType'][value='dog']").is(":checked")){
            	$('.btn-toggle').show();
            	$("input[type='radio'][name='dogType'][value='${filter.dogType}']").attr("checked", true);            	
            } //if
            
            //serviceLocation
            //${filter.addrSido} 선택
            if("${filter.addrSido}" != null && "${filter.addrSido}" != ""){
	            $("select[id='sido'] > option[value='${filter.addrSido}']").attr("selected", true);
    	        $("#sido").prop('selected',true).change();
            }
            
          	//${filter.addrSigugun} 선택
          	if("${filter.addrSigugun}" != null && "${filter.addrSigugun}" != ""){
	            $("select[id='sigugun'] > option[value='${filter.addrSigugun}']").attr("selected", true);
	            $("#sigugun").prop('selected',true).change();
          	}
          	
          	//${filter.addrDong} 선택
            if("${filter.addrDong}" != null && "${filter.addrDong}" != ""){
            	$("select[id='dong'] > option[value='${filter.addrDong}']").attr("selected", true);
            }
        
            //serviceType
            <c:forEach items="${filter.serviceType}" var="item">
				$("input[type='checkbox'][name='serviceType'][value='${item}']").attr("checked", true);        
			</c:forEach>
			
			//skillType
            <c:forEach items="${filter.skillType}" var="item">
				$("input[type='checkbox'][name='skillType'][value='${item}']").attr("checked", true);        
			</c:forEach>
            
			
            
            <!-- ================================ -->
			<!-- 2. 필터검색에 따른 리스트 생성/지도 적용    -->
            <!-- ================================ -->  
            
            var list = new Array();
			var listLength = '${fn:length(list)}';
			
			//리스트가 존재하는 경우
			if(listLength > 0 ){
				<c:forEach items="${list}" var="item">
					var jsonObject = new Object(); 
					
					jsonObject.userNo = '${item.userNo}';				//회원번호
					jsonObject.userNickname = '${item.userNickname}';	//닉네임
					jsonObject.userLatitude = '${item.userLatitude}';	//위도
					jsonObject.userLongitude = '${item.userLongitude}'; //경도
					
					list.push(jsonObject);
				</c:forEach>
				
				//noSearch화면 숨기기
				$('#noSearch').hide();

				//map API 호출+출력
				displayPlaces(list);
				
			//리스트가 존재하지 않는 경우
			} else{

				//noSearch화면 호출
				$('#noSearch').show();

				//map화면 숨기기
				$('#map').hide();
				
			} //if-else
				
		
		 });

		</script>	     

	</body>
	
</html>
<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/mypage/userWithdrawal.css" rel="stylesheet" />
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
            <!-- Page content wrapper-->
            <div id="uw_wrapper">
            	<br>
		        <h2>탈퇴 사유 선택</h2>
		        <br><br>
		
		        <div class="withdrawalCheckbox">
		           
	            	<input type="hidden" name="userNo" value="${userNo}">
	                <input id="check1" type="checkbox" >
	                <label for="check1">&nbsp;마음에 드는 펫시터가 없어요.&nbsp;</label><br><br>
	                <input id="check2" type="checkbox" >
	                <label for="check2">&nbsp;서비스가 마음에 들지 않아요.&nbsp;</label><br><br>
	                <input id="check3" type="checkbox" >
	                <label for="check3">&nbsp;동네에 펫시터가 없어요.&nbsp;</label><br><br>
	                <input id="check4" type="checkbox" >
	                <label for="check4">&nbsp;금액이 너무 비싸요.&nbsp;</label><br><br>
	                <input id="check5" type="checkbox" >
	                <label for="check5">&nbsp;다른 종류 동물의 서비스를 원해요.&nbsp;</label><br><br>
	                <input id="check6" type="checkbox" >
	                <label for="check6">&nbsp;더이상 동물을 키우지 않아요.&nbsp;</label><br><br>
	                <input id="check7" type="checkbox" >
	                <label for="check7">&nbsp;별다른 이유는 없어요.&nbsp;</label><br><br><br><br>
	
	                <button type="button" class="btn btn-withdrawal" data-dismiss="modal">탈퇴하기</button>
		            
		        </div>
		    </div>
		</div>   
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/mypage/sideBarScripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
        
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>

            $('.btn-withdrawal').click(function(){
        			
                swal({
                	title : '회원탈퇴 되었습니다!',
                	text : '회원탈퇴 되었습니다!',
                	icon : 'warning'
                	})
                	
        			$('.swal-button').click(function(){
        				location.href="/";
        			});	
                })	// click
                
                
                  
        </script>
    </body>
</html>
  
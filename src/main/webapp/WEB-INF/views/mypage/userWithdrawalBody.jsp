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
                 <div class="navTitle">
                	<p class="navTitleIn">마이페이지 > 회원탈퇴</p>
               	</div>
            	<hr class="hhr">
            	<br>
            	<div id="withdrawalContent">
			        <h1 id="withdrawal_head">탈퇴 사유 선택</h1>
			        <br><br>
					<form action="/mypage/withdrawal" method="POST">
					<input type="hidden" name="userNo" value="${userNo}">
				        <div class="withdrawalCheckbox">			          		            	
			                <input id="check1" type="checkbox" >
			                <label for="check1"><p class="withdrawal_reason">마음에 드는 펫시터가 없어요.</p></label><br><br>
			                <input id="check2" type="checkbox" >
			                <label for="check2"><p class="withdrawal_reason">서비스가 마음에 들지 않아요.</p></label><br><br>
			                <input id="check3" type="checkbox" >
			                <label for="check3"><p class="withdrawal_reason">동네에 펫시터가 없어요.</p></label><br><br>
			                <input id="check4" type="checkbox" >
			                <label for="check4"><p class="withdrawal_reason">금액이 너무 비싸요.</p></label><br><br>
			                <input id="check5" type="checkbox" >
			                <label for="check5"><p class="withdrawal_reason">다른 종류 동물의 서비스를 원해요.</p></label><br><br>
			                <input id="check6" type="checkbox" >
			                <label for="check6"><p class="withdrawal_reason">더이상 동물을 키우지 않아요.</p></label><br><br>
			                <input id="check7" type="checkbox" >
			                <label for="check7"><p class="withdrawal_reason">별다른 이유는 없어요.</p></label><br>
													
			                <button type="submit" class="btn-withdrawal" id="withdrawal_btn">탈퇴하기</button>		            
			        	</div>
			    	</form>  
			    </div>	  	
		    </div>
		</div>   
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
        
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>

            $('.btn-withdrawal').click(function(e) {
        		e.preventDefault();
                swal({
                	title : '정말 탈퇴하시겠습니까?',
                	text : '다시 누르면 영구탈퇴됩니다.',
                	icon : 'warning'
                	})					                	
                	                	
        			$('.swal-button').click(function() {
        				$('.btn-withdrawal').unbind();
        			});	
                })	// click
                
                
                  
        </script>
    </body>
</html>
  
<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.bitcamp.petcare.user.domain.UserVO" %>
<%@ page import="com.bitcamp.petcare.user.controller.UserController" %>

		<c:choose>
			<c:when test='${(classify != null)&&(classify eq "1")}'>
		
	        	<!-- Sidebar-->
	        	<div class="border-end" id="sidebar-wrapper">
	            	<div class="sidebar-heading border-bottom ">마이페이지</div>
	              	<div class="list-group list-group-flush">
	                   <a class="list-group-item list-group-item-action p-3" href="userInfoManage">회원정보관리</a>
	                   <a class="list-group-item list-group-item-action p-3" href="customerProfileManage">프로필관리</a>
	                   <a class="list-group-item list-group-item-action p-3" href="customerHistoryManage">이력/리뷰 관리</a>
	                   <a class="list-group-item list-group-item-action p-3" href="customerResvManage">예약관리</a>
	                   <a class="list-group-item list-group-item-action p-3" href="">회원탈퇴</a>
	              	 </div>
	          	 </div>
	         </c:when>

			 <c:when test='${(classify != null)&&(classify eq "2")}'>
		         <!-- Sidebar-->
		         <div class="border-end" id="sidebar-wrapper">
		            <div class="sidebar-heading border-bottom ">마이페이지</div>
		               <div class="list-group list-group-flush">
		                   <a class="list-group-item list-group-item-action p-3" href="userInfoManage">회원정보관리</a>
		                   <a class="list-group-item list-group-item-action p-3" href="">프로필관리</a>
		                   <a class="list-group-item list-group-item-action p-3" href="">이력/리뷰 관리</a>
		                   <a class="list-group-item list-group-item-action p-3" href="">예약관리</a>
		                   <a class="list-group-item list-group-item-action p-3" href="">회원탈퇴</a>
		               </div>
		         </div>
       		</c:when>
		</c:choose>
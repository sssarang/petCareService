<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ page import="com.bitcamp.petcare.user.domain.UserVO" %>
 <%@ page import="com.bitcamp.petcare.user.controller.UserController" %>
        
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/common/styles.css" rel="stylesheet" />



<!-- Navigation-->
<nav class="navbar navbar-light static-top fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img class="img-fluid" src="/resources/assets/img/common/2.png" alt="Logo" width="165px">
        </a>
        <%  
        	UserVO loginInfo = (UserVO) session.getAttribute(UserController.loginKey);
        
        	System.out.println("loginInfo: " + loginInfo);
        	
        	if(loginInfo == null){
        		
        %>
        <div class="btn-group">
            <a class="btn orange" href="/user/loginPage">
                <span class="btn-sm">
                    로그인
                </span>
            </a>
            <a class="btn orange" href="/user/articleCheckPage">
                <span class="btn-sm">
                    회원가입
                </span>
            </a>
        </div>
        <%
        	}else {
        %>
         <div class="btn-group">
            <a class="btn orange" href="/mypage/main">
                <span class="btn-sm">
                    마이페이지
                </span>
            </a>
            <a class="btn orange" href="/user/logout">
                <span class="btn-sm">
                    로그아웃
                </span>
            </a>
        </div>
        <%
        	}
        %>
    </div>
</nav>
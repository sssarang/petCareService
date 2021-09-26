<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon2.ico" />
    
	<!-- bootStrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	
	<!-- jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36768b2f76471ae95e3d92b023d2b626&libraries=services"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="/resources/js/user/userJoin.js"></script>
    
    <!-- alert js -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/user/userstyle.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<title>쓰담쓰담 | 회원가입 </title>
</head>

<body>
	 <div class="demo form-bg">
	        <div class="container">
	            <div class="row text-center">
	                <div class="col-lg-12">
	                	<a href="/"><img  src="/resources/assets/img/common/2.png" width="370px"></a>
	                    <h1 class="heading-title"></h1>
	                </div>
	            </div>
	
	             <div class="row">
	                <div class="col-md-offset-3 col-md-6">
	                    <form name="joinForm" action="/user/join" method="POST">
	                        <div class="form-group">
	                        	<h1 class="heading">회원가입</h1>
	                        		<label class="control-label">아이디</label>
	                        		<label id="emailLabel" class="warning-label"></label>
	                        		<button type="button" id="emailBtn" class="check-button">중복확인</button>
		                            <input id="emailId" type="email" name="userId" class="form-control" placeholder="example@naver.com"/>
									
									<label class="control-label">인증번호 입력</label>
									<label id="keyLabel" class="warning-label"></label>
	                        		<button type="button" id="keyBtn" class="check-button">인증하기</button>
		                            <input id="inputKey" type="text" name="" class="form-control" placeholder="인증번호를 입력하세요"/>
									
		                            <label class="control-label">비밀번호</label>
		                            <label id="pwLabel" class="warning-label"></label>
		                            <input id="inputPw" type="password" name="userPw" class="form-control" placeholder="숫자와 문자포함 6~12자리 이내"/>
		
		                            <label class="control-label">닉네임</label>
		                            <label  id="nickNameLabel" class="warning-label"></label>
		                            <button id="nickNameBtn" type="button" class="check-button">중복확인</button>
		                            <input id="nickName" type="text" name="userNickname" class="form-control" />
		                  
		                            <label class="control-label">전화번호 </label>
		                            <label id="phoneLabel" class="warning-label"> *ex)010-1234-5678</label>
		                            <input id="inputPhone" type="text" name="userContact" class="form-control" placeholder="'-'을 포함하여 작성해 주세요"/>

		                            <label class=" control-label">주소</label>
		                            <input class="check-button" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
		                            <input id="inputAddress" type="text" name="userAddress" class="form-control" placeholder="지번주소" readonly/>
		                            
		                            <label class=" control-label">성별</label>
		                            <span class="radio-control">여자</span>
		                            <input type="radio" name="userGender" value="F" checked="checked"/>
		                            <span class="radio-control">남자</span>
		                            <input type="radio" name="userGender" value="M"/>
		
		                            <button type="button" class="signUpBtn" id="submitBtn">회원가입<i class="fa fa-arrow-circle-right fa-2x"></i></button>
	                        		
	                        </div>
	                        <span class="form-footer">이미 가입되어있는 회원인가요? <a href="loginPage">로그인 하기</a></span>
	                        
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
		<!-- footer -->
	    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
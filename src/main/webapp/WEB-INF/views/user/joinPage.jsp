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
	<!-- bootStrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	
	<!-- jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
    
    <script type="text/javascript" src="/resources/js/user/userJoin.js"></script>
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/user/userstyle.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<title> 쓰담쓰담 로그인 </title>
</head>

<body>
	 <div class="demo form-bg">
	        <div class="container-fluid">
	            <div class="row text-center">
	                <div class="col-lg-12">
	                	<img src="/resources/assets/img/common/2.png">
	                    <h1 class="heading-title"></h1>
	                </div>
	            </div>
	
	            <div class="row">
	                <div class="col-md-offset-3 col-md-6">
	                    <form action="/user/join" method="POST">
	                        <h1 class="heading">회원가입</h1>
	                        <div class="form-group">
	                        		<label class="control-label">아이디 (사용중인 이메일)</label>
	                        		<label id="emailLabel" class="warning-label"></label>
	                        		<button type="button" id="emailBtn" class="check-button">중복확인</button>
		                            <input id="emailId" type="email" name="userId" class="form-control" placeholder="example@naver.com"/>
									
									<label class="control-label">인증번호 입력</label>
									<label class="warning-label">* 인증번호가 일치하지 않습니다.</label>
	                        		<button type="button" id="keyBtn" class="check-button">인증하기</button>
		                            <input type="text" name="" class="form-control" placeholder="인증번호를 입력하세요"/>
									
		                            <label class="control-label">비밀번호</label>
		                            <input type="password" name="userPw" class="form-control" placeholder="비밀번호 설정"/>
		
		                            <label class="control-label">닉네임</label>
		                            <label  id="nickNameLabel" class="warning-label"></label>
		                            <button id="nickNameBtn" type="button" class="check-button">중복확인</button>
		                            <input id="nickName" type="text" name="userNickname" class="form-control" />
		                  
		                            <label class=" control-label">전화번호</label>
		                            <input type="tel" name="userContact" class="form-control"/>

		                            <label class=" control-label">주소</label>
		                            <input type="text" name="userAddress" class="form-control"/>
		                            
		                            <label class=" control-label">성별</label>
		                            여자<input type="radio" name="userGender" class="radio-control" value="F"/>
		                            남자<input type="radio" name="userGender" class="radio-control" value="M"/>
		
		                            <button type="submit" class="btn btn-default"> 회원가입 <i class="fa fa-arrow-circle-right fa-2x"></i></button>
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
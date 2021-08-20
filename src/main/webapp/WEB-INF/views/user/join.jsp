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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<link rel="stylesheet" href="../../../resources/css/sign/style.css">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<title> 쓰담쓰담 로그인 </title>
</head>

<body>
	 <div class="demo form-bg">
	        <div class="container-fluid">
	            <div class="row text-center">
	                <div class="col-lg-12">
	                    <h1 class="heading-title"> 쓰담쓰담 </h1>
	                </div>
	            </div>
	
	            <div class="row">
	                <div class="col-md-offset-3 col-md-6">
	                    <form action="/user/join" method="POST">
	                        <h1 class="heading">회원가입</h1>
	                        <div class="form-group">
	                        		<label class="control-label">아이디</label>
		                            <input type="email" name="user_id" class="form-control" placeholder="이메일형식"/>

		                            <label class="control-label">비밀번호</label>
		                            <input type="password" name="user_pw" class="form-control" placeholder="비밀번호 설정"/>
		
		                            <label class="control-label">닉네임</label>
		                            <input type="text" name="user_nickname" class="form-control" />
		
		                            <label class=" control-label">전화번호</label>
		                            <input type="tel" name="user_contact" class="form-control"/>

		                            <label class=" control-label">주소</label>
		                            <input type="text" name="user_address" class="form-control"/>
		                            
		                            <label class=" control-label">성별</label>
		                            여자<input type="radio" name="user_gender"class="form-control" value="F"/>
		                            남자<input type="radio" name="user_gender" class="form-control" value="M"/>
		
		                            <button type="submit" class="btn btn-default">create your account <i class="fa fa-arrow-circle-right fa-2x"></i></button>
	                        </div>
	                        <span class="form-footer">already have an account? <a href="test">log in</a></span>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>

</body>
</html>
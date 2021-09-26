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
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/user/userstyle.css">
	<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/user/articleCheck.css">
	
	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script> -->
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script> -->
	
	<!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet" type="text/css" />
	
	<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon2.ico" />
	
	<!-- alert js -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    
	<!-- 이용약관 jsp -->
	<script type="text/javascript" src="/resources/js/user/articleModal.js"></script>
	<!-- https://ddorang-d.tistory.com/10?category=664194 -->

	<title>쓰담쓰담 | 이용약관 동의 </title>
</head>

<body>

<!-- The Modal -->
<div id="myModal" class="modal">
 
   <!-- Modal content -->
   <div class="modal-content">

 		<form action="joinPage" name="joinForm" id="joinForm" method="post">
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(선택), 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" onclick="selectAll(this)" class="chkAll">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>*이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="necessary1" onclick="checkSelectAll()"> 
                        </li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.
쓰담쓰담 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 쓰담쓰담 서비스의 이용과 관련하여 쓰담쓰담 서비스를 제공하는 쓰담쓰담 주식회사(이하 ‘쓰담쓰담’)와 이를 이용하는 쓰담쓰담 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 쓰담쓰담 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
     				</textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>*개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="necessary2" onclick="checkSelectAll()">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
쓰담쓰담 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 쓰담쓰담 서비스의 이용과 관련하여 쓰담쓰담 서비스를 제공하는 쓰담쓰담 주식회사(이하 ‘쓰담쓰담’)와 이를 이용하는 쓰담쓰담 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 쓰담쓰담 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       				</textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>*위치정보 이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="necessary3" onclick="checkSelectAll()">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
쓰담쓰담 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 쓰담쓰담 서비스의 이용과 관련하여 쓰담쓰담 서비스를 제공하는 쓰담쓰담 주식회사(이하 ‘쓰담쓰담’)와 이를 이용하는 쓰담쓰담 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 쓰담쓰담 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
      				</textarea>
                </li>
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" onclick="checkSelectAll()">
                        </li>
                    </ul>
 
                </li>
            </ul>
            <ul class="footBtwrap clearfix">
                <li><Button type="button" id="petSitter" class="fpmgBt1" onclick="pJoin()">펫시터 가입</Button></li>
                <li><Button type="button" id="normalUser" class="fpmgBt2" onclick="nJoin()">반려인 가입</Button></li>
            </ul>
        </form>
      <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
	      <span class="pop_bt" style="font-size: 13pt;" >
	           닫기
	      </span>
      </div>
  </div>

</div>
<!--End Modal-->

</body>
</html>
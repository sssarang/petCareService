package com.bitcamp.petcare.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@Controller
@RequestMapping("/mypage/")
public class MypageController {

	@GetMapping("main")							// 마이페이지 메인
	public String  main() {
		log.debug("main() invoked.");
		
		return "mypage/myPageMain";
	} //main
	
	@GetMapping("userInfoManage")				// 회원정보관리
	public String userInfoManage() {
		log.debug("userInfoManage() invoked.");
		
		return "mypage/userInfoManage";
	}	//userInfoManage
	
	@GetMapping("customerProfileManage")		// 반려인 프로필페이지
	public String customerProfileManage() {
		log.debug("customerProfileManage() invoked.");
		
		return "mypage/customerProfileManage";
	}	//customerProfileManage
	
	@GetMapping("customerHistoryManage")
	public String customerHistoryManage() {
		log.debug("customerHistoryManage() invoked.");
		
		return "mypage/customerHistoryManage";
	}	//customerHistoryManage
	
	@GetMapping("customerResvManage")
	public String customerResvManage() {
		log.debug("customerResvMange() invoked.");
		
		return "mypage/customerResvManage";
	}	// customerResvManage
	
} //end class

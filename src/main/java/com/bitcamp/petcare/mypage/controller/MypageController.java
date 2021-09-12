package com.bitcamp.petcare.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.petcare.mypage.domain.CustomerHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerInfoManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerResvManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageVO;
import com.bitcamp.petcare.mypage.service.MypageService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Setter(onMethod_= @Autowired)
	private MypageService service;

	@GetMapping("main")							// 마이페이지 메인
	public String  main() {
		log.debug("main() invoked.");
		
		return "mypage/myPageMain";
	} //main
	
	
	//  ========================회원정보관리 페이지==========================
	
	@GetMapping("userInfoManage")				// 회원정보관리
	public void userInfoManage(Integer userNo, Model model) {
		log.debug("userInfoManage() invoked.");
		
		CustomerInfoManageVO info = this.service.readInfo(userNo);
		
		Objects.requireNonNull(info);
		
		log.info("\t+ info : {} " , info);
		
		model.addAttribute("userNo", userNo);
		model.addAttribute("info", info);		
	}	//userInfoManage
	
	
	
	
	//  ========================프로필 페이지==========================
	
	@GetMapping("customerProfileManage")		// 반려인 프로필 페이지(조회)
	public void getProfile(Integer userNo, Model model) {
		log.debug("customerProfileManage() invoked.");
		
		CustomerProfileManageVO profile = this.service.readProfile(userNo);
		
		assert profile != null;
		
		log.info("\t+ getProfile : {} ", profile);
		
		model.addAttribute("userNo", userNo);
		model.addAttribute("profile", profile);
	}	//customerProfileManage
	
	@PostMapping("customerProfileModify")		// 반려인 프로필 페이지(수정)
	public String modifyProfile(HttpServletRequest req, Integer userNo, CustomerProfileManageDTO modify) throws IOException {
		log.debug("modifyProfile({}) invoked.",modify);
		
		String fileName = "proPhoto_"+modify.getUserNo()+".jpg";
		//String path = req.getServletContext().getRealPath("/resources/assets/img/mypage");
		String path = "C:\\opt\\eclipse\\workspace\\JEE\\petCareServiceTest2\\src\\main\\webapp\\resources\\assets\\img\\mypage";
		log.info("path : {}", path);
		File file = new File(path, fileName);
		modify.getProPhotoFile().transferTo(file);
		
		modify.setProPhoto("/resources/assets/img/mypage/"+fileName);
		
		
		if(this.service.readProfile(userNo).getPetTypeCode()==null) {
			this.service.registerProfile(modify);
		}else {
			this.service.modifyProfile(modify);
		}
		return "mypage/myPageMain";
	}	// modifyProfile
	
	
	//  ========================이력관리 페이지==========================
	
	@GetMapping("customerHistoryManage")		// 반려인 이력관리 페이지(조회)
	public void customerHistoryManage(Integer petUserNo, Model model) {
		log.debug("customerHistoryManage() invoked.");
		
		List<CustomerHistoryManageVO> history = this.service.readHistory(petUserNo);
		//CustomerReviewManageVO review = this.service.readReview(serviceId);
		
		
		assert history != null;
		
		log.info("\t+ history : {} ", history);
		
		model.addAttribute("history", history);
		//model.addAttribute("review", review);
	}	// customerHistoryManage
	
	
	@ResponseBody
	@GetMapping("customerReviewManage")			// 저장된 리뷰 조회
	public CustomerReviewManageVO  customerReviewManage(@RequestParam(value = "serviceId")Integer serviceId) {
		log.debug("customerReviewManage() invoked.");
		
		CustomerReviewManageVO review = this.service.readReview(serviceId);
		
		
		
		return review;
	}	// customerReviewManage
	
	@ResponseBody
	@PostMapping("customerReviewSend")		// 반려인 리뷰 페이지(전송)
	public boolean registerReview(CustomerReviewManageDTO review) {
		log.debug("customerHistoryManage() invoked.");
		
		
		if(this.service.readReview(review.getServiceId()) == null) {			// 값이 없다면 입력
			this.service.registerReview(review);
		}else {																	// 값이 있다면 수정
			this.service.modifyReview(review);
		}
		
		return true;
		//return "mypage/customerHistoryManageBody";
	}	// registerReview
	

	
	//  ========================예약관리 페이지==========================
	
	@GetMapping("customerResvManage")
	public void customerResvManage(Integer petUserNo, Model model) {
		log.debug("customerResvMange() invoked.");
		
		CustomerResvManageVO resv = this.service.readResv(petUserNo);
		
		if(resv.getServiceId() != null) {
		CustomerPaymentManageVO payment = this.service.readPayment(resv.getServiceId());
		model.addAttribute("payment", payment);
		}
		
		model.addAttribute("petUserNo", petUserNo);
		model.addAttribute("resv", resv);
		
	}	// customerResvManage
	
	@PostMapping("paymentSend")
	public String paymentSend(CustomerPaymentManageDTO dto) {
		log.debug("paymentSend() invoked.");
		
		this.service.insertPayment(dto);
		
		return "redirect:/mypage/customerResvManage";
	}	// paymentSend
	
	@ResponseBody
	@PostMapping("cancelResv")
	public void cancelResv(@RequestParam(value = "serviceId")Integer serviceId) {
		log.debug("cancelResv() invoked.");
		
		this.service.cancelResv(serviceId);
		
	}	// cancelResv
	
	
	
	
} //end class

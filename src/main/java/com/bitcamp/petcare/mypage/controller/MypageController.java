package com.bitcamp.petcare.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.petcare.mypage.domain.CustomerHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerInfoManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerInfoManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerResvManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageVO;
import com.bitcamp.petcare.mypage.domain.userPasswordVO;
import com.bitcamp.petcare.mypage.service.MypageService;
import com.bitcamp.petcare.user.domain.UserVO;

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

	private String loginKey = "__LOGIN__";
	
	Double x;			//경도
	Double y;			//위도
	
	@Autowired
	private BCryptPasswordEncoder encoder;		//암호화관련 bean
	

	@GetMapping("main")							// 마이페이지 메인
	public String  main(HttpSession session, Model model) {
		log.debug("main() invoked.");
		
		log.info(session.getClass().getName());
		log.info(session.getAttribute(loginKey));
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		log.debug(vo.getUserId());
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		log.debug("classify : {} ", classify);
		
		log.info(vo.getUserNo());
		return "mypage/myPageMain";
	} //main
	
	
	//  ========================회원정보관리 페이지==========================
	
	@GetMapping("userInfoManage")				// 회원정보관리
	public void userInfoManage(Integer userNo, Model model, HttpSession session) {
		log.debug("userInfoManage() invoked.");
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		
		CustomerInfoManageVO info = this.service.readInfo(vo.getUserNo());
		
		Objects.requireNonNull(info);
		
		log.info("\t+ info : {} " , info);
		
		model.addAttribute("userNo", userNo);
		model.addAttribute("info", info);		
	}	//userInfoManage
	

	//좌표값 받아오는 메소드
	@RequestMapping(value="coordinate", method=RequestMethod.POST)
	@ResponseBody
	public String coordinate(String x, String y) {
		log.debug("coordinate({}, {}) invoked",x, y);
		this.x = Double.parseDouble(x);
		this.y = Double.parseDouble(y);
		
		return null;
	}	//coordinate
	
	// 회원정보 수정
	@PostMapping("userInfoModify")
	public String userInfoModify(CustomerInfoManageDTO dto) {
		log.debug("userInfoModify({}) invoked.", dto);
		
		dto.setUserLatitude(y);
		dto.setUserLongitude(x);
		
		this.service.modifyInfo(dto);
		
		return "redirect:/mypage/main";
	}	// userInfoModify
	
	// 기존 암호화 비밀번호 조회
	@ResponseBody
	@PostMapping("readPw")
	public boolean readPw(@RequestParam(value = "oldPw")String inputOldPw, HttpSession session) throws Exception {


		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		userPasswordVO oldPw = this.service.readPw(vo.getUserNo());
		
		log.debug("넣은 값 : {} ", inputOldPw);
		
		log.debug("기존 값 : {} ", oldPw.getUserPw());
		
		boolean match = encoder.matches(inputOldPw, oldPw.getUserPw());
		
		return match;
		//String encrypedInputPw = this.service.encryption(inputOldPw);
		
				
	}	// readPw
	
	
	
	
	//  ========================프로필 페이지==========================

	@GetMapping("customerProfileManage")		// 반려인 프로필 페이지(조회)
	public void getProfile( Model model, HttpSession session) {
		log.debug("customerProfileManage() invoked.");
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		
		
		CustomerProfileManageVO profile = this.service.readProfile(vo.getUserNo());

		
		log.info("\t+ getProfile : {} ", profile);
		
		model.addAttribute("userNo", vo.getUserNo());
		model.addAttribute("profile", profile);
	}	//customerProfileManage
	
	@PostMapping("customerProfileModify")		// 반려인 프로필 페이지(수정)
	public String modifyProfile(HttpServletRequest req, Integer userNo, CustomerProfileManageDTO modify, HttpSession session) throws IOException {
		log.debug("modifyProfile() invoked.");
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String fileName = "proPhoto_"+vo.getUserNo()+".jpg";
		//String path = req.getServletContext().getRealPath("/resources/assets/img/mypage");
		String path = "C:\\opt\\eclipse\\workspace\\JEE\\petCareServiceTest3\\src\\main\\webapp\\resources\\assets\\img\\mypage";
		log.info("path : {}", path);
		File file = new File(path, fileName);
		modify.getProPhotoFile().transferTo(file);
		
		modify.setProPhoto("/resources/assets/img/mypage/"+fileName);

		CustomerProfileManageVO vo2 = this.service.readProfile(vo.getUserNo());
		if(vo2 == null) {
			this.service.registerProfile(modify);
		}else {
			this.service.modifyProfile(modify);
		}
		return "redirect: /mypage/main";
	}	// modifyProfile
	
	
	//  ========================이력관리 페이지==========================
	
	@GetMapping("customerHistoryManage")		// 반려인 이력관리 페이지(조회)
	public void customerHistoryManage(Integer petUserNo, Model model, HttpSession session) {
		log.debug("customerHistoryManage() invoked.");
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		
		List<CustomerHistoryManageVO> history = this.service.readHistory(vo.getUserNo());
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
	public void customerResvManage(Integer petUserNo, Model model, HttpSession session) {
		log.debug("customerResvMange() invoked.");
		
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		
		CustomerResvManageVO resv = this.service.readResv(vo.getUserNo());
		
		
		if(resv != null) {
		CustomerPaymentManageVO payment = this.service.readPayment(resv.getServiceId());
		model.addAttribute("payment", payment);
		}
		
		model.addAttribute("petUserNo", vo.getUserNo());
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

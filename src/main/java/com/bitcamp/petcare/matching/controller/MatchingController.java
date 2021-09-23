package com.bitcamp.petcare.matching.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.petcare.matching.domain.MatchingDTO;
import com.bitcamp.petcare.matching.domain.MatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceCalendarVO;
import com.bitcamp.petcare.matching.domain.ServiceMatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceTypeVO;
import com.bitcamp.petcare.matching.service.MatchingService;
import com.bitcamp.petcare.user.controller.UserController;
import com.bitcamp.petcare.user.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller
@RequestMapping("/search/")
public class MatchingController {
	
	@Setter(onMethod_=@Autowired)
	private MatchingService service;

	
	// 예약화면에 회원, 반려동물 정보 띄우기
	@GetMapping("matching")
	public void getUserPet(Integer userNo, Model model, HttpSession session, HttpServletRequest req) {
		
		log .debug("getUserPet({}, {}) invoked...", userNo, model);
		
		// 세션객체를 확인한다. 
		HttpSession sessioncheck = req.getSession(false);
		log.info("sessioncheck: {}", sessioncheck );
		
		// 세션객체를 가져온다
		UserVO loginInfo = (UserVO) session.getAttribute(UserController.loginKey);
		log.info("loginInfo: {}", loginInfo );
		
		// 로그인 세션의 userNo정보를 가져온다
		int petUserNo = loginInfo.getUserNo();
		log.info("petUserNo: {}", petUserNo );
	
		
		MatchingVO matching = this.service.getUserPet(petUserNo);
		
		assert matching != null;
		log.info("\t+matching: {}", matching);
		
		model.addAttribute("matching", matching);
	} //getUserPet
	
	
	// 예약정보를 서버로 전송한 뒤에 마이페이지로 이동
	@PostMapping("booking")
	public String booking(MatchingDTO matching) {
		log.debug("booking({}) invoked." , matching);
		
		this.service.registerMatcing(matching);
		
		return "redirect:/mypage/customerResvManage";
	} //booking
	
	
	// 비동기식 ajax를 사용할 때 db에서 불러올 데이터 리스트
	@ResponseBody
	@PostMapping("serviceType")
	public List<ServiceTypeVO> showServiceType(Integer userNo) {
		log.info("\t ===================userNo: ",userNo);
		
		List<ServiceTypeVO> resultServiceType = this.service.getServiceType(userNo);
		
		assert resultServiceType != null;
		log.info("\t+resultServiceType: {}", resultServiceType);
		
		return resultServiceType;
	} //showFaq
	
	
	// 비동기식 ajax를 사용할 때 db에서 불러올 데이터 리스트
	@ResponseBody
	@PostMapping("ableDate")
	public List<ServiceCalendarVO> showAbleDate(Integer userNo) {
		
		List<ServiceCalendarVO> resultAbleDates = this.service.getServiceCalendar(userNo);
		
		assert resultAbleDates != null;
		log.info("\t+resultAbleDates: {}", resultAbleDates);
		
		return resultAbleDates;
	} //showFaq
	
	
	// 비동기식 ajax를 사용할 때 db에서 불러올 데이터 리스트
		@ResponseBody
		@PostMapping("bookingList")
		public List<ServiceMatchingVO> showBookingList(HttpSession session) {
			
			// 세션객체를 가져온다
			UserVO loginInfo = (UserVO) session.getAttribute(UserController.loginKey);
			log.info("loginInfo: {}", loginInfo );
			
			// 로그인 세션의 userNo정보를 가져온다
			int petUserNo = loginInfo.getUserNo();
			log.info("petUserNo: {}", petUserNo );
			
			List<ServiceMatchingVO> bookingList = this.service.getServiceMatching(petUserNo);
			
			assert bookingList != null;
			log.info("\t+bookingList: {}", bookingList);
			
			return bookingList;
		} //showFaq
		
	
} //end class

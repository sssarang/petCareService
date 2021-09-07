package com.bitcamp.petcare.matching.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.petcare.matching.domain.MatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceCalendarVO;
import com.bitcamp.petcare.matching.domain.ServiceTypeVO;
import com.bitcamp.petcare.matching.service.MatchingService;

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
	public void getUserPet(Integer userNo, Model model) {
		
		log .debug("getUserPet({}, {}) invoked...", userNo, model);
	
		MatchingVO matching = this.service.getUserPet(userNo);
		
		assert matching != null;
		log.info("\t+matching: {}", matching);
		
		model.addAttribute("matching", matching);
		
	} //getUserPet
	
	
	// 예약하기 완료시, 예약테이블에 데이터 넣기. 
//	@PostMapping("booking")
//	public void booking(MatchingDTO matching) {
//		log.debug("booking({}) invoked." , matching);
//		
//		this.service.registerMatcing(matching);
//		
//	} //booking
	
	
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
} //end class

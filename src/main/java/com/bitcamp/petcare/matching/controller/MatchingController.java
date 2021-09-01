package com.bitcamp.petcare.matching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.petcare.matching.domain.MatchingDTO;
import com.bitcamp.petcare.matching.domain.MatchingVO;
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
	@PostMapping("booking")
	public void booking(MatchingDTO matching) {
		log.debug("booking({}) invoked." , matching);
		
		this.service.registerMatcing(matching);
		
		
	} //booking
	
} //end class

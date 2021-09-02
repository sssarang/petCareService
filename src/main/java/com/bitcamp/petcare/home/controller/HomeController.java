package com.bitcamp.petcare.home.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.petcare.home.domain.FaqVO;
import com.bitcamp.petcare.home.domain.ReviewVO;
import com.bitcamp.petcare.home.service.HomeService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@Controller
public class HomeController {
	
	@Setter(onMethod_=@Autowired)
	private HomeService service;

	@GetMapping("/")
	public String home() {
		log.debug("homepage() invoked.");
		

		return "home/home";
	} //homepage
	
	
	// 비동기식 ajax를 사용할 때 db에서 불러올 데이터 리스트
	@ResponseBody
	@GetMapping("faq")
	public List<FaqVO> showFaq() {

		List<FaqVO> resultFaq = this.service.getFaq();
		
		return resultFaq;
	} //showFaq
	
	
	// 비동기식 ajax를 사용할 때 db에서 불러올 데이터 리스트
	@ResponseBody
	@GetMapping("review")
	public List<ReviewVO> showReview() {

		List<ReviewVO> resultReview = this.service.getReview();
		
		return resultReview;
	} //showFaq
} //end class
 
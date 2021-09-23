package com.bitcamp.petcare.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.petcare.admin.domain.Criteria;
import com.bitcamp.petcare.admin.domain.PageDTO;
import com.bitcamp.petcare.admin.service.AdminService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Setter(onMethod_=@Autowired)
	private AdminService service;
	
	@GetMapping("temp")
	public String temp() {
		return null;
	}
	
	
	
	@GetMapping("/")
	public String showMain() {
		return "admin/adminPage";
	}
	
	
	//=================================FAQ 관련====================================
	//FAQ 리스트 페이징
	@GetMapping("/faq")
	public String showFAQ(Criteria cri, Model model) {
		log.debug("showFAQ() invoked");
		
		model.addAttribute("pagingList", this.service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, this.service.countFaq()));
		return "admin/faqPage";
	}//end showFAQ
	
	
	//=================================회원 관련====================================
	@GetMapping("/petSitter")
	public String showPetSitter(Criteria cri, Model model) {
		log.debug("showPetSitter({}) invoked", cri);
		
		cri.setUserClassify("2");
		
		model.addAttribute("userList", this.service.selectUser(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, this.service.countUser(cri)));
		
		return "admin/petSitterPage";
	}
	
	@GetMapping("/normalUser")
	public String sohwNormalUser(Criteria cri, Model model) {
		log.debug("sohwNormalUser() invoked");
		
		cri.setUserClassify("1");
	
		model.addAttribute("userList", this.service.selectUser(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, this.service.countUser(cri)));
		
		return "admin/normalUserPage";
	}
	
}//end class

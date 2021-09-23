package com.bitcamp.petcare.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.petcare.admin.domain.Criteria;
import com.bitcamp.petcare.admin.domain.FaqDTO;
import com.bitcamp.petcare.admin.domain.FaqVO;
import com.bitcamp.petcare.admin.domain.PageDTO;
import com.bitcamp.petcare.admin.service.AdminService;
import com.bitcamp.petcare.user.domain.UserVO;
import com.bitcamp.petcare.user.interceptor.LoginInterceptor;

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
	
	@GetMapping("/")
	public String showMain(HttpSession session, Model model) {
		
		UserVO vo = (UserVO) session.getAttribute(LoginInterceptor.loginKey);
		if(vo.getUserClassify().equals("0")) {
			model.addAttribute("session", vo.getUserNickname());
			return "admin/adminPage";
		} else {
			return "home/home";
		}
	}//showMain
	
	//=================================FAQ 관련====================================
	//FAQ 리스트 페이징
	@GetMapping("/faq")
	public String showFAQList(Criteria cri, Model model, HttpSession session) {
		log.debug("showFAQ() invoked");
		
		UserVO vo = (UserVO) session.getAttribute(LoginInterceptor.loginKey);
		
		model.addAttribute("session", vo.getUserNickname());
		model.addAttribute("pagingList", this.service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, this.service.countFaq()));
		
		return "admin/faqPage";
	}//end showFAQ
	
	//FAQ 리스트 가져오기
	@GetMapping(value="/showFAQ")
	@ResponseBody
	public FaqVO showFAQ(@RequestParam(value = "buttonId")String buttonId) {
		log.debug("showFAQ({}) invoked", buttonId);
		
		FaqDTO dto = new FaqDTO();
		dto.setFaqSequence(Integer.parseInt(buttonId));
		
		return this.service.selectFAQ(dto);
	}//showFAQ
	
	//FAQ 수정
	@PostMapping(value="/modifyFaq")
	@ResponseBody
	public void updateFAQ(FaqDTO dto) {
		log.debug("updateFAQ({}) invoked");
		
		//임시 - 세션으로 관리자 회원번호 가져올것
		dto.setModUserNo(1);
		
		
		int result = this.service.updateFAQ(dto);
		log.info("\t + result : {}", result);
	}//updateFAQ
	
	//FAQ 삭제
	@PostMapping(value="/deleteFaq")
	@ResponseBody
	public void deleteFAQ(FaqDTO dto) {
		log.debug("deleteFAQ({}) invoked", dto);
		
		int result = this.service.deleteFAQ(dto);
		log.info("\t + result : {}", result);
		
	}//deleteFAQ
	
	//FAQ 추가
	@PostMapping(value="/createFaq")
	public void insertFAQ(FaqDTO dto) {
		log.debug("createFaq({}) invoked", dto);
		
		//임시 - 세션으로 관리자 회원 번호 가져올것
		dto.setRegUserNo(1);
		
		int result = this.service.insertFAQ(dto);
		log.info("\t + result : {}", result);
	}//createFaq
	
	
	//=================================회원 관련====================================
	@GetMapping("/petSitter")
	public String showPetSitter(Criteria cri, Model model, HttpSession session) {
		log.debug("showPetSitter({}) invoked", cri);
		
		UserVO vo = (UserVO) session.getAttribute(LoginInterceptor.loginKey);
		model.addAttribute("session", vo.getUserNickname());

		cri.setUserClassify("2");
		
		model.addAttribute("userList", this.service.selectUser(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, this.service.countUser(cri)));
		
		return "admin/petSitterPage";
	}
	
	@GetMapping("/normalUser")
	public String sohwNormalUser(Criteria cri, Model model, HttpSession session) {
		log.debug("sohwNormalUser() invoked");
		
		UserVO vo = (UserVO) session.getAttribute(LoginInterceptor.loginKey);
		model.addAttribute("session", vo.getUserNickname());
		
		cri.setUserClassify("1");
	
		model.addAttribute("userList", this.service.selectUser(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, this.service.countUser(cri)));
		
		return "admin/normalUserPage";
	}
	
}//end class

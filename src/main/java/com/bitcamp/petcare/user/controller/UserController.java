package com.bitcamp.petcare.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.bitcamp.petcare.user.domain.UserDTO;
import com.bitcamp.petcare.user.domain.UserVO;
import com.bitcamp.petcare.user.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Setter(onMethod_=@Autowired)
	private UserService service;
	
	
	@GetMapping("startPoint")
	public String start() {
		log.debug("start() invoked");
		
		return "user/join";
		
	}//start
	
	@GetMapping("test")
	public String test() {
		
		return "user/login";
	}
	
	@PostMapping("join")
	public String joinUser(UserDTO dto, RedirectAttributes rttr) {
		log.debug("joinUser({}) invoked", dto);
		
		dto.setUser_latitude(43.123123);
		dto.setUser_longitude(54.123123);
		dto.setUser_status('F');
		dto.setUser_classify('1');
		
		if(this.service.joinUser(dto) == 1 ) {
			rttr.addFlashAttribute("result", "success");
			return "redirect:/user/login";
		}
		return "user/join";
	}//joinUser
	
	@PostMapping("login")
	public String loginUser(UserDTO dto) {
		log.debug("loginUser({}) invoked", dto);

		
		UserVO user = service.loginUser(dto);
		if(user != null) {
			return "redirect:/";
		}//if
		
		return "user/login";
	}//loginUser
	
}//end class

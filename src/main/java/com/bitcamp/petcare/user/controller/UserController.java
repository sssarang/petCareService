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
	
	@GetMapping("temp")
	public String temp() {
		return "user/articleCheck";
	}
	
	//view controller 매핑
	@PostMapping("join")
	public String joinUser(UserDTO dto, RedirectAttributes rttr) {
		log.debug("joinUser({}) invoked", dto);
		
		dto.setUserLatitude(43.123123);
		dto.setUserLongitude(54.123123);
		dto.setUserStatus('F');
		dto.setUserClassify('1');
		
		if(this.service.joinUser(dto) == 1 ) {
			rttr.addFlashAttribute("result", "success");
			return "redirect:/user/loginPage";
		}
		return "user/joinPage";
	}//joinUser
	
	//view controller 매핑
	@PostMapping("login")
	public String loginUser(UserDTO dto) {
		log.debug("loginUser({}) invoked", dto);

		
		UserVO user = service.loginUser(dto);
		if(user != null) {
			return "redirect:/";
		}//if
		
		return "user/loginPage";
	}//loginUser
	
}//end class

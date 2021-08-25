package com.bitcamp.petcare.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	String x;	//경도
	String y;	//위도
	
	//view controller 매핑
	@PostMapping("join")
	public String joinUser(UserDTO dto, RedirectAttributes rttr) {
		log.debug("joinUser({}) invoked", dto);
		
		dto.setUserLatitude(Double.parseDouble(y));
		dto.setUserLongitude(Double.parseDouble(x));
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
	
	//이메일로 인증번호 전송
	@RequestMapping(value="authDo", method=RequestMethod.POST)
	@ResponseBody
	public String authDo(String email) {
		log.debug("authDo({}) invoked", email);
		
		String authKey = service.sendAuthMail(email);
		
        return authKey;
	}//authDo
	
	//이메일 중복확인
	@RequestMapping(value="emailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String emailCheck(String email) {
		log.debug("emailCheck() invoked");
		
		String result = service.checkId(email);
		
		if(result.equals("success")) {
			log.info("아이디 사용가능");
			return result;
		} else {
			log.info("아이디 중복");
			return result;
		}//if-else
		
	}//emailCheck

	//닉네임 중복 확인
	@GetMapping("nickNameCheck")
	@ResponseBody
	public String nickNameCheck(String nickName) {
		log.debug("nickNameCheck invoked");
		
		String result = service.checkNickName(nickName);
		
		if(result.equals("success")) {
			log.info("닉네임 사용가능");
			return result;
		} else {
			log.info("닉네임 중복");
			return result;
		}//if-else
		
	}//nickNameCheck
	
	//좌표값 받아오는 메소드
	@RequestMapping(value="coordinate", method=RequestMethod.POST)
	@ResponseBody
	public String coordinate(String x, String y) {
		log.debug("coordinate({}, {}) invoked",x, y);
		this.x = x;
		this.y = y;
		
		return null;
	}//authDo
	
}//end class

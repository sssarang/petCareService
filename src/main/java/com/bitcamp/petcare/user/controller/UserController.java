package com.bitcamp.petcare.user.controller;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	public static final String loginKey = "__LOGIN__";
	Double x;			//경도
	Double y;			//위도
	String classify;	//회원 구분
	
	@GetMapping("temp")
	public void temp() {
		;;
	}
	
	//view controller 매핑
	//회원가입
	@PostMapping("join")
	public String joinUser(UserDTO dto, RedirectAttributes rttr) {
		log.debug("joinUser({}) invoked", dto);
		
		dto.setUserLatitude(y);		//회원가입시 주소의 위도
		dto.setUserLongitude(x);	//회원가입시 주소의 경도
		dto.setUserStatus("N");		//회원가입시 회원탈퇴 항목 'N'설정
		dto.setUserClassify(classify);
		log.info("\t + 위도 : {}, 경도 {}", x, y);
		
		if(this.service.joinUser(dto) == 1 ) {
			rttr.addFlashAttribute("result", "success");
			return "redirect:/user/loginPage";
		}
		return "user/joinPage";
	}//joinUser
	
	
	//view controller 매핑
	//로그인
	@PostMapping("login")
	public void loginUser(UserDTO dto, Model model, HttpSession session, HttpServletRequest req, HttpServletResponse res) throws Exception {
		log.debug("loginUser({}) invoked", dto);
		//==============================================================//
		//1. 전송파라미터에 해당되는 사용자가 있는지 확인
		//==============================================================//
		UserVO user = service.loginUser(dto);
		log.info("\t + user : {}", user);
		
		if(user != null) {
			model.addAttribute(UserController.loginKey, user);
			log.info("\t + model : {}", model);
			
			//model에 넣은 user객체가 interceptor의 modelandview에 담기지않아 controller에서 처리함
			session.setAttribute(loginKey, user);
			log.info("\t + 1. UserVO 객체를 Session Scope에 바인딩 완료");
			
			if(dto.isRememberMe()) {
				int maxAge = 1000 * 60 * 60 * 24 * 7;		//일주일(7일)
				
				String userId = dto.getUserId();
//				String rememberMe = session.getId();
				
				Date rememberMeMaxAge = new Date(System.currentTimeMillis() + maxAge);
				
				//사용자 테이블에 해당 사용자의 rememberMe 관련 2개 컬럼 업데이트 수행
				UserDTO rememberUpdate = new UserDTO();
				rememberUpdate.setUserId(userId);
				rememberUpdate.setRemember(session.getId());
				rememberUpdate.setRememberAge(rememberMeMaxAge);
				
				log.info("\t + userDTO : {}", rememberUpdate.getRememberAge());
				int affectedLines = this.service.modifyUserWithRememberMe(rememberUpdate);
				log.info("\t + affectedLines : {}", affectedLines);
			} //if : Remember-Me 옵션이 on일 때..
		}
	}//loginUser
	
//	@ResponseStatus(code=HttpStatus.OK)
	//로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		log.debug("logout({}) invoked", session.getId());
		
		//================================================================//
		// 1. 로그아웃을 수행한 사용자 정보를 출력
		//================================================================//
		UserVO user = (UserVO) session.getAttribute(loginKey);
		log.info("\t + user : {}", user);
		
		//================================================================//
		// 2. 세션 객체 무효화
		//================================================================//
		session.invalidate();		//현재의 세션을 무효화시킴
		log.debug("\t + Session destroyed");
		
		//================================================================//
		// N. 다시 로그인 창으로 이동
		//================================================================//
		
		return "redirect:/";
	}//logout
	
	//이메일로 인증번호 전송
	@RequestMapping(value="authDo", method=RequestMethod.POST)
	@ResponseBody
	public String authDo(String email) {
		log.debug("authDo({}) invoked", email);
		
		String authKey = service.sendAuthMail(email);
		
        return authKey;
	}//authDo
	
	//이메일 중복확인
	@PostMapping(value="emailCheck")
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
		this.x = Double.parseDouble(x);
		this.y = Double.parseDouble(y);
		
		return "success";
	}//coordinate
	
	//회원 구분
	@RequestMapping(value="userClassify", method=RequestMethod.POST)
	@ResponseBody
	public String userClassify(String classify) {
		log.debug("classify({}) invoked",classify);
		
		if(classify != null) {
			this.classify = classify;
		}
		return null;
	}//userClassify
	
	//사용자 동의 
	@PostMapping(value="userAgreeCheck")
	public String userAgree(HttpServletRequest req) throws Exception{
		log.debug("userAgree({}) invoked", req);
		
		//사용자 동의사항 데이터 처리

		if( (this.classify.equals("1")) || (this.classify == "2") ) {
			return "user/joinPage";
			
		}//if
		
		return "user/articleCheckPage";
	}//userAgree
	
	//비밀번호 찾기 - 아이디 확인
	@GetMapping(value="checkId")
	@ResponseBody
	public String checkId(String email) {
		log.debug("checkId() invoked");
		
		String isCheck = service.checkId(email);

		if( isCheck.equals("fail") ) {
			//아이디가 있는경우
			return "success";
		}
		return "fail";
	}//checkId
	
	//비밀번호 찾기 - 비밀번호 변경
	@PostMapping(value="chagePw")
	@ResponseBody
	public String changePw(UserDTO dto) {
		log.debug("changePw({}) invoked", dto);
		
		int result = this.service.changePw(dto);
		
		if(result == 1) {
			log.info("성공");
			return "성공";
			
		} else {
			log.info("실패");
			return "실패";
		}//if-else
	}//changePw
	
}//end class

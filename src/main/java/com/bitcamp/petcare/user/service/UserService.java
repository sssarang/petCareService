package com.bitcamp.petcare.user.service;

import java.util.Date;

import com.bitcamp.petcare.user.domain.UserDTO;
import com.bitcamp.petcare.user.domain.UserVO;

public interface UserService {

	public abstract int joinUser(UserDTO dto);							//회원가입
	public abstract UserVO loginUser(UserDTO dto);						//로그인
	public abstract String sendAuthMail(String email);					//메일 인증번호
	public abstract String checkId(String email);						//아이디 중복검사
	public abstract String checkNickName(String nickName); 				//닉네임 중복검사
	public abstract int changePw(UserDTO dto);							//비밀번호 변경
	
	//RememberMe
	public abstract int modifyUserWithRememberMe(UserDTO dto) throws Exception;
	public abstract UserVO findUserByRememberMe(String rememberMe) throws Exception;
	
	//encryption
	public abstract void encryption(UserDTO dto) throws Exception;		//비밀번호 암호화

}//end interface
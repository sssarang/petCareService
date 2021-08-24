package com.bitcamp.petcare.user.mapper;

import com.bitcamp.petcare.user.domain.UserDTO;
import com.bitcamp.petcare.user.domain.UserVO;

public interface UserMapper {
	
	public abstract int joinUser(UserDTO dto);		//회원가입
	public abstract UserVO loginUser(UserDTO dto);	//로그인
	public abstract int deleteUser(UserDTO dto);
	public abstract int updateUser(UserDTO dto);
	public abstract String checkId(String email);	//닉네임체크
	public abstract String checkNickName(String nickName);	//닉네임체크

}//end interface

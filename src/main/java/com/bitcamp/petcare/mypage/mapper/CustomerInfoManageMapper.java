package com.bitcamp.petcare.mypage.mapper;

import com.bitcamp.petcare.mypage.domain.CustomerInfoManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerInfoManageVO;
import com.bitcamp.petcare.mypage.domain.UserPasswordDTO;
import com.bitcamp.petcare.mypage.domain.userPasswordVO;

public interface CustomerInfoManageMapper {

	
	public abstract CustomerInfoManageVO readInfo(Integer userNo);		// 회원정보 조회
	public abstract int updateInfo(CustomerInfoManageDTO dto);			// 회원정보 수정
	public abstract userPasswordVO readPw(Integer userNo);				// 암호화 비밀번호 조회
	public abstract int updatePw(UserPasswordDTO dto);					// 비밀번호 변경
	
} // end interface

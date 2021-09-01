package com.bitcamp.petcare.mypage.mapper;

import com.bitcamp.petcare.mypage.domain.CustomerProfileManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageVO;

public interface CustomerProfileManageMapper {

	public abstract CustomerProfileManageVO readProfile(Integer userNo);	// 프로필 정보 불러오기
	
	public abstract int insertProfile(CustomerProfileManageDTO dto);	// 새로운 프로필 등록
	
	public abstract int updateProfile(CustomerProfileManageDTO dto);	// 프로필 정보 수정
	
	
}	// end interface


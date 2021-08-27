package com.bitcamp.petcare.mypage.mapper;

import com.bitcamp.petcare.mypage.domain.customerProfileManageDTO;
import com.bitcamp.petcare.mypage.domain.customerProfileManageVO;

public interface customerProfileManageMapper {

	public abstract customerProfileManageVO readProfile();				// 프로필 정보 불러오기
	
	public abstract void insertProfile(customerProfileManageDTO dto);	// 프로필 정보 입력하기
	
	public abstract void updateProfile(customerProfileManageDTO dto);	// 프로필 정보 수정하기
	
	
}	// end interface


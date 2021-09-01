package com.bitcamp.petcare.mypage.service;

import com.bitcamp.petcare.mypage.domain.CustomerHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerResvManageVO;

public interface MypageService {

	public abstract CustomerProfileManageVO getProfile(Integer userNo);	// 프로필 정보 가져오기
	
	public abstract int registerProfile(CustomerProfileManageDTO dto);	// 새로운 프로필 등록
	
	public abstract int modifyProfile(CustomerProfileManageDTO dto);	// 프로필 수정
	
	public abstract CustomerHistoryManageVO readHistory(Integer serviceId);		// 이력 조회
	
	public abstract CustomerResvManageVO readResv(Integer serviceId);	// 예약 조회
	
}	// end interface

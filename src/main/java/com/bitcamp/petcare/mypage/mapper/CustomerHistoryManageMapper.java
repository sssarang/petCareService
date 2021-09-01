package com.bitcamp.petcare.mypage.mapper;

import com.bitcamp.petcare.mypage.domain.CustomerHistoryManageVO;

public interface CustomerHistoryManageMapper {

	
	public abstract CustomerHistoryManageVO readHistory(Integer serviceId);		// 이력 조회
	
}	// end interface

package com.bitcamp.petcare.mypage.mapper;

import java.util.List;

import com.bitcamp.petcare.mypage.domain.CustomerHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageDTO;

public interface CustomerHistoryManageMapper {

	
	public abstract List<CustomerHistoryManageVO> readHistory(Integer petUserNo);		// 이력 조회
	

	
}	// end interface

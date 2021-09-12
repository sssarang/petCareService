package com.bitcamp.petcare.mypage.mapper;

import com.bitcamp.petcare.mypage.domain.CustomerInfoManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerStepTypeCodeVO;

public interface CustomerInfoManageMapper {

	
	public abstract CustomerInfoManageVO readInfo(Integer userNo);
	
} // end interface

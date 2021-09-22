package com.bitcamp.petcare.mypage.mapper;

import java.util.List;

import com.bitcamp.petcare.mypage.domain.SitterHistoryManageVO;

public interface SitterHistoryManageMapper {

	public abstract List<SitterHistoryManageVO> getHistory(Integer petSitterNo);
	
} // end interface

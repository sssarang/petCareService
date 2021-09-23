package com.bitcamp.petcare.mypage.mapper;

import java.util.List;

import com.bitcamp.petcare.mypage.domain.SitterResvManageVO;

public interface SitterResvManageMapper {
	
	public abstract List<SitterResvManageVO> getResv(Integer petSitterNo);
	public abstract int resvApprove(Integer serviceId);
	public abstract int resvRefusal(Integer serviceId);
	public abstract int resvCompletion(Integer serviceId);

} // end interface

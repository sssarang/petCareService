package com.bitcamp.petcare.mypage.mapper;

import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerResvManageVO;

public interface CustomerResvManageMapper {

	public abstract CustomerResvManageVO readResv(Integer petUserNo);
	public abstract CustomerPaymentManageVO readPayment(Integer serviceId);
	public abstract int insertPayment(CustomerPaymentManageDTO dto);
	public abstract int cancelResv(Integer serviceId);
	
}	// end interface



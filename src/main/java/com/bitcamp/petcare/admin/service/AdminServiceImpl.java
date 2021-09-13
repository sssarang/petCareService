package com.bitcamp.petcare.admin.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.petcare.admin.domain.AdminDTO;
import com.bitcamp.petcare.admin.domain.AdminVO;
import com.bitcamp.petcare.admin.mapper.AdminMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class AdminServiceImpl implements AdminService{
	
	@Setter(onMethod_=@Autowired)
	private AdminMapper mapper;

	@Override
	public int insertFAQ(AdminDTO dto) {
		log.debug("updateFAQ({}) invoed", dto);
		
		Objects.requireNonNull(dto);
		
		int result = this.mapper.insertFAQ(dto);
		
		return result;
	}//updateFAQ

	@Override
	public int deleteFAQ(AdminDTO dto) {
		log.debug("deleteFAQ({}) invoked", dto);
		
		Objects.requireNonNull(dto);
		
		int result = this.mapper.deleteFAQ(dto);
		return result;
	}//deleteFAQ

	@Override
	public int updateFAQ(AdminDTO dto) {
		log.debug("updateFAQ({}) invoked", dto);
		
		Objects.requireNonNull(dto);
		
		int result = this.mapper.updateFAQ(dto);
		return result;
	}//updateFAQ

	@Override
	public AdminVO selectFAQ(AdminDTO dto) {
		log.debug("selectFAQ({}) invoked", dto);
		
		Objects.requireNonNull(dto);
		
		AdminVO vo = this.mapper.selectFAQ(dto);
		return vo;
	}//selectFAQ
	
	
}//end class

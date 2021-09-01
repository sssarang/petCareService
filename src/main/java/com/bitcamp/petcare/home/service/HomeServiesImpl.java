package com.bitcamp.petcare.home.service;

import java.util.List;
import java.util.Objects;

import org.springframework.stereotype.Service;

import com.bitcamp.petcare.home.domain.FaqVO;
import com.bitcamp.petcare.home.domain.ReviewVO;
import com.bitcamp.petcare.home.mapper.HomeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@Service
public class HomeServiesImpl implements HomeService {
	
	private HomeMapper mapper;
	

	@Override
	public List<FaqVO> getFaq() {
		log.debug("getFaq() invoked");
		
		Objects.requireNonNull(this.mapper);
		
		return mapper.getFaq();
	} //getFaq


	@Override
	public List<ReviewVO> getReview() {
		log.debug("getReview() invoked");
		
		Objects.requireNonNull(this.mapper);
		
		return mapper.getReview();
	} //getReview

} //end class

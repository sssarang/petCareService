package com.bitcamp.petcare.home.mapper;

import java.util.List;

import com.bitcamp.petcare.home.domain.FaqVO;
import com.bitcamp.petcare.home.domain.ReviewVO;

public interface HomeMapper {
	
	public abstract List<FaqVO> getFaq();  //faq 조회
	
	public abstract List<ReviewVO> getReview();   //review조회

} //end class

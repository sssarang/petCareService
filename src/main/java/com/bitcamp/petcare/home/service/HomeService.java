package com.bitcamp.petcare.home.service;

import java.util.List;

import com.bitcamp.petcare.home.domain.FaqVO;
import com.bitcamp.petcare.home.domain.ReviewVO;

public interface HomeService {
	
	public abstract List<FaqVO> getFaq();    // 모든 faq 조회 
	
	public abstract List<ReviewVO> getReview();   // review 조회

} //end interface

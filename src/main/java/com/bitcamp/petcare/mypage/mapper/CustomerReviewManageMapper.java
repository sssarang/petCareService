package com.bitcamp.petcare.mypage.mapper;

import com.bitcamp.petcare.mypage.domain.CustomerReviewManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageVO;

public interface CustomerReviewManageMapper {
	
	public abstract CustomerReviewManageVO readReview(Integer serviceId);	// 리뷰 조회
	public abstract int insertReview(CustomerReviewManageDTO dto);	// 리뷰 입력
	public abstract int updateReview(CustomerReviewManageDTO dto);	// 리뷰 수정

}	// end interface

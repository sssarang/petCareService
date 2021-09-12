package com.bitcamp.petcare.mypage.service;

import java.util.List;

import com.bitcamp.petcare.mypage.domain.CustomerHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerInfoManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerResvManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageVO;

public interface MypageService {

	// 회원정보관리 페이지
	public abstract CustomerInfoManageVO readInfo(Integer userNo);
	
	
	// 프로필 페이지
	public abstract CustomerProfileManageVO readProfile(Integer userNo);				// 프로필 정보 가져오기
	public abstract int registerProfile(CustomerProfileManageDTO dto);				// 새로운 프로필 등록
	public abstract int modifyProfile(CustomerProfileManageDTO dto);				// 프로필 수정
	
	
	// 이력관리 페이지
	public abstract List<CustomerHistoryManageVO> readHistory(Integer serviceId);	// 이력 조회
	
	// 리뷰관련
	public abstract CustomerReviewManageVO readReview(Integer serviceId);			// 리뷰 조회
	public abstract int registerReview(CustomerReviewManageDTO dto);				// 리뷰 작성
	public abstract int modifyReview(CustomerReviewManageDTO dto);					// 리뷰 수정
	
	// 예약관리 페이지
	public abstract CustomerResvManageVO readResv(Integer petUserNo);				// 예약 조회
	public abstract CustomerPaymentManageVO readPayment(Integer serviceId);			// 결제 조회
	public abstract int insertPayment(CustomerPaymentManageDTO dto);				// 결제 방법 작성
	public abstract int cancelResv(Integer serviceId);								// 예약 취소
	
}	// end interface

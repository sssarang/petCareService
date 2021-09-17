package com.bitcamp.petcare.mypage.service;

import java.util.List;

import com.bitcamp.petcare.mypage.domain.CustomerHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerInfoManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerInfoManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerResvManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageVO;
import com.bitcamp.petcare.mypage.domain.userPasswordVO;
import com.bitcamp.petcare.user.domain.UserDTO;

public interface MypageService {

	// 회원정보관리 페이지
	public abstract CustomerInfoManageVO readInfo(Integer userNo);					// 회원정보 조회
	public abstract int modifyInfo(CustomerInfoManageDTO dto);						// 회원정보 수정
	public abstract userPasswordVO readPw(Integer userNo);							// 암호화 비밀번호 조회
	public abstract String encryption(String oldPw) throws Exception;					//비밀번호 암호화
	
	// 프로필 페이지
	public abstract CustomerProfileManageVO readProfile(Integer userNo);			// 프로필 정보 조회
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

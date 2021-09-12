package com.bitcamp.petcare.mypage.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.petcare.mypage.domain.CustomerHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerInfoManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerResvManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerStepTypeCodeVO;
import com.bitcamp.petcare.mypage.mapper.CustomerHistoryManageMapper;
import com.bitcamp.petcare.mypage.mapper.CustomerInfoManageMapper;
import com.bitcamp.petcare.mypage.mapper.CustomerProfileManageMapper;
import com.bitcamp.petcare.mypage.mapper.CustomerResvManageMapper;
import com.bitcamp.petcare.mypage.mapper.CustomerReviewManageMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class MypageServiceImpl implements MypageService {

	@Setter(onMethod_= @Autowired)
	private CustomerInfoManageMapper infoMapper;
	
	@Setter(onMethod_= @Autowired)
	private CustomerProfileManageMapper profileMapper;
	
	@Setter(onMethod_= @Autowired)
	private CustomerHistoryManageMapper historyMapper;
	
	@Setter(onMethod_= @Autowired)
	private CustomerResvManageMapper resvMapper;
	
	@Setter(onMethod_= @Autowired)
	private CustomerReviewManageMapper reviewMapper;
	
	
	//================================================================
	// 회원정보관리 페이지	
	
	@Override
	public CustomerInfoManageVO readInfo(Integer userNo) {
		log.debug("readInfo({}) invoked.", userNo);
		
		Objects.requireNonNull(this.infoMapper);
		
		return this.infoMapper.readInfo(userNo);
		
	}	// readResv
	
	
	
	//================================================================
	// 프로필 페이지
	
	@Override
	public CustomerProfileManageVO readProfile(Integer userNo) {					// 프로필 조회
		log.debug("getProfile({}) invoked.", userNo);
		
		Objects.requireNonNull(this.profileMapper);
		
		return this.profileMapper.readProfile(userNo);
	}	// getProfile

	@Override
	public int registerProfile(CustomerProfileManageDTO dto) {					// 프로필 등록
		log.debug("registerProfile({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.profileMapper.insertProfile(dto);
	}	//registerProfile

	@Override
	public int modifyProfile(CustomerProfileManageDTO dto) {					// 프로필 수정
		log.debug("modifyProfile({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.profileMapper.updateProfile(dto);
	}	//modifyProfile
	
	
	//================================================================
	// 이력 관리 페이지
	
	@Override
	public List<CustomerHistoryManageVO> readHistory(Integer petUserNo) {		// 이력 조회
		log.debug("readHistory({}) invoked.", petUserNo);
		
		Objects.requireNonNull(this.historyMapper);
		
		return this.historyMapper.readHistory(petUserNo);
	}	// readHistory
	
	
	@Override
	public CustomerReviewManageVO readReview(Integer serviceId) {
		log.debug("getReview({}) invoked.", serviceId);
		
		
		return this.reviewMapper.readReview(serviceId);
	}	// getReview
	
	@Override
	public int registerReview(CustomerReviewManageDTO dto) {
		log.debug("registerReview() invoked.");
		
		Objects.requireNonNull(this.reviewMapper);
		
		return this.reviewMapper.insertReview(dto);
	}	// registerReview

	@Override
	public int modifyReview(CustomerReviewManageDTO dto) {
		log.debug("modifyReview() invoked.");
		
		Objects.requireNonNull(this.reviewMapper);
		
		return this.reviewMapper.updateReview(dto);
	}	// modifyReview
	
	
	//================================================================
	// 예약 관리 페이지
	@Override
	public CustomerResvManageVO readResv(Integer petUserNo) {					// 예약 조회
		log.debug("readResv() invoked.");
		
		
		return this.resvMapper.readResv(petUserNo);
	}	// readResv

	@Override
	public CustomerPaymentManageVO readPayment(Integer serviceId) {				// 결제정보 조회
		log.debug("readPayment() invoked.");
		
		return this.resvMapper.readPayment(serviceId);
	}	// readPayment
	
	
	@Override
	public int insertPayment(CustomerPaymentManageDTO dto) {					// 결제정보 입력
		log.debug("insertPayment() invoked.");
		
		return this.resvMapper.insertPayment(dto);
	}



	@Override	
	public int cancelResv(Integer serviceId) {									// 예약 취소
		log.debug("cancelResv() invoked");
		
		return this.resvMapper.cancelResv(serviceId);
	}	// insertPayment





	

	
}	// end class

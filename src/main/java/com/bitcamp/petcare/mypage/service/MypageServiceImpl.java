package com.bitcamp.petcare.mypage.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.petcare.mypage.domain.CustomerHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerResvManageVO;
import com.bitcamp.petcare.mypage.mapper.CustomerHistoryManageMapper;
import com.bitcamp.petcare.mypage.mapper.CustomerProfileManageMapper;
import com.bitcamp.petcare.mypage.mapper.CustomerResvManageMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class MypageServiceImpl implements MypageService {

	@Setter(onMethod_= @Autowired)
	private CustomerProfileManageMapper profileMapper;
	
	@Setter(onMethod_= @Autowired)
	private CustomerHistoryManageMapper historyMapper;
	
	@Setter(onMethod_= @Autowired)
	private CustomerResvManageMapper resvMapper;
	
	
	@Override
	public CustomerProfileManageVO getProfile(Integer userNo) {					// 프로필 조회
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
	
	
	@Override
	public CustomerHistoryManageVO readHistory(Integer serviceId) {				// 이력 조회
		log.debug("readHistory({}) invoked.", serviceId);
		
		Objects.requireNonNull(this.historyMapper);
		
		return this.historyMapper.readHistory(serviceId);
	}	// readHistory
	
	@Override
	public CustomerResvManageVO readResv(Integer serviceId) {					// 예약 조회
		log.debug("readResv() invoked.");
		
		Objects.requireNonNull(this.resvMapper);
		
		return this.resvMapper.readResv(serviceId);
	}	// readResv

}	// end class

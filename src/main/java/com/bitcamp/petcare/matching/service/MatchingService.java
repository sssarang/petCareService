package com.bitcamp.petcare.matching.service;

import java.util.List;

import com.bitcamp.petcare.matching.domain.MatchingDTO;
import com.bitcamp.petcare.matching.domain.MatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceCalendarVO;
import com.bitcamp.petcare.matching.domain.ServiceMatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceTypeVO;

public interface MatchingService {
	
	public abstract MatchingVO getUserPet(Integer userNo);   // user + pet정보 가져오기

	public abstract boolean  registerMatcing(MatchingDTO matching);
	
	public abstract List<ServiceTypeVO> getServiceType(Integer userNo);  // serviceType 정보 가져오기

	public abstract List<ServiceCalendarVO> getServiceCalendar(Integer userNo);  // serviceType 정보 가져오기
	
	public abstract List<ServiceMatchingVO> getServiceMatching(Integer petUserNo);  // 예약테이블 가져오기

	
} //end interface

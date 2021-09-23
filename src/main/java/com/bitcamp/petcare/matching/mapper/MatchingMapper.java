package com.bitcamp.petcare.matching.mapper;

import java.util.List;

import com.bitcamp.petcare.matching.domain.MatchingDTO;
import com.bitcamp.petcare.matching.domain.MatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceCalendarVO;
import com.bitcamp.petcare.matching.domain.ServiceMatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceTypeVO;


public interface MatchingMapper {

	public abstract MatchingVO getUserPet(Integer userNo);   // user + pet정보 가져오기
	
	public abstract int insertMatcingSelectKey(MatchingDTO serviceMatching);   // 새로운 예약내역 등록(생성된 pk값 출력)
	
	public abstract List<ServiceTypeVO> getServiceType(Integer userNo);   // 펫시터별 가능한 서비스 가져오기 

	public abstract List<ServiceCalendarVO> getServiceCalendar(Integer userNo);   // 펫시터별 가능한 서비스 날짜 가져오기

	public abstract List<ServiceMatchingVO> getServiceMatching(Integer petUserNo);   // 예약테이블 가져오기

	
} //end interface

package com.bitcamp.petcare.matching.mapper;

import com.bitcamp.petcare.matching.domain.MatchingDTO;
import com.bitcamp.petcare.matching.domain.MatchingVO;


public interface MatchingMapper {

	public abstract MatchingVO getUserPet(Integer userNo);   // user + pet정보 가져오기
	
	public abstract int insertMatcingSelectKey(MatchingDTO serviceMatching);   // 새로운 예약내역 등록(생성된 pk값 출력)
	
} //end interface

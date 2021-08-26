package com.bitcamp.petcare.matching.service;

import com.bitcamp.petcare.matching.domain.MatchingDTO;
import com.bitcamp.petcare.matching.domain.MatchingVO;

public interface MatchingService {
	
	public abstract MatchingVO getUserPet(Integer userNo);   // user + pet정보 가져오기

	public abstract boolean  registerMatcing(MatchingDTO matching);
} //end interface

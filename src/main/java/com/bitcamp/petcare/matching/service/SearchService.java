package com.bitcamp.petcare.matching.service;

import java.util.List;
import com.bitcamp.petcare.matching.domain.PetSitterDTO;

public interface SearchService {

	public abstract List<PetSitterDTO> getPsList();				//펫시터리스트조회
	
	public abstract PetSitterDTO getPs(Integer userNO);			//특정 펫시터프로필조회

} //end interface

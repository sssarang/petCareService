package com.bitcamp.petcare.matching.service;

import java.util.List;

import com.bitcamp.petcare.matching.domain.FilterDTO;
import com.bitcamp.petcare.matching.domain.PetSitterDTO;

public interface SearchService {

	public abstract List<PetSitterDTO> getList(FilterDTO filterDTO);		//펫시터리스트조회
	
	public abstract int getTotal(FilterDTO cri);								//펫시터 리스트 개수 조회하여 반환
		
	public abstract PetSitterDTO getPs(Integer userNO);						//특정 펫시터프로필 정보조회

	public abstract List<PetSitterDTO> getServiceType(Integer userNO);		//특정 펫시터프로필 정보조회(서비스유형)

	public abstract List<PetSitterDTO> getServiceCalendar(Integer userNO);	//특정 펫시터프로필 정보조회(서비스일정)

	public abstract List<PetSitterDTO> getServicePetKinds(Integer userNO);	//특정 펫시터프로필 정보조회(서비스반려동물)
	
	public abstract List<PetSitterDTO> getPsSkill(Integer userNO);			//특정 펫시터프로필 정보조회(펫시터스킬)
	
	public abstract List<PetSitterDTO> getActivityPhoto(Integer userNO);	//특정 펫시터프로필 정보조회(활동사진)
	
	public abstract List<PetSitterDTO> getReview(Integer userNO);			//특정 펫시터프로필 정보조회(리뷰+답글)

	
} //end interface

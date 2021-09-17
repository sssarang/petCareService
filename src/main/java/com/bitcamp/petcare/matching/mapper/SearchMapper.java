package com.bitcamp.petcare.matching.mapper;

import java.util.List;

import com.bitcamp.petcare.matching.domain.FilterDTO;
import com.bitcamp.petcare.matching.domain.PetSitterDTO;


public interface SearchMapper {
		
	public abstract List<PetSitterDTO> getList(FilterDTO filterDTO);		//펫시터 리스트조회

	public abstract int getTotal(FilterDTO cri);								//펫시터 리스트 총 레코드 건수 얻기

	//=================================================================================================//
	
	public abstract PetSitterDTO getPs(Integer userNO);						//특정 펫시터프로필조회(기본정보)
	
	public abstract List<PetSitterDTO> getServiceType(Integer userNO);		//특정 펫시터프로필 정보조회(서비스유형)

	public abstract List<PetSitterDTO> getServiceCalendar(Integer userNO);	//특정 펫시터프로필 정보조회(서비스일정)

	public abstract List<PetSitterDTO> getServicePetKinds(Integer userNO);	//특정 펫시터프로필 정보조회(서비스반려동물)
	
	public abstract List<PetSitterDTO> getPsSkill(Integer userNO);			//특정 펫시터프로필 정보조회(펫시터스킬)
	
	public abstract List<PetSitterDTO> getActivityPhoto(Integer userNO);	//특정 펫시터프로필 정보조회(활동사진)
	
	public abstract List<PetSitterDTO> getReview(Integer userNO);			//특정 펫시터프로필 정보조회(리뷰+답글)

} //end interface

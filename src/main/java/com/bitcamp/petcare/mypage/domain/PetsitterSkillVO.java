package com.bitcamp.petcare.mypage.domain;

import lombok.Value;

@Value
public class PetsitterSkillVO {
	
	// tbl_petsitter_skill 
	
	private Integer userNo;
	private String skillTypeCode;
	private String codeName;
	private Character useYn;
	   
} // end class

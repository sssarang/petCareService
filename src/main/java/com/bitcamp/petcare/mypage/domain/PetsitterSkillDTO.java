package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PetsitterSkillDTO {

	private Integer userNo;
	private String skillTypeCode;
	private Character useYn;
	
	private Integer regUserNo;	
	private Date regDate;
	
	private Integer modUserNo;			
	private Date modDate;
	
	private String[] arrSkillTypeCode;
	
	private Character takingMedicine;
	private Character oldPetExperience;
	private Character sickPetExperience;
	private Character petJobExperience;
	
} // end class

package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PetsitterSkillDTO {

	private Integer userNo;
	private String skillTypeCode;
	private Character useYn;
	
	private Integer regUserNo;							
	
	private Integer modUserNo;			
	private Date modDate;
	
	
} // end class

package com.bitcamp.petcare.matching.domain;

import java.util.Date;

import lombok.Value;


@Value
public class PetSitterVO {

	//TBL_PETSITTER_PROFILE
	private Integer userNo;
	private String proPhoto;
	private String introduce;

	//TBL_SERVICE_TYPE
	private String serviceTypeCode;
	private Integer price;
	
	//TBL_SERVICE_CALENDAR
	private Date serviceDate;
	
	//TBL_SERVICE_PETKINDS
	private String petTypeCode;

	//TBL_PETSITTER_SKILL
	private String skillTypeCode;
	
	//TBL_ACTIVITY_PHOTO
	private Integer phtoNo;
	private String actPhoto;
	
} //end class

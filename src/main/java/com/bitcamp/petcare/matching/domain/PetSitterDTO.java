package com.bitcamp.petcare.matching.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = true)
public class PetSitterDTO extends CommonDTO {

	//TBL_PETSITTER_PROFILE
	private String proPhoto;
	private String introduce;
	private Double avg; 	//리뷰평균평점

	//TBL_SERVICE_TYPE
	private String serviceTypeCode;
	private Integer price;
	
	//TBL_SERVICE_CALENDAR
	private String serviceDate;
	
	//TBL_SERVICE_PETKINDS
	private String petTypeCode;

	//TBL_PETSITTER_SKILL
	private String skillTypeCode;
	
	//TBL_ACTIVITY_PHOTO
	private Integer photoNo;
	private String actPhoto;
	
	//TBL_REVIEW
	private Double grade;
	private String petPhoto;
	private String revContent;
	private String revWriter;
	private String revDate;
	
	//TBL_REPLY
	private String repContent;
	private String writer;
	private String repDate;

} //end class

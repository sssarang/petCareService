package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ActivityPhotoDTO {

	private Integer userNo;
	private Integer photoNo;
	private String actPhoto;
	
	private Integer regUserNo;							
	
	private Integer modUserNo;			
	private Date modDate;	
	
} // end class

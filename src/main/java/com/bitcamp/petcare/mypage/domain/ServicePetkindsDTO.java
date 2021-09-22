package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ServicePetkindsDTO {

	private Integer userNo;
	private String petTypeCode;
	private Character useYn;
	
	private Integer regUserNo;							
	
	private Integer modUserNo;			
	private Date modDate;
	
} // end class

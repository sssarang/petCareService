package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ServicePetkindsDTO {

	private Integer userNo;
	private String petTypeCode;
	private Character useYn;
	
	private Integer regUserNo;	
	private Date regDate;
	
	private Integer modUserNo;			
	private Date modDate;
	
	private String[] arrPetTypeCode;
	
	private Character bigDog;
	private Character middleDog;
	private Character smallDog;
	private Character cat;
	
} // end class

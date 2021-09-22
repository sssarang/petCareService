package com.bitcamp.petcare.mypage.domain;

import lombok.Value;

@Value
public class ServicePetkindsVO {
	
	// tbl_service_petkinds
	
	private Integer userNo;
	private String petTypeCode;
	private String codeName;
	private Character useYn;
	   
} // end class

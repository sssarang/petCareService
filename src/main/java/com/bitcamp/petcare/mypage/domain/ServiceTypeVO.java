package com.bitcamp.petcare.mypage.domain;

import lombok.Value;

@Value
public class ServiceTypeVO {
	
	// tbl_service_type
	
	private Integer userNo;
	private String serviceTypeCode;
	private String codeName;
	private Character useYn;
	private Integer price;

} // end class

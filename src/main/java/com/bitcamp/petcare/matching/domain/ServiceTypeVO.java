package com.bitcamp.petcare.matching.domain;

import lombok.Value;


@Value
public class ServiceTypeVO {

	// tbl_service_type
	private Integer userNo;
	private String serviceTypeCode;
	private Character useYn;
	private Integer price;
	
	// tbl_common_code
	private String codeName;
	
} //emd class

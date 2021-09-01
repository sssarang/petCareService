package com.bitcamp.petcare.matching.domain;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class MatchingDTO {
	
	
	// tbl_service_matching
	private Integer serviceId;
	private String startDate;
	private String endDate;
	private String serviceTypeCode;
	private String petTypeCode;
	private Integer petUserNo;
	private Integer petSitterNo;
	private Integer regUserNo;
	

} //end class

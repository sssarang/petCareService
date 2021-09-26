package com.bitcamp.petcare.mypage.domain;

import lombok.Data;

@Data
public class ServiceCalendarDTO {
	
	private Integer userNo;
	private String serviceDate;
	private String[] serviceDateList;
	
	private String serviceYM;

} // end class

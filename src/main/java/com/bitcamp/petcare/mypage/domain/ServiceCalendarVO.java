package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Value;


@Value
public class ServiceCalendarVO {
	
	// tbl_service_calendar
	
	private Integer userNo;
	private Date serviceDate;

} // end class

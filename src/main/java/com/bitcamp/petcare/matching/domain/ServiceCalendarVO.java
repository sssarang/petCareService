package com.bitcamp.petcare.matching.domain;

import java.util.Date;
import lombok.Value;


@Value
public class ServiceCalendarVO {
	
	//tbl_service_calendar
	private Integer userNo;
	
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date serviceDate;

} //end class

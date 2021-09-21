package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ServiceCalendarDTO {
	
	private Integer userNo;
	private Date serviceDate;
	
	private Integer regUserNo;							
	
	private Integer modUserNo;			
	private Date modDate;

} // end class

package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ServiceTypeDTO {
	
	private Integer userNo;
	private String serviceTypeCode;
	private Character useYn;
	private Integer price;
	
	private Integer regUserNo;	
	private Date regDate;
	
	private Integer modUserNo;			
	private Date modDate;
	
	private String[] arrServiceTypeCode;
	private Integer[] arrPrice;
	
	private Character careAllDay;
	private Character careHalfDay;
	private Character visitAllDay;
	private Character visitHalfDay;

} // end class

package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Value;

@Value
public class SitterHistoryManageVO {
	
	private Date startDate;
	private String codeName;
	private String userNickname;
	private String petName;
	private String proPhoto;
	
	private Integer serviceId;

} // end class

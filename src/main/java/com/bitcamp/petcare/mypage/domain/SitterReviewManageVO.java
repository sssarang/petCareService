package com.bitcamp.petcare.mypage.domain;

import lombok.Value;

@Value
public class SitterReviewManageVO {
	
	private Integer serviceId;	
	private Integer grade;
	private String revContent;		
	private String userNickname;

} // end class

package com.bitcamp.petcare.home.domain;

import lombok.Value;

@Value
public class ReviewVO {
	
	//tbl_review
	private Integer serviceId;
	private String revContent;
	
	//tbl_user
	private String userNickname;
	
	
	//tbl_petsitter_profile
	private String proPhoto;
	
} //end class

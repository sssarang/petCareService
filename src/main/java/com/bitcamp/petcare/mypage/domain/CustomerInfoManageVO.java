package com.bitcamp.petcare.mypage.domain;

import lombok.Value;

@Value
public class CustomerInfoManageVO {

	private String userNickname;		// 닉네임
	private String userId;				// 아이디
	private String userContact;			// 연락처
	private String userAddress;			// 주소
	private Double userLatitude;		// 위도
	private Double userLongitude;		// 경도
	private String userGender;			// 성별
	
	
}	// end class

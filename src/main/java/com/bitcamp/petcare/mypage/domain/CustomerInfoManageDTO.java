package com.bitcamp.petcare.mypage.domain;

import lombok.Data;

@Data
public class CustomerInfoManageDTO {

	private Integer userNo;				// 회원번호
	private String userNickname;		// 닉네임
	private String userContact;			// 연락처
	private String userAddress;			// 주소
	private Double userLatitude;		// 위도
	private Double userLongitude;		// 경도
	
}	// end class

package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CustomerHistoryManageVO {

	// 이력관련
	
	private Date startDate;			// 서비스 시작일자
	private String codeName;		// 서비스 유형코드
	private String userNickname;	// 펫시터 닉네임
	private String userContact;		// 펫시터 연락처
	private String proPhoto;		// 펫시터 프로필사진
	private Integer totalAmount;	// 서비스 총 금액
	
	// 리뷰관련
	private Integer serviceId;		// 서비스 ID
	
}	// end class

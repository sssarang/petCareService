package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Value;

@Value
public class CustomerResvManageVO {
	
	// tbl_service_matching
	private Date regDate;				// 예약 등록일자
	private String stepCodeName;		// 예약진행단계코드
	private String userNickName;		// 펫시터 닉네임
	private String userContact;			// 펫시터 연락처
	private String serviceCodeName;		// 서비스유형코드
	private Integer price;				// 서비스 비용
	private Date startDate;				// 서비스 날짜
	
	
}	// end class

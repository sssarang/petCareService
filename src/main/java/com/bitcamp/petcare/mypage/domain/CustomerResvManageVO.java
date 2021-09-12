package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Value;

@Value
public class CustomerResvManageVO {
	
	// tbl_service_matching
	private Integer serviceId;			// 서비스아이디
	private String regDate;				// 예약 등록일자
	private String stepTypeCodeName;	// 예약진행단계코드
	private String proPhoto;			// 프로필 사진
	private String userNickname;		// 펫시터 닉네임
	private String userContact;			// 펫시터 연락처
	private String serviceCodeName;		// 서비스유형코드
	private Integer totalAmount;		// 서비스 비용
	private Date startDate;			// 서비스 날짜
	
	// 결제 관련
	private Integer petUserNo;			// 반려인 회원번호
}	// end class

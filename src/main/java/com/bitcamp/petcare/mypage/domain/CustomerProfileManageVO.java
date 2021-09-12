package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Value;

@Value
public class CustomerProfileManageVO {

//	tbl_pet_profile	
	private String proPhoto;			// 프로필 사진
	private String petTypeCode;			// 반려동물유형코드
	private String petName;				// 반려동물 이름
	private String petBirthday;			// 반려동물 생일
	private String petGender;		// 반려동물 성별
	private String neutralization;	// 중성화 여부
	private String medicine;			// 약 복용 여부
	private String specialNote;			// 특이사항
	
	
	
}	// end class

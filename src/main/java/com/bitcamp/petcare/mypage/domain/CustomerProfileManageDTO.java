package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Data;


@Data
public class CustomerProfileManageDTO {
	
	private Integer userNo;				// 회원번호
	private String petTypeCode;			// 반려동물유형코드
	private String petName;				// 반려동물 이름
	private Character petGender;		// 반려동물 성별
	private String petBirthday;			// 반려동물 생일
	private String proPhoto;			// 프로필 사진
	private Character neutralization;	// 중성화 여부
	private Character medicine;			// 약 복용 여부
	private String specialNote;			// 특이사항
	
	private Integer regUserNo;			// 등록자 회원번호
	private Date regDate;				// 등록일자
	
	private Integer modUserNo;			// 수정자 회원번호
	private Date modDate;				// 수정일자

}	// end class

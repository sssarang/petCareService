package com.bitcamp.petcare.matching.domain;

import java.util.Date;

import lombok.Data;


@Data
public class CommonDTO {

	private Character userYn;		//사용여부
	
	private String userNo;			//회원번호
	private String userId;			//아이디
	private String userPw;			//비밀번호
	private String userNickname;	//닉네임
	private String userContact;		//연락처
	private String userAddress;		//주소
	private Double userLatitude;	//위도
	private Double userLongitude;	//경도
	private Character userGender;	//성별
	private Character userClassify;	//회원구분
	private Character userStatus;	//회원상태
	
	private Integer regUserNo;		//등록자회원번호
	private Date regDate;			//등록일자
	private Integer modUserNo;		//수정자회원번호
	private Date modDate;			//수정일자
	
} //end class

package com.bitcamp.petcare.user.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	
	private String userNo;
	private String userId;
	private String userPw;
	private String userNickname;
	private String userContact;
	private String userAddress;
	private Double userLatitude;
	private Double userLongitude;
	private Character userGender;
	private Character userClassify;
	private Character userStatus;
	private String userRemeber;
	private Date userRememberage;
	private Integer regUserNo;
	private Date regDate;
	private Integer modUserNo;
	private Date modDate;
	
}//end class

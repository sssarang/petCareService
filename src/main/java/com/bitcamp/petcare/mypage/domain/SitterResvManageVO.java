package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import lombok.Value;

@Value
public class SitterResvManageVO {
	
	private Date regDate;
	private String userNickname;
	private String userContact;
	private String proPhoto;
	private String codeName;
	private Integer price;
	private Date startDate;
	private Date endDate;
	
	private String codeName2;
	private String codeName3;
	
	private String petName;
	private Date petBirthday;
	private String petGender;
	private String neutralization;
	private String medicine;
	private String specialNote;
	
	private Integer serviceId;


} // end class

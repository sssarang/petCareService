package com.bitcamp.petcare.matching.domain;

import lombok.Value;


@Value
public class MatchingVO {
	
	// tbl_user 
	private Integer userNo;
	private String userNickname;
	private String userContact;
	private String userAddress;
	
	// tbl_common_code
	private String codeName;
	
	// tbl_pet_profile
	private String petName;
	private String proPhoto;
	private String petBirthday;
	private Character petGender;
	private Character neutralization;
	private Character medicine;
	private String specialNote;
	
} //end class

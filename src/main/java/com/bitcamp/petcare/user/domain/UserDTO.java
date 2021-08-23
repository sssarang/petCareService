package com.bitcamp.petcare.user.domain;


import lombok.Data;

@Data
public class UserDTO {
	
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

}//end class

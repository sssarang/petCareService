package com.bitcamp.petcare.user.domain;


import java.util.Date;

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
	private String userGender;
	private String userClassify;
	private String userStatus;
	private String remember;
	private Date rememberAge;
	
	private boolean rememberMe;

}//end class

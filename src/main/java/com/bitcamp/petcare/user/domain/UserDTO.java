package com.bitcamp.petcare.user.domain;


import lombok.Data;

@Data
public class UserDTO {
	
	private String user_id;
	private String user_pw;
	private String user_nickname;
	private String user_contact;
	private String user_address;
	private Double user_latitude;
	private Double user_longitude;
	private Character user_gender;
	private Character user_classify;
	private Character user_status;

}

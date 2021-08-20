package com.bitcamp.petcare.user.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	
	private String user_no;
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
	private String user_remeber;
	private Date user_rememberage;
	private Integer reg_user_no;
	private Date reg_date;
	private Integer mod_user_no;
	private Date mod_date;
	
}//end class

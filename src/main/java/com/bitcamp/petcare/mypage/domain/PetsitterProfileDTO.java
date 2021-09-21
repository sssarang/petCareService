package com.bitcamp.petcare.mypage.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PetsitterProfileDTO {
	
	private Integer userNo;
	private String proPhoto;
	private MultipartFile proPhotoFile;	
	private String introduce;
	
	private Integer regUserNo;
	private Date regDate;	
	
	private Integer modUserNo;			
	private String modDate;	
	
} // end class

package com.bitcamp.petcare.mypage.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ActivityPhotoDTO {

	private Integer userNo;
	private Integer photoNo;
	private Integer[] photoNoList;

	private String actPhoto;
	private List<String> actPhotoList;
	
	private Integer regUserNo;							
	
	private Integer modUserNo;			
	private Date modDate;	
	
	private String fileName;
	
	private String[] arrFileNmae;
	
} // end class

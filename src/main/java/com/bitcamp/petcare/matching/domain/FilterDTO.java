package com.bitcamp.petcare.matching.domain;


import java.util.List;

import lombok.Data;


@Data
public class FilterDTO {

	private String petType;				//반려동물종류(강아지, 고양이)
	private String dogType;				//강아지유형(대형견, 중형견, 소형견)
	
	private List<String> serviceType;	//서비스유형
	
	private String addrSido;			//코드: 시/도 
	private String addrSigugun;			//코드: 시/군/구
	private String addrDong;			//코드: 동
	
	private String addrSidoNm;			//이름: 시/도
	private String addrSigugunNm;		//이름: 시/군/구
	private String addrDongNm;			//이름: 동
	
	private String startDate;			//서비스 시작일
	private String endDate;				//서비스 종료일
	
	private Integer minPrice;			//서비스 비용 최소
	private Integer maxPrice;			//서비스비용 최대
	
	private List<String> skillType;		//펫시터스킬유형
	
} //end class

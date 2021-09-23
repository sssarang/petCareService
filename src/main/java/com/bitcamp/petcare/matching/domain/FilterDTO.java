package com.bitcamp.petcare.matching.domain;


import java.util.List;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.extern.log4j.Log4j2;


@Data
@Log4j2
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
	
	//--------------------------------------------------//
	//                     페이징 처리                     //
	//--------------------------------------------------//
	private int currPage = 1;			//현재 보고자 하는 페이지 번호
	private int amount = 9;				//한 페이지당 보여줄 레코드 건수
	private int pagesPerPage = 3;		//각 페이지 아래에 보여줄 페이지 번호의 개수
		
	
	public String getPagingUri() {
		log.debug("getPagingUri() invoked");
	      
	    UriComponentsBuilder builder = UriComponentsBuilder.fromPath("");
	    builder.queryParam("currPage", this.currPage);
	    builder.queryParam("amount", this.amount);
	    builder.queryParam("pagesPerPage", this.pagesPerPage);
	      
	    log.info("\t+ pagingUri:"+builder.toUriString());
	    
	    return builder.toUriString();
	    
	} //getPagingUri
	
} //end class

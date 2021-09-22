package com.bitcamp.petcare.mypage.domain;

import lombok.Value;

@Value
public class CustomerReviewManageVO {


	// 리뷰관련
	private Integer serviceId;		// 서비스번호
	private String revContent;		// 리뷰내용
	private Integer grade;			// 평점
	private Integer userNo;			// 리뷰 작성자(반려인)
	
}	// end class

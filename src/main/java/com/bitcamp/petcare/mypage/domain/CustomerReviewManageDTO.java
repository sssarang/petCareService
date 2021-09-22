package com.bitcamp.petcare.mypage.domain;

import lombok.Data;

@Data
public class CustomerReviewManageDTO {
	
	private Integer serviceId;			// 서비스ID
	private String revContent;			// 리뷰내용
	private Integer grade;				// 평점
	private Integer userNo;				// 작성자 회원번호(반려인)

}	// end class

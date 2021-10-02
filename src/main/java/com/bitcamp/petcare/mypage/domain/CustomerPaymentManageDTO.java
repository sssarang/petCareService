package com.bitcamp.petcare.mypage.domain;

import lombok.Data;

@Data
public class CustomerPaymentManageDTO {

	private Integer serviceId;			// 서비스ID
	private String paymentTypeCode;		// 결제유형코드
	private Integer price;				// 결제금액
	private Integer userNo;				// 결제자회원번호
	private String paymentId;			// 결제번호
	
}	// end class

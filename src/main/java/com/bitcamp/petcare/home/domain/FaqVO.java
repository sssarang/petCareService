package com.bitcamp.petcare.home.domain;

import lombok.Value;

@Value
public class FaqVO {
	
	//tbl_faq
	private Integer faqSequence;
	private String faqQuestion;
	private String faqAnswer;

} //end class

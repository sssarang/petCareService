package com.bitcamp.petcare.admin.domain;

import lombok.Data;

@Data
public class FaqDTO {
	
	public int faqSequence;
	public String faqQuestion;
	public String faqAnswer;
	public int regUserNo;
	public int modUserNo;
	
}

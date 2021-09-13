package com.bitcamp.petcare.admin.domain;

import lombok.Data;

@Data
public class AdminDTO {
	
	public int faqSequence;
	public String faqQuestion;
	public String faqAnswer;
	public int regUserNo;
	public int modUserNo;
	
}

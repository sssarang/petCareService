package com.bitcamp.petcare.admin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FaqVO {

	public int faqSequence;
	public String faqQuestion;
	public String faqAnswer;
	public int regUserNo;
	public Date regDate;
	public int modUserNo;
	public Date modDate;
}

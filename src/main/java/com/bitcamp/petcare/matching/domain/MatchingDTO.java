package com.bitcamp.petcare.matching.domain;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class MatchingDTO {
	
	
	// tbl_service_matching
	private Integer service_id;
	private String start_date;
	private String end_date;
	private String service_type_code;
	private String pet_type_code;
	private Integer pet_user_no;
	private Integer pet_sitter_no;
	private Integer reg_user_no;
	

} //end class

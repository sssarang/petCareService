package com.bitcamp.petcare.matching.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/search/")
@Controller
public class SearchController {

	@GetMapping("service")
	public void read() {
		log .debug("page() invoked....!");
	
		
	} //read
	
} //end class

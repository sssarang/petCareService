package com.bitcamp.petcare.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		log.debug("homepage() invoked.");
		
		return "home/home";
	} //homepage
	
} //end class

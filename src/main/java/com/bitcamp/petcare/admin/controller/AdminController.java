package com.bitcamp.petcare.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.petcare.admin.service.AdminService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Setter(onMethod_=@Autowired)
	private AdminService service;
	
	@GetMapping("temp")
	public String temp() {
		return null;
	}
	
	@GetMapping("/")
	public String showMain() {
		return "admin/adminPage";
	}
	
	@GetMapping("/faq")
	public String showFAQ() {
		return "admin/faqPage";
	}
	
	@GetMapping("/petSitter")
	public String showPetSitter() {
		return "admin/petSitterPage";
	}
	
	@GetMapping("/normalUser")
	public String sohwNormalUser() {
		return "admin/normalUserPage";
	}
	
}//end class

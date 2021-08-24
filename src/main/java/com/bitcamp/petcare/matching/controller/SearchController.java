package com.bitcamp.petcare.matching.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.petcare.matching.domain.PetSitterDTO;
import com.bitcamp.petcare.matching.service.SearchService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/search/")
@Controller
public class SearchController {

	@Setter(onMethod_=@Autowired)
	private SearchService service;
	
	
	@GetMapping("service")
	public void getPsList(Model model) {
		log .debug("read() invoked...");
	
		List<PetSitterDTO> list = this.service.getPsList();
		
		Objects.requireNonNull(list);
		list.forEach(log::info);
		
		model.addAttribute("list", list);
		
	} //getPsList
	
	
} //end class

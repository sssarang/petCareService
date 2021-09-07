package com.bitcamp.petcare.matching.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.petcare.matching.domain.FilterDTO;
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
	
	
	@GetMapping("main")
	public String getList(
				FilterDTO filterDto, 
				Model model) {
		log .debug("getList({}, {}) invoked...", model);

		if(filterDto.getPetType() == null || "".equals(filterDto.getPetType())) {
			new RuntimeException("펫타입이 없습니다.");
		}else {
			List<PetSitterDTO> ps = this.service.getList(filterDto);
			Objects.requireNonNull(ps);
			log.info("\t+ list: {}", ps);
			model.addAttribute("list",ps);
		}
		
		log.info("\t+ filterDto : {}", filterDto);
		
		model.addAttribute("filter", filterDto);
		
		
		return "/search/search";
	} //getPsList
	

	@ResponseBody
	@PostMapping("searchList")
	public Map<String,Object> getSearchList(FilterDTO filterDto) {
		log .debug("getServiceList({}) invoked...");
		log.info(filterDto);
		
		List<PetSitterDTO> ps = this.service.getList(filterDto);
		Objects.requireNonNull(ps);
		
		log.info("\t+ list: {}", ps);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", ps);
		
		return map;
	} //getPsList
	
	
	@ResponseBody
	@PostMapping("psProfile")
	public Map<String,Object> getPs(@RequestParam("userNo")Integer userNo, Model model) {
		log.debug("getPs({}) invoked.", userNo);
		
		//리턴객체 map
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userNo", userNo);
		model.addAttribute("userNo", userNo);
		
		
		PetSitterDTO ps = this.service.getPs(userNo);
		Objects.requireNonNull(ps);
		log.info("\t+ ps : {}", ps);

		map.put("ps", ps);
		model.addAttribute("ps", ps);
		
		
		List<PetSitterDTO> serviceTypeList = this.service.getServiceType(userNo);
		Objects.requireNonNull(serviceTypeList);
		log.info("\t+ serviceTypeList : {}", serviceTypeList);

		map.put("serviceType", serviceTypeList);
		model.addAttribute("serviceType", serviceTypeList);
		
		
		List<PetSitterDTO> serviceCalendarList = this.service.getServiceCalendar(userNo);
		Objects.requireNonNull(serviceCalendarList);
		log.info("\t+ serviceCalendarList : {}", serviceCalendarList);

		map.put("pserviceCalendar", serviceCalendarList);
		model.addAttribute("pserviceCalendar", serviceCalendarList);
		
		
		List<PetSitterDTO> servicePetKindsList = this.service.getServicePetKinds(userNo);
		Objects.requireNonNull(servicePetKindsList);
		log.info("\t+ servicePetKindsList : {}", servicePetKindsList);

		map.put("servicePetKinds", servicePetKindsList);
		model.addAttribute("servicePetKinds", servicePetKindsList);
		
		
		List<PetSitterDTO> psSkillList = this.service.getPsSkill(userNo);
		Objects.requireNonNull(psSkillList);
		log.info("\t+ psSkillList : {}", psSkillList);

		map.put("psSkill", psSkillList);
		model.addAttribute("psSkill", psSkillList);
		
		
		List<PetSitterDTO> activityPhotoList = this.service.getActivityPhoto(userNo);
		Objects.requireNonNull(activityPhotoList);
		log.info("\t+ activityPhotoList : {}", activityPhotoList);

		map.put("activityPhoto", activityPhotoList);
		model.addAttribute("activityPhoto", activityPhotoList);
		
		
		List<PetSitterDTO> reviewList = this.service.getReview(userNo);
		Objects.requireNonNull(reviewList);
		log.info("\t+ reviewList : {}", reviewList);

		map.put("review", reviewList);
		model.addAttribute("review", reviewList);

		
		return map;
		
	} //getPs
	
	
} //end class

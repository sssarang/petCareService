package com.bitcamp.petcare.matching.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.petcare.matching.domain.FilterDTO;
import com.bitcamp.petcare.matching.domain.PageDTO;
import com.bitcamp.petcare.matching.domain.PetSitterDTO;
import com.bitcamp.petcare.matching.service.SearchService;
import com.bitcamp.petcare.user.controller.UserController;
import com.bitcamp.petcare.user.domain.UserVO;

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
		log .debug("getList({}, {}) invoked...", filterDto, model);

		List<PetSitterDTO> ps = this.service.getList(filterDto);
		PageDTO pageDTO = new PageDTO(filterDto, this.service.getTotal(filterDto));
		
		Objects.requireNonNull(ps);
		
		log.info("\t+ list: {}", ps);	
		log.info("\t+ filterDto : {}", filterDto);
		log.info("\t+ pageDTO : {}", pageDTO);
	
		model.addAttribute("list",ps);
		model.addAttribute("filter", filterDto);	
		model.addAttribute("pageMaker", pageDTO);

		return "/search/search";
	} //getList
	
	
	@ResponseBody
	@PostMapping("psProfile")
	public Map<String,Object> getPs(
			@RequestParam("userNo")Integer userNo, 
			HttpSession session) {
		log.debug("getPs({}, {}) invoked.", userNo, session);
		
		//리턴객체 map
		Map<String,Object> map = new HashMap<String,Object>();		

		
		//세션객체 loginSession
		UserVO loginSession = (UserVO) session.getAttribute(UserController.loginKey);
		log.info("loginSession: {}", loginSession);
		
		if(loginSession != null) {
			// 로그인 세션의 userClassify 정보
			String classifySession = loginSession.getUserClassify();
			log.info("classifySession: {}", classifySession);
			
			map.put("classifySession", classifySession);
		} //if
		
		
		//ps 회원번호
		map.put("userNo", userNo);		
		
		
		PetSitterDTO ps = this.service.getPs(userNo);
		Objects.requireNonNull(ps);
		log.info("\t+ ps : {}", ps);

		map.put("ps", ps);
		
		
		List<PetSitterDTO> serviceTypeList = this.service.getServiceType(userNo);
		Objects.requireNonNull(serviceTypeList);
		log.info("\t+ serviceTypeList : {}", serviceTypeList);

		map.put("serviceType", serviceTypeList);
		
		
		List<PetSitterDTO> serviceCalendarList = this.service.getServiceCalendar(userNo);
		Objects.requireNonNull(serviceCalendarList);
		log.info("\t+ serviceCalendarList : {}", serviceCalendarList);

		map.put("serviceCalendar", serviceCalendarList);
		
		
		List<PetSitterDTO> servicePetKindsList = this.service.getServicePetKinds(userNo);
		Objects.requireNonNull(servicePetKindsList);
		log.info("\t+ servicePetKindsList : {}", servicePetKindsList);

		map.put("servicePetKinds", servicePetKindsList);
		
		
		List<PetSitterDTO> psSkillList = this.service.getPsSkill(userNo);
		Objects.requireNonNull(psSkillList);
		log.info("\t+ psSkillList : {}", psSkillList);

		map.put("psSkill", psSkillList);
		
		
		List<PetSitterDTO> activityPhotoList = this.service.getActivityPhoto(userNo);
		Objects.requireNonNull(activityPhotoList);
		log.info("\t+ activityPhotoList : {}", activityPhotoList);

		map.put("activityPhoto", activityPhotoList);
		
		
		List<PetSitterDTO> reviewList = this.service.getReview(userNo);
		Objects.requireNonNull(reviewList);
		log.info("\t+ reviewList : {}", reviewList);

		map.put("review", reviewList);

		
		return map;
		
	} //getPs
	
	
} //end class

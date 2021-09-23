package com.bitcamp.petcare.matching.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.petcare.matching.domain.MatchingDTO;
import com.bitcamp.petcare.matching.domain.MatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceCalendarVO;
import com.bitcamp.petcare.matching.domain.ServiceMatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceTypeVO;
import com.bitcamp.petcare.matching.mapper.MatchingMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class MatchingServiceImpl implements MatchingService{

	@Setter(onMethod_=@Autowired)
	private MatchingMapper mapper;
	
	
	@Override
	public MatchingVO getUserPet(Integer userNo) {
		log.debug("getUserPet({}) invoked.", userNo);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getUserPet(userNo);
	} //getUserPet


	@Override
	public boolean registerMatcing(MatchingDTO matching) {
		log.debug("registerMatcing({}) invoked.", matching);
		
		Objects.requireNonNull(this.mapper);
		
		int affectedLines = this.mapper.insertMatcingSelectKey(matching);
		
		return (affectedLines == 1);
	} //registerMatcing


	@Override
	public List<ServiceTypeVO> getServiceType(Integer userNo) {
		log.debug("getServiceType({})", userNo);
		
		Objects.requireNonNull(this.mapper);
		
		return mapper.getServiceType(userNo);
	} //getServiceType


	@Override
	public List<ServiceCalendarVO> getServiceCalendar(Integer userNo) {
		log.debug("getServiceCalendar({})", userNo);
		
		Objects.requireNonNull(this.mapper);
		
		return mapper.getServiceCalendar(userNo);
	} //getServiceCalendar


	@Override
	public List<ServiceMatchingVO> getServiceMatching(Integer petUserNo) {
		log.debug("getServiceMatching()");
		
		Objects.requireNonNull(this.mapper);
		
		return mapper.getServiceMatching(petUserNo);
	} //getServiceMatching

} //end class

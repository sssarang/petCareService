package com.bitcamp.petcare.matching.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.petcare.matching.domain.MatchingDTO;
import com.bitcamp.petcare.matching.domain.MatchingVO;
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
	}


	@Override
	public boolean registerMatcing(MatchingDTO matching) {
		log.debug("registerMatcing({}) invoked.", matching);
		
		Objects.requireNonNull(this.mapper);
		
		int affectedLines = this.mapper.insertMatcingSelectKey(matching);
		
		return (affectedLines == 1);
	} //registerMatcing

} //end class

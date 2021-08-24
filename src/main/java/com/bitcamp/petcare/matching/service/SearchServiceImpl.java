package com.bitcamp.petcare.matching.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.petcare.matching.domain.PetSitterDTO;
import com.bitcamp.petcare.matching.mapper.SearchMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class SearchServiceImpl implements SearchService {

	@Setter(onMethod_=@Autowired)
	private SearchMapper mapper;
	
	
	@Override
	public List<PetSitterDTO> getPsList() {
		log.debug("getPsList() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getPsList();
	} //getPsList

	@Override
	public PetSitterDTO getPs(Integer userNo) {
		log.debug("getPs({}) invoked.", userNo);

		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getPs(userNo);
	} //getPs
	

} //end class

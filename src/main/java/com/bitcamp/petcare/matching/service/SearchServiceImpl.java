package com.bitcamp.petcare.matching.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.petcare.matching.domain.FilterDTO;
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
	public List<PetSitterDTO> getList(FilterDTO filterDTO) {
		log.debug("getList({}) invoked.", filterDTO);
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getList(filterDTO);
	} //getPsList

	@Override
	public int getTotal(FilterDTO cri) {
		log.debug("getTotal({}) invoked.", cri);
		
		return this.mapper.getTotal(cri);
	} //getTotal
	
	@Override
	public PetSitterDTO getPs(Integer userNo) {
		log.debug("getPs({}) invoked.", userNo);

		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getPs(userNo);
	} //getPs

	@Override
	public List<PetSitterDTO> getServiceType(Integer userNO) {
		log.debug("getServiceType() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getServiceType(userNO);
	} //getServiceType


	@Override
	public List<PetSitterDTO> getServiceCalendar(Integer userNO) {
		log.debug("getServiceCalendar() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getServiceCalendar(userNO);
	} //getServiceCalendar


	@Override
	public List<PetSitterDTO> getServicePetKinds(Integer userNO) {
		log.debug("getServicePetKinds() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getServicePetKinds(userNO);
	} //getServicePetKinds


	@Override
	public List<PetSitterDTO> getPsSkill(Integer userNO) {
		log.debug("getPsSkill() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getPsSkill(userNO);
	} //getPsSkill


	@Override
	public List<PetSitterDTO> getActivityPhoto(Integer userNO) {
		log.debug("getActivityPhoto() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getActivityPhoto(userNO);
	} //getActivityPhoto


	@Override
	public List<PetSitterDTO> getReview(Integer userNO) {
		log.debug("getReview() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getReview(userNO);
	} //getReview
	

} //end class

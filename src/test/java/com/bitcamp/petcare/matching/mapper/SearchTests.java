package com.bitcamp.petcare.matching.mapper;

import java.util.List;
import java.util.Objects;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.petcare.matching.domain.PetSitterDTO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SearchTests {

	@Setter(onMethod_=@Autowired)
	private SearchMapper mapper;
	
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
	
		Objects.requireNonNull(this.mapper);
		
		log.info("\t+ mapper : " + mapper);
		log.info("\t+ type : " + mapper.getClass().getName());
		
	} //setup
	
	@Test
	public  void testGetPsList() {
		log.debug("testGetPsList() invoked.");
		
		List<PetSitterDTO> list = this.mapper.getPsList();
		
		assert list != null;
		
		list.forEach(log::info);
		
	} //testGetPsList
	
	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");
		
	} //tearDown
	
} //end class

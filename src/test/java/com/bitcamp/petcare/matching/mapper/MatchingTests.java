package com.bitcamp.petcare.matching.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.petcare.matching.domain.MatchingDTO;
import com.bitcamp.petcare.matching.domain.MatchingVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)  

@ContextConfiguration(locations= {
   "file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class MatchingTests {
	
	@Setter(onMethod_ =@Autowired)
	private MatchingMapper mapper;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
	} //setup
	
	
	@Test
	public void testGetUserPet() {
		log.debug("testGetUserPet() invoked.");
		
		MatchingVO matching = this.mapper.getUserPet(9);
		
		assertNotNull(matching);
		
		log.info("\t+ matching: " + matching);
		
	} //testGetUserPet
	
	
	@Test
	public void testInsertMatcingSelectKey() {
		log.debug("insertMatcingSelectKey() invoked.");
		
		MatchingDTO newMatching = new MatchingDTO(
										null,
										"20210826",
										"20210826",
										"12",
										"2",
										9,
										15, 
										9
									);
		
		int affectedLines = this.mapper.insertMatcingSelectKey(newMatching);
		log.info("\t+ affectedLines: {}", affectedLines);
		log.info("\t+ newMatching: {}", newMatching);
		
	} //insertMatcingSelectKey
	
	@After
	public void tearDown() {
		log.debug("tearDown()invoked");
		
	} //tearDown

} //end class

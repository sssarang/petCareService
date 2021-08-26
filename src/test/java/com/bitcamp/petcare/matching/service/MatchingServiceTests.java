package com.bitcamp.petcare.matching.service;

import static org.junit.Assert.assertNotNull;

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
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class MatchingServiceTests {
	
	@Setter(onMethod_=@Autowired)
	private MatchingService service;

	
	@Test
	public void testGetUserPet() {
		log.debug("testGetUserPet() invoked.");
		
		MatchingVO matching = this.service.getUserPet(9);
		
		assertNotNull(matching);
		
		log.info("\t+ matching: " + matching);
		
	} //testGetUserPet
	
	
	@Test
	public void testRegisterMatcing() {
		log.debug("registerMatcing() invoked.");
		
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

		log.info("\t+ newMatching: " + newMatching);
		
		if(service.registerMatcing(newMatching)) {
			log.info("\t+ New newMatching registred.");
			log.info("\t+ newMatching: {}", newMatching);
		} else {
			log.info("\t+ No newMatching registred.");
		} //if-else
				
	} //registerMatcing
	
} //end class

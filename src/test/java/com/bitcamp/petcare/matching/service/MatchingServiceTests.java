package com.bitcamp.petcare.matching.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.petcare.matching.domain.MatchingDTO;
import com.bitcamp.petcare.matching.domain.MatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceCalendarVO;
import com.bitcamp.petcare.matching.domain.ServiceMatchingVO;
import com.bitcamp.petcare.matching.domain.ServiceTypeVO;

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
									"20210916",
									"20210920",
									"11",
									100000,
									54,
									8, 
									54
								);

		log.info("\t+ newMatching: " + newMatching);
		
		if(service.registerMatcing(newMatching)) {
			log.info("\t+ New newMatching registred.");
			log.info("\t+ newMatching: {}", newMatching);
		} else {
			log.info("\t+ No newMatching registred.");
		} //if-else
				
	} //registerMatcing
	
	
	@Test
	public void testGetServiceType() {
		log.debug("testGetServiceType() invoked.");
		
		List<ServiceTypeVO> serviceType = this.service.getServiceType(9);
		
		assertNotNull(serviceType);

		serviceType.forEach(log::info);
		
		serviceType.clear();
		serviceType = null;
	} //testGetServiceType
	
	
	@Test
	public void testGetServiceCalendar() {
		log.debug("testGetServiceCalendar() invoked.");
		
		List<ServiceCalendarVO> calendar = this.service.getServiceCalendar(9);
		
		assertNotNull(calendar);

		calendar.forEach(log::info);
		
		calendar.clear();
		calendar = null;
	} //testGetServiceCalendar
	
	
	@Test
	public void testGetServiceMatching() {
		log.debug("testGetServiceMatching() invoked.");
		
		List<ServiceMatchingVO> reserve = this.service.getServiceMatching(5);
		
		assertNotNull(reserve);

		reserve.forEach(log::info);
		
		reserve.clear();
		reserve = null;
	} //testGetServiceMatching
	
} //end class

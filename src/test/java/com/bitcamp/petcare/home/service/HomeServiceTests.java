package com.bitcamp.petcare.home.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.petcare.home.domain.FaqVO;
import com.bitcamp.petcare.home.domain.ReviewVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class HomeServiceTests {
	
	@Setter(onMethod_ =@Autowired)
	private HomeService service;
	
	@Before
	public void setup() {
		log.debug("setup() invoked,");
		
		assertNotNull(service);
		
	} //setup

	
	@Test
	public void testGetFaq() {
		log.debug("testGetFaq() invoked.");
		
		List<FaqVO> faq = this.service.getFaq();
		
		assertNotNull(faq);

		faq.forEach(log::info);
		
		faq.clear();
		faq = null;
	} //testGetFaq
	
	
	@Test
	public void testGetReview() {
		log.debug("testGetReview() invoked.");
		
		List<ReviewVO> faq = this.service.getReview();
		
		assertNotNull(faq);

		faq.forEach(log::info);
		
		faq.clear();
		faq = null;
	} //testGetReview
	
	
	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");
	} //tearDown
} //end class

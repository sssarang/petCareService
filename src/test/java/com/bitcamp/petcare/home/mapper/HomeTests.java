package com.bitcamp.petcare.home.mapper;

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
public class HomeTests {
	
	@Setter(onMethod_ =@Autowired)
	private HomeMapper mapper;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
	} //setup
	
	
	@Test
	public void testGetFaq() {
		log.debug("testGetFaq() invoked.");
		
		List<FaqVO> list = this.mapper.getFaq();
		
		assert list != null;
		
		list.forEach(log::info);
		
		list.clear();
		list = null;
	} //testGetFaq
	
	
	@Test
	public void testGetReview() {
		log.debug("testGetReview() invoked.");
		
		List<ReviewVO> list = this.mapper.getReview();
		
		assert list != null;
		
		list.forEach(log::info);
		
		list.clear();
		list = null;
	} //testGetReview
	
	
	
	@After
	public void tearDown() {
		log.debug("tearDown()invoked");
		
	} //tearDown

} //end class

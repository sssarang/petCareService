package com.bitcamp.petcare.admin.mapper;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class FaqMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private AdminMapper mapper;
	
	@Before
	public void setUp() {
		log.debug("setUp() invoked");
	}//setUp
	
	@Test
	public void getList() {
		log.debug("getList() invoked");
	
	}//getList
	
	@After
	public void tearDown() {
		log.debug("tearDown() invoked");
	}//tearDown
	
}//end class

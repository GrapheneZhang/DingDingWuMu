package com.dingding.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class UserTest {
	
	public  ApplicationContext ctx = null;
	
	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("springMVC-servlet.xml");
	}
	
	@Test
	public void test() throws Exception {
		//UserController codeDao = (UserController) ctx.getBean("UserController");
	}
}

package com.mycompany.myapp.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("HomeController")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET() {
		
		logger.info("메인 페이지 진입");
		
	}
	
	
	
}

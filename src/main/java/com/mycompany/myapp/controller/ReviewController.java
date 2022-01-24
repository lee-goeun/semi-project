package com.mycompany.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//http://localhost:8090/review/list

@Controller
@RequestMapping(value="/review")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	/* 후기게시판 리스트 페이지 진입 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void reviewListGET() {

		logger.info("후기게시판 리스트 페이지입니다.");

	}
	
	/* 후기게시판 상세 페이지 진입 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void reviewDetailGET() {

		logger.info("후기게시판 상세 페이지입니다.");

	}
	
	/* 후기게시판 작성 페이지 진입 */
	@RequestMapping(value = "/enroll", method = RequestMethod.GET)
	public void reviewEnrollGET() {

		logger.info("후기게시판 작성 페이지입니다.");

	}
	
	/* 후기게시판 수정 페이지 진입 */
	@RequestMapping(value = "/revision", method = RequestMethod.GET)
	public void reviewRevisionGET() {

		logger.info("후기게시판 수정 페이지입니다.");
	
	}
	
}

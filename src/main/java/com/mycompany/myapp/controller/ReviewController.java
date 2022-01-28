package com.mycompany.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.common.Criteria;
import com.mycompany.myapp.common.PageMaker;
import com.mycompany.myapp.service.ReviewService;
import com.mycompany.myapp.vo.ReviewVO;

//http://localhost:8090/review/list

@Controller("reviewController")
@RequestMapping(value = "/review")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	private ReviewService reviewService;

	/* 후기게시판 작성 페이지 */
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void reviewEnrollGET() throws Exception {
		logger.info("후기게시판 작성 페이지입니다.");
	}

	/* 후기게시판 게시물 작성 */
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String reviewWritePOST(ReviewVO reviewVO, RedirectAttributes rttr) throws Exception {
		logger.info("후기게시판 게시물 작성");

		reviewService.reviewWrite(reviewVO);

		rttr.addFlashAttribute("result", "write success");

		return "redirect:/review/list";
	}

	/* 후기게시판 목록 페이지 + 페이징 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void reviewListGET(Model model, Criteria cri) throws Exception {
		logger.info("후기게시판 목록 페이지입니다.");

		model.addAttribute("rList", reviewService.reviewListPaging(cri));
		
		int total = reviewService.reviewTotal(cri);
		
		PageMaker pageMake = new PageMaker(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
	}
	
	/* 후기게시판 상세 페이지 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void reviewDetailGET(int reviewId, Model model, Criteria cri) throws Exception {
		logger.info("후기게시판 상세 페이지입니다.");

		model.addAttribute("rDetail", reviewService.reviewDetail(reviewId));
		
		model.addAttribute("cri", cri);
	}

	/* 후기게시판 수정 페이지 */
	@RequestMapping(value = "/revise", method = RequestMethod.GET)
	public void reviewReviseGET(int reviewId, Model model, Criteria cri) throws Exception {
		logger.info("후기게시판 수정 페이지입니다.");

		model.addAttribute("rDetail", reviewService.reviewDetail(reviewId));
		
		model.addAttribute("cri", cri);
	}

	/* 후기게시판 게시물 수정 */
	@RequestMapping(value = "/revise.do", method = RequestMethod.POST)
	public String reviewRevisePOST(ReviewVO reviewVO, RedirectAttributes rttr) throws Exception {
		logger.info("후기게시판 게시물 수정");

		reviewService.reviewRevise(reviewVO);

		rttr.addFlashAttribute("result", "revise success");

//		return "redirect:/review/list";
		return "redirect:/review/detail?reviewId=" + Integer.toString(reviewVO.getReviewId());
	}

	/* 후기게시판 게시물 삭제 */
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String reviewDeletePOST(ReviewVO reviewVO, RedirectAttributes rttr) throws Exception {
		logger.info("후기게시판 게시물 삭제");

		reviewService.reviewDelete(reviewVO);

		rttr.addFlashAttribute("result", "delete success");

		return "redirect:/review/list";
	}

}

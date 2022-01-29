package com.mycompany.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.mycompany.myapp.service.ReviewReplyService;
import com.mycompany.myapp.service.ReviewService;
import com.mycompany.myapp.vo.ReviewReplyVO;
import com.mycompany.myapp.vo.ReviewVO;
import com.mysql.cj.util.StringUtils;

//http://localhost:8090/review/list

@Controller("reviewController")
@RequestMapping(value = "/review")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private ReviewReplyService replyService;

	/* 후기게시판 목록 페이지 + 페이징 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void reviewListGET(Model model, Criteria cri) throws Exception {
		logger.info("후기게시판 목록 페이지입니다.");

		model.addAttribute("rList", reviewService.reviewListPaging(cri));

		int total = reviewService.reviewTotal(cri);

		PageMaker pageMake = new PageMaker(cri, total);

		model.addAttribute("pageMaker", pageMake);
	}

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

	/* 후기게시판 상세 페이지 */
//	@RequestMapping(value = "/detail", method = RequestMethod.GET)
//	public void reviewDetailGET(int reviewId, Model model, Criteria cri) throws Exception {
//		logger.info("후기게시판 상세 페이지입니다.");
//
//		model.addAttribute("rDetail", reviewService.reviewDetail(reviewId));
//		
//		model.addAttribute("cri", cri);
//		
//		/* 댓글 목록 */
//		List<ReviewReplyVO> listReply = replyService.listReply(reviewId);
//		
//		model.addAttribute("listReply", listReply);
//	}

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

	/* 댓글 작성 */
	@RequestMapping(value = "/replyWrite.do", method = RequestMethod.POST)
	public String replyWrite(ReviewReplyVO replyVO, HttpServletRequest request) throws Exception {
		logger.info("후기게시판 댓글 작성");

		replyService.writeReply(replyVO);

		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:" + referer; // 이전 페이지
	}

	/* 댓글 수정 */
	@RequestMapping(value = "/replyRevise.do", method = RequestMethod.POST)
	public String replyRevise(ReviewReplyVO replyVO, HttpServletRequest request) throws Exception {
		logger.info("후기게시판 댓글 수정");

		replyService.reviseReview(replyVO);

		logger.info(replyVO.toString());

//		return "redirect:/review/detail?reviewId=" + Integer.toString(replyVO.getReviewId());
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:" + referer; // 이전 페이지
	}

	/* 댓글 삭제 */
	@RequestMapping(value = "/replyDelete.do", method = RequestMethod.POST)
	public String replyDelete(ReviewReplyVO replyVO, HttpServletRequest request) throws Exception {
		logger.info("후기게시판 댓글 삭제");

		replyService.deleteReview(replyVO);

//		return "redirect:/review/detail?reviewId=" + Integer.toString(reviewVO.getReviewId());
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:" + referer; // 이전 페이지
	}

	/* 후기게시판 상세 페이지 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String reviewDetailGET(int reviewId, Model model, Criteria cri, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		logger.info("후기게시판 상세 페이지입니다. : " + reviewId);

		/* 조회수 증가 */
//		reviewService.reviewViews(reviewId);

		////////////////////////////////////////////////////////////////
		// 저장된 쿠키 불러오기
		Cookie cookies[] = req.getCookies();
		Map mapCookie = new HashMap();
		if (req.getCookies() != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie obj = cookies[i];
				mapCookie.put(obj.getName(), obj.getValue());
			}
		}

		// 저장된 쿠키중에 readCount만 불러오기
		String readCount = (String) mapCookie.get("replyCount");
		// 저장될 새로운 쿠키값 생성
		String newReadCount = "|" + reviewId;

		// 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
		if (StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1) {
			// 없을 경우 쿠키 생성
			Cookie cookie = new Cookie("replyCount", readCount + newReadCount);

			res.addCookie(cookie);
			
			reviewService.reviewViews(reviewId); // 조회수 업데이트
		}

		////////////////////////////////////////////////////////////////////////////////
		model.addAttribute("rDetail", reviewService.reviewDetail(reviewId));

		model.addAttribute("cri", cri);

		/* 댓글 목록 */
		List<ReviewReplyVO> listReply = replyService.listReply(reviewId);

		model.addAttribute("listReply", listReply);
		
		return "/review/detail";
	}

}

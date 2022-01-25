package com.mycompany.myapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.service.MemberService;
import com.mycompany.myapp.vo.MemberVO;

//http://localhost:8090/main
@Controller("MemberController")
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberservice;

	// 회원가입 페이지 이동

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void loginGET() {

		logger.info("회원가입 페이지 진입");

	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO membervo) throws Exception {
		logger.info("join 진입");

		// 서비스 실행
		memberservice.memberjoin(membervo);

		logger.info("join Service 성공");

		return "redirect:/main";

	}

	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void joinGET() {

		// logger.info("로그인 페이지 진입");

	}

	
	//로그인 check 
	@RequestMapping(value = "/loginchk", method = RequestMethod.POST)
	public String login(MemberVO membervo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("로그인 성공");

		HttpSession session = req.getSession();
		MemberVO memberlogin = memberservice.memberlogin(membervo);

		if (memberlogin == null) {
			logger.info("실패");

			return "redirect:/main";

		} else {
			logger.info("로그인 성공");

			return "/member/temp";

		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}
	

	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET) 
	@ResponseBody public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기 
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성 
		memberservice.certifiedPhoneNumber(userPhoneNumber,randomNumber); 
		return Integer.toString(randomNumber); 
		}
	 

		

}

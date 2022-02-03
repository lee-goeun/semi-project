package com.mycompany.myapp.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

		logger.info("로그인 페이지 진입");

	}

	
	//로그인 check 
	@RequestMapping(value = "/loginchk", method = RequestMethod.POST)
	public String login(MemberVO membervo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("로그인 진행중");

		HttpSession session = req.getSession();
		MemberVO memberlogin = memberservice.memberlogin(membervo);

		if (memberlogin == null) { //memlogin값이 null이면 회원가입 필요함 
			int result =0;
			rttr.addFlashAttribute("result",result);
			
			return "redirect:/member/login";
		}
		
			session.setAttribute("member", memberlogin);
			
			return "/member/temp";
			
			
		}
	
	
	
	
	// 아이디 중복 검사
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPOST(String uid) throws Exception{
			
			int result = memberservice.idCheck(uid);
			
			if(result != 0) {
				
				return "fail";	// 중복 아이디가 존재
				
			} else {
				
				return "success";	// 중복 아이디 x
				
			}	
			
		} // memberIdChkPOST() 종료
		
		
		// 닉네임
		@RequestMapping(value = "/memberNickChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberNickChkPOST(String nickname) throws Exception{
			
			int result = memberservice.nickCheck(nickname);
			
			if(result != 0) {
				
				return "fail";	// 중복 닉네임 존재
				
			} else {
				
				return "success";	// 중복 닉네임 없음
				
			}	
			
		} // memberNickChk() 종료
	
	
	
		
	

	
	//logout Controller
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) throws Exception {
		
		logger.info("===================로그아웃 완료=================");
		
		HttpSession session = req.getSession();
		
		session.invalidate();
		logger.info("로그아웃 버튼 확인");
		return "/main";
		
		
	}
	
	// 마이페이지 이동
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String  mypage(MemberVO membervo) throws Exception {
		return "member/mypage";
		

		
	}
	
	// 회원정보 수정 버튼
	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO membervo, HttpSession session) throws Exception{
		
		memberservice.memberUpdate(membervo);
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	//회원정보 보기
	@RequestMapping(value="/memberview")
	public String memberView(Locale locale, Model model) throws Exception{
		List<MemberVO> memberview = memberservice.memberView();
		model.addAttribute("memberview" , memberview);
		return "member/memberview";
	}
	
//	//회원 삭제
//	@RequestMapping(value="/memberdelete", method = RequestMethod.GET)
//	public String memberDelete(MemberVO membervo) throws Exception{
//		logger.info("삭제 진행중");
//		
//		memberservice.memberDelete(membervo.getUid());
//		
//		logger.info(membervo.getUid());
//		
//		return "redirect:/member/memberview";
//		
//	}
	

//msg controller
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET) 
	@ResponseBody public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기 
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성 
		memberservice.certifiedPhoneNumber(userPhoneNumber,randomNumber); 
		return Integer.toString(randomNumber); 
		}
	 
	
	

		

}

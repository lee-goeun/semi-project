package com.mycompany.myapp.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.handler.ChatRoom;
import com.mycompany.myapp.handler.ChatRoomRepository;
import com.mycompany.myapp.handler.ChatWebSocketHandler;
import com.mycompany.myapp.service.ChatService;
import com.mycompany.myapp.vo.ChatVO;
import com.mycompany.myapp.vo.MemberVO;
import com.mycompany.myapp.vo.PostVO;

@Controller("chatController")
@RequestMapping("/chat")
public class ChatControllerImpl {
	@Autowired
	private ChatService chatService;
	
	/*
	 * @Autowired private ChatVO chatVo;
	 */
	
	public ChatControllerImpl() {
	}
	
	//채팅 생성
	/*@RequestMapping(value = "/new", method = RequestMethod.GET)
	public ModelAndView newChat(int postId, String uid, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> chatMap = new HashMap<String, Object>();
		chatMap.put("postId", postId);
		chatMap.put("uid", uid);
		
		chatService.addNewChat(chatMap);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		 
		return mav;
	}*/
	
	//채팅 선택
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public ModelAndView selectChat(int postId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> chatMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		
		HttpSession session = request.getSession(); 
		MemberVO memberVO = (MemberVO)session.getAttribute("member"); 
		String uid = memberVO.getUid();
		
		mav.addObject("uid",uid);
		
		//채팅 생성		
		chatMap.put("postId", postId);
		chatMap.put("uid", uid);
		
		//채팅 접속여부 확인
		int size = chatService.confirmUid(chatMap).size();
		if(size == 0) {
			chatService.addNewChat(chatMap);
		}
		
		String chatPostId = Integer.toString(postId);
		ChatRoomRepository.checkRoom(chatPostId);
		
		return mav;
	}
	
	//채팅 나가기
	@RequestMapping(value="/exit", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity exitChat(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> chatMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			chatMap.put(name, value);
		}
		
		String msg; 
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		chatService.exitChat(chatMap);
		
		try {
			
			msg = "<script>";
			msg += " alert('퇴장했습니다');";
			msg += " window.close();";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			msg = "<script>";
			msg += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
		
	}
}

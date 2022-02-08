package com.mycompany.myapp.controller;

import java.util.HashMap;
import java.util.Map;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.handler.ChatRoom;
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
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		
		HttpSession session = request.getSession(); 
		MemberVO memberVO = (MemberVO)session.getAttribute("member"); 
		String uid = memberVO.getUid();
		
		mav.addObject("uid",uid);
		
		/*
		 * ChatRoom room = chatService.viewChat(postId); mav.addObject("room", room);
		 */
		return mav;
	}
}

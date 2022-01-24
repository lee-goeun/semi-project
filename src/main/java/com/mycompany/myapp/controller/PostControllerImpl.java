package com.mycompany.myapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.PostService;
import com.mycompany.myapp.vo.PostVO;

//http://localhost:8090/post/list

@Controller("postController")
@RequestMapping("/post")
public class PostControllerImpl implements PostController{
	@Autowired
	private PostService postService;
	@Autowired
	private PostVO postVO;
	
	public PostControllerImpl() {
	}
	
	//포스트 조회
	@Override
	@RequestMapping(value="/list", method= RequestMethod.GET)
	public ModelAndView listPosts(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return null;
	}
	
	//포스트 추가
	@Override
	@RequestMapping(value="postForm", method=RequestMethod.GET)
	public String addFormPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return null;
	}
	
	@Override
	@RequestMapping(value="/addPost", method=RequestMethod.POST)
	public ResponseEntity addNewPost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		return null;
	}
	
	//포스트 상세 조회
	@Override
	@RequestMapping(value="/postForm", method=RequestMethod.GET)
	public ModelAndView viewPost(int post_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return null;
	}
	
	//포스트 수정
	@Override
	@RequestMapping(value="modPost", method=RequestMethod.POST)
	public ResponseEntity modPost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		return null;
	}
	
	//포스트 삭제
	@Override
	@RequestMapping(value="/removePost", method=RequestMethod.POST)
	public ResponseEntity removePost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		return null;
	}

	
	
}

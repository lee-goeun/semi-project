package com.mycompany.myapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.vo.PostVO;

public interface PostController {
	//포스트조회(+검색)
	public ModelAndView listPosts(HttpServletRequest request, HttpServletResponse response, PostVO vo) throws Exception;
	
	//포스트추가
	public String addFormPost(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewPost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	//포스트상세조회
	public ModelAndView viewPost(@RequestParam("postId") int postId, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//포스트수정
	public ResponseEntity modPost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	//포스트삭제
	public ResponseEntity removePost(@RequestParam("postId") int postId, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	
	
}

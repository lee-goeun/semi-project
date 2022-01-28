package com.mycompany.myapp.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.PostService;
import com.mycompany.myapp.vo.MemberVO;
import com.mycompany.myapp.vo.PostVO;

//http://localhost:8090/post/list

@Controller("postController")
@RequestMapping("/post")
public class PostControllerImpl implements PostController{
	private static final String POST_IMAGE_REPO = "C:\\semi_project\\post_image";
	@Autowired
	private PostService postService;
	@Autowired
	private PostVO postVO ;
	
	public PostControllerImpl() {
	}
	
	//포스트 조회(+검색)
	@Override
	@RequestMapping(value="/list", method= RequestMethod.GET)
	public ModelAndView listPosts(HttpServletRequest request, HttpServletResponse response, PostVO vo) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName); 
		
		List<PostVO> postsList = postService.listPosts(vo);
		mav.addObject("postsList",postsList);
		
		return mav;
	}
	
	
	//포스트 추가
	@Override
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public String addFormPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		return viewName;
	}
	
	@Override
	@RequestMapping(value="/addPost", method=RequestMethod.POST)
	public ResponseEntity addNewPost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> postMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name =(String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			postMap.put(name,value);
		}
		
		String image = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		
		/*
		 * MemberVO memberVO = (MemberVO) session.getAttribute("member"); String uid =
		 * memberVO.getUid();
		 */
		 postMap.put("uid", "test");
		 postMap.put("image", image);
		 
		 String msg;
		 ResponseEntity resEnt = null;
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		 postService.addNewPost(postMap);
		
		try {
			if(image != null && image.length() !=0) {
				int postId = postService.selectNewId();
				File srcFile = new File(POST_IMAGE_REPO + "\\" + "temp" + "\\" + image);
				
				File destDir = new File(POST_IMAGE_REPO + "\\" + postId);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			
			msg = "<script>";
			msg += "alert('새 글을 추가했습니다');";
			msg += "location.href='" + multipartRequest.getContextPath() + "/post/list';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(POST_IMAGE_REPO + "\\" + "temp" + "\\" + image);
			srcFile.delete();
			
			msg = " <script>";
			msg += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			msg += " location.href='" + multipartRequest.getContextPath() + "/post/form';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	//포스트 상세 조회
	@Override
	@RequestMapping(value="/viewPost", method=RequestMethod.GET)
	public ModelAndView viewPost(int postId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		postVO = postService.viewPost(postId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("post",postVO);
		return mav;
	}
	
	//포스트 수정
	@Override
	@RequestMapping(value="/modPost", method=RequestMethod.POST)
	public ResponseEntity modPost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> postMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			postMap.put(name, value);
		}
		String image = upload(multipartRequest);
		postMap.put("image", image);
		
		int postId = (int)postMap.get("postId"); 
		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			postService.modPost(postMap);
			if(image != null && image.length() !=0) {
				File srcFile = new File(POST_IMAGE_REPO + "\\" + "temp" + image);
				File destDir = new File(POST_IMAGE_REPO + "\\" + "temp" + postId);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				String originalFileName = (String)postMap.get("originalFileName");
				File oldFile = new File(POST_IMAGE_REPO + "\\" + postId + "\\" + originalFileName);
				oldFile.delete();
			}
			msg = "<script>";
			msg += " alert('글을 수정했습니다');";
			msg += " location.href='" + multipartRequest.getContextPath() + "/post/viewPost?postId=" + postId +"';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(POST_IMAGE_REPO + "\\" + "temp" + "\\" + image);
			srcFile.delete();
			msg = "<script>";
			msg += " alert('오류가 발생했습니다.다시 수정해주세요');";
			msg += " location.href='" + multipartRequest.getContextPath() + "/post/viewPost?postId=" + postId + "';";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	//포스트 삭제
	@Override
	@RequestMapping(value="/removePost", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removePost(@RequestParam("postId") int postId, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			postService.removePost(postId);
			
			msg = "<script>";
			msg += " alert('글을 삭제했습니다.');";
			msg += " location.href='" + request.getContextPath() + "/post/list';";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			msg = "<script>";
			msg += " alert('작업 중 오류가 발생했습니다. 다시 시도해주세요.');";
			msg += " location.href='" + request.getContextPath() + "/post/list';";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	//이미지 업로드
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String image = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			image=mFile.getOriginalFilename();
			File file = new File(POST_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if(mFile.getSize() != 0) { //file null check
				if(!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(POST_IMAGE_REPO+"\\"+ "temp" +"\\" +  image));
				}
			}
		}
		return image;
	}
	
	
}

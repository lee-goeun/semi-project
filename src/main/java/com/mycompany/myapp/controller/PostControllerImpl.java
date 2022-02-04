package com.mycompany.myapp.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mycompany.myapp.service.PostService;
import com.mycompany.myapp.vo.MemberVO;
import com.mycompany.myapp.vo.PostVO;
import com.oreilly.servlet.MultipartRequest;

//http://localhost:8090/post/list

@Controller("postController")
@RequestMapping("/post")
public class PostControllerImpl implements PostController {
	private static final String POST_IMAGE_REPO = "C:\\semi_project\\post_image";
	@Autowired
	private PostService postService;
	@Autowired
	private PostVO postVO;

	public PostControllerImpl() {
	}

	// 포스트 조회(+검색)
	@Override
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView listPosts(HttpServletRequest request, HttpServletResponse response, PostVO vo)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		List<PostVO> postsList = postService.listPosts(vo);
		mav.addObject("postsList", postsList);

		return mav;
	}

	// 음성으로 검색
	@RequestMapping(value = "/mic", method = RequestMethod.POST)
	public void searchToMic(MultipartHttpServletRequest multi, HttpServletResponse response) throws Exception {

		String clientId = "r5h93jhquq";
		String clientSecret = "VMXcbadYPWH5ILKdQ5HXa7PBG8Y8oxHR2QklrgnD";

		try {

			// 마이크 시작
			String saveDirectory = "c:/semi_project/temp";
			MultipartFile orgfile = multi.getFile("data");
			InputStream instream = orgfile.getInputStream();
			String text = reqcsr(instream);
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject)parser.parse(text);
			String result = (String)jsonObject.get("text");
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(result);
			System.out.println(result);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public String reqcsr(InputStream voiceStream) {
		String clientId = "r5h93jhquq"; // Application Client ID";
		String clientSecret = "VMXcbadYPWH5ILKdQ5HXa7PBG8Y8oxHR2QklrgnD"; // Application Client Secret";
		StringBuffer response = new StringBuffer();

		try {
			String language = "Kor"; // 언어 코드 ( Kor, Jpn, Eng, Chn )
			String apiURL = "https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=" + language;
			URL url = new URL(apiURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setUseCaches(false);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setRequestProperty("Content-Type", "application/octet-stream");
			conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

			OutputStream outputStream = conn.getOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;
			while ((bytesRead = voiceStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
			outputStream.flush();
			voiceStream.close();
			BufferedReader br = null;
			int responseCode = conn.getResponseCode();
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // 오류 발생
				System.out.println("error!!!!!!! responseCode= " + responseCode);
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}
			String inputLine;

			if (br != null) {
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return response.toString();
	}

	// 포스트 추가
	@Override
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String addFormPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		return viewName;
	}

	@Override
	@RequestMapping(value = "/addPost", method = RequestMethod.POST)
	public ResponseEntity addNewPost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> postMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			postMap.put(name, value);
			System.out.println("****************** " + name + " " + value);
		}

		String image = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();

		postMap.put("uid", uid);
		postMap.put("image", image);

		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		postService.addNewPost(postMap);

		try {
			if (image != null && image.length() != 0) {
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
		} catch (Exception e) {
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

	// 포스트 상세 조회
	@Override
	@RequestMapping(value = "/viewPost", method = RequestMethod.GET)
	public ModelAndView viewPost(int postId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		postVO = postService.viewPost(postId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("post", postVO);
		return mav;
	}

	// 포스트 상세 조회(수정용)_페이지가 다름
	@Override
	@RequestMapping(value = "/viewPost1", method = RequestMethod.GET)
	public ModelAndView viewPost1(int postId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		postVO = postService.viewPost(postId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("post", postVO);
		return mav;
	}

	// 채팅 참여
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		/*
		 * HttpSession session = request.getSession(); MemberVO memberVO = (MemberVO)
		 * session.getAttribute("member"); String uid = memberVO.getUid();
		 */

		mav.addObject("uid", "test");
		return mav;
	}

	// 포스트 수정
	@Override
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ResponseEntity modPost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> postMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			postMap.put(name, value);

		}
		String image = upload(multipartRequest);
		postMap.put("image", image);

		postMap.put("uid", "test");

		String postId = (String) postMap.get("postId");

		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			postService.modPost(postMap);
			if (image != null && image.length() != 0) {
				File srcFile = new File(POST_IMAGE_REPO + "\\" + "temp" + "\\" + image);
				File destDir = new File(POST_IMAGE_REPO + "\\" + postId);
				String originalFileName = (String) postMap.get("originalFileName");
				File oldFile = new File(POST_IMAGE_REPO + "\\" + postId + "\\" + originalFileName);
				oldFile.delete();
			}
			msg = "<script>";
			msg += " alert('글을 수정했습니다');";
			msg += " location.href='" + multipartRequest.getContextPath() + "/post/viewPost?postId=" + postId + "';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(POST_IMAGE_REPO + "\\" + "temp" + "\\" + image);
			srcFile.delete();
			msg = "<script>";
			msg += " alert('오류가 발생했습니다.다시 수정해주세요');";
			msg += " location.href='" + multipartRequest.getContextPath() + "/post/viewPost?postId=" + postId + "';";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	// 포스트 삭제
	@Override
	@RequestMapping(value = "/removePost", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removePost(@RequestParam("postId") int postId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");

		postService.removePost(postId);
		try {
			msg = "<script>";
			msg += " alert('글을 삭제했습니다.');";
			msg += " location.href='" + request.getContextPath() + "/post/list';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			msg = "<script>";
			msg += " alert('작업 중 오류가 발생했습니다. 다시 시도해주세요.');";
			msg += " location.href='" + request.getContextPath() + "/post/list';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	// 이미지 업로드
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String image = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		System.out.println("****************** " + fileNames);

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			image = mFile.getOriginalFilename();
			File file = new File(POST_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) { // file null check
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(POST_IMAGE_REPO + "\\" + "temp" + "\\" + image));
				}
			}
		}
		return image;
	}

}

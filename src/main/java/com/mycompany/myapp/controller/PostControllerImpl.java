package com.mycompany.myapp.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.common.PostCriteria;
import com.mycompany.myapp.common.PostPageMaker;
import com.mycompany.myapp.handler.ChatRoomRepository;
import com.mycompany.myapp.service.ChatService;
import com.mycompany.myapp.service.PostService;
import com.mycompany.myapp.vo.MemberVO;
import com.mycompany.myapp.vo.PostVO;

//http://localhost:8090/post/list

@Controller("postController")
@RequestMapping("/post")
public class PostControllerImpl implements PostController {
	
	private static final String POST_IMAGE_REPO = "resources/image_upload_file";
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private PostVO postVO;
	
	@Autowired
	private ChatService chatService;

	public PostControllerImpl() {
		
	}

	// ????????? ?????? (+??????) - ??????X
/*	
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
*/
	
	// ????????? ?????? + ????????? + ??????
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPosts(Model model, PostCriteria cri) throws Exception {
		
		postService.updateState();	// ?????? ?????? ????????????
		
		model.addAttribute("postsList", postService.getListPost(cri));
		
		int total = postService.getTotal(cri);
		
		PostPageMaker pageMake = new PostPageMaker(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		return "/post/list";
	}

	// ???????????? ??????
	@RequestMapping(value = "/mic", method = RequestMethod.POST)
	public void searchToMic(MultipartHttpServletRequest multi, HttpServletResponse response) throws Exception {

		try {
			// ????????? ??????
			MultipartFile orgfile = multi.getFile("data");
			InputStream instream = orgfile.getInputStream();
			String text = reqcsr(instream);
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject) parser.parse(text);
			String result = (String) jsonObject.get("text");
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
			String language = "Kor"; // ?????? ?????? ( Kor, Jpn, Eng, Chn )
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
			if (responseCode == 200) { // ?????? ??????
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // ?????? ??????
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

	// ????????? ??????
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
		Map<String, Object> chatMap = new HashMap<String, Object>();
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
		int postId = postService.selectNewId();
		
		//?????? ??????
		chatMap.put("postId", postId);
		chatMap.put("uid", uid);
		chatService.addNewChat(chatMap);
		
		String chatPostId = Integer.toString(postId);
		ChatRoomRepository.createChatRoom(chatPostId);

		try {
			if (image != null && image.length() != 0) {
				File srcFile = new File(POST_IMAGE_REPO + "/" + "temp" + "/" + image);
				File destDir = new File(POST_IMAGE_REPO + "/" + postId);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			msg = "<script>";
			msg += "alert('??? ?????? ??????????????????');";
			msg += "location.href='" + multipartRequest.getContextPath() + "/post/list';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(POST_IMAGE_REPO + "/" + "temp" + "/" + image);
			srcFile.delete();

			msg = " <script>";
			msg += " alert('????????? ??????????????????. ?????? ????????? ?????????.');";
			msg += " location.href='" + multipartRequest.getContextPath() + "/post/form';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	// ????????? ?????? ??????
	@Override
	@RequestMapping(value = "/viewPost", method = RequestMethod.GET)
	public ModelAndView viewPost(int postId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		postVO = postService.viewPost(postId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("post", postVO);
		
		//?????? ???????????? ??????
		Map<String, Object> chatMap = new HashMap<String, Object>();
		HttpSession session = request.getSession();

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		
		chatMap.put("postId", postId);
		chatMap.put("uid", uid);
		
		int chkUid = chatService.confirmUid(chatMap).size();
		mav.addObject("chkUid", chkUid);
		
		return mav;
	}

	// ????????? ?????? ??????(?????????)_???????????? ??????
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

	// ?????? ??????
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

	// ????????? ??????
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
		
		postService.modPost(postMap);
		try {
			if (image != null && image.length() != 0) {
				File srcFile = new File(POST_IMAGE_REPO + "/" + "temp" + "/" + image);
				File destDir = new File(POST_IMAGE_REPO + "/" + postId);
				String originalFileName = (String) postMap.get("originalFileName");
				File oldFile = new File(POST_IMAGE_REPO + "/" + postId + "/" + originalFileName);
				oldFile.delete();
			}
			msg = "<script>";
			msg += " alert('?????? ??????????????????');";
			msg += " location.href='" + multipartRequest.getContextPath() + "/post/viewPost?postId=" + postId + "';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(POST_IMAGE_REPO + "/" + "temp" + "/" + image);
			srcFile.delete();
			msg = "<script>";
			msg += " alert('????????? ??????????????????.?????? ??????????????????');";
			msg += " location.href='" + multipartRequest.getContextPath() + "/post/viewPost?postId=" + postId + "';";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	// ????????? ??????
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
			msg += " alert('?????? ??????????????????.');";
			msg += " location.href='" + request.getContextPath() + "/post/list';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			msg = "<script>";
			msg += " alert('?????? ??? ????????? ??????????????????. ?????? ??????????????????.');";
			msg += " location.href='" + request.getContextPath() + "/post/list';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	// ????????? ?????????
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String image = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		System.out.println("****************** " + fileNames);

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			image = mFile.getOriginalFilename();
			File file = new File(POST_IMAGE_REPO + "/" + "temp" + "/" + fileName);
			if (mFile.getSize() != 0) { // file null check
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(POST_IMAGE_REPO + "/" + "temp" + "/" + image));
				}
			}
		}
		return image;
	}

}

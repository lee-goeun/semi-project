package com.mycompany.myapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static final String POST_IMAGE_REPO = "C:\\semi_project\\post_image";
	
	@RequestMapping("/download")
	protected void download(@RequestParam("image") String image, 
			@RequestParam("postId") String postId, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = POST_IMAGE_REPO + "\\" + postId + "\\" + image;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + image);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
		
	}
}

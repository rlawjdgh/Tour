package com.spring.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.FileVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
public class UploadController {
	
	@Autowired
	ServletContext application;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/upload") 
	public String upload(FileVO vo, Model model) throws Exception {

		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		
		MultipartFile photo = vo.getPhoto();
		String filename = "no_file";  
		
		filename = photo.getOriginalFilename();

		File saveFile = new File(savePath, filename);

		if (!saveFile.exists()) {
			saveFile.mkdirs();
		} else {
			
			long time = System.currentTimeMillis();
			filename = String.format("%d_%s", time, filename);
			saveFile = new File(savePath, filename);
		}
		photo.transferTo(saveFile);
		
		vo.setFilename(filename); 
		
		log.info("" + vo); 

		return null;       
	}
}

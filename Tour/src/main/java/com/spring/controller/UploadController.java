package com.spring.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.UploadVO;
import com.spring.service.PaymentService;
import com.spring.service.UploadService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
public class UploadController {
	
	@Autowired
	ServletContext application;
	@Autowired
	private UploadService service;
	 
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(UploadVO vo, Model model) throws Exception {

		String msg = "clear"; 
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		
		UploadVO check = service.checkmovie(vo.getMovieNm());
		if(check != null) {
			msg = "ready";
			return msg;
		}
		 
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
		
		service.upload(vo); 
		
		log.info("" + vo);
		return msg;       
	}
	
	@RequestMapping("/uploadOne")
	@ResponseBody
	public List<UploadVO> uploadOne(String movieNm) {
		
		List<UploadVO> one = service.uploadOne(movieNm);
		return one;
	}
	
}

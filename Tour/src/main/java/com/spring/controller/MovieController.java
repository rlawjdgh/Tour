package com.spring.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.MovieVO;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class MovieController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("홈페이지 출력");
		
		return "movie/main";
	}
	
	@PostMapping("/movieInfo")
	public String movieInfo(Model model, MovieVO movieVO) {	
		log.info("영화 상세정보 출력");
		
		return "movie/movieInfo";
	}

	@RequestMapping("/movieTest")
	public void movieTest() {
		
	}
	
}

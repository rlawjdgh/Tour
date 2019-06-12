package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {

	@RequestMapping("/adminMain")
	public String adminMain() {
		 
		return "admin/adminMain"; 
	} 
	
	@RequestMapping("/adminMovie")
	public String adminMovie(Model model, String movieCd) {
		
		model.addAttribute("movieCd", movieCd);
		return "admin/adminMovie";
	}
}

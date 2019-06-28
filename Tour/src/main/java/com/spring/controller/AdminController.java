package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.AreaVO;
import com.spring.domain.BoxVO;
import com.spring.domain.LocationVO;
import com.spring.domain.MemberVO;
import com.spring.domain.NoticeVO;
import com.spring.service.AreaService;
import com.spring.service.BoxService;
import com.spring.service.LocationService;
import com.spring.service.MemberService;
import com.spring.service.NoticetService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private NoticetService noticeService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private LocationService locationService;
	@Autowired
	private BoxService boxService; 

	@RequestMapping("/adminMain")
	public String adminMain() {
		 
		return "admin/adminMain"; 
	} 
	
	@RequestMapping("/adminMovie")
	public String adminMovie(Model model, String movieCd, String movieNm) {
		
		model.addAttribute("movieCd", movieCd);
		model.addAttribute("movieNm", movieNm);
		
		return "admin/adminMovie"; 
	}
	
	@RequestMapping("/adminMemberInfo")
	public String memberInfo() {
		
		return "admin/adminMemberInfo";
	}
	

	@RequestMapping("/adminGetMember")
	@ResponseBody
	public List<MemberVO> adminGetMember() {
		
		List<MemberVO> list = service.selectAll(); 
		return list; 
	}
	
	@RequestMapping("/removeMember")
	@ResponseBody
	public String removeMember(int idx) {
		
		service.memberDelete(idx); 
		return "clear"; 
	}
	
	@RequestMapping("/adminNotice")
	public String adimNotice() {
		
		return "admin/adminNotice";
	}
	
	@RequestMapping("/adminGetNotice")
	@ResponseBody
	public List<NoticeVO> adminGetNotice() {
		
		List<NoticeVO> list = noticeService.selectAll(); 
		return list; 
	}
	
	@RequestMapping("/setAnswer")
	public String setAnswer(int idx, String email, String content, String title, Model model) {
		
		model.addAttribute("idx", idx);
		model.addAttribute("email", email);
		model.addAttribute("title", title); 		
		model.addAttribute("content", content);		 
		
		return "admin/setAnswer"; 
	}
	
	@RequestMapping("/answerEmail")
	@ResponseBody
	public String answerEmail(NoticeVO vo) throws Exception {
		
		noticeService.answerEmail(vo); 
		return "emailSuccess";
	}
	
	@RequestMapping("/reviewAnswer")
	public String setAnswer(String title, String content, String answer, Model model) {
		
		model.addAttribute("title", title);
		model.addAttribute("content", content);
		model.addAttribute("answer", answer); 				 
		
		return "admin/reviewAnswer";  
	}
	
	@RequestMapping("/adminBox")
	public String adminBox() {			 
		
		return "admin/adminBox";   
	}
	
	@RequestMapping("/adminGetArea")
	@ResponseBody 
	public List<AreaVO> adminGetArea() {
		
		List<AreaVO> list = areaService.getArea(); 
		
		return list;
	}

	@RequestMapping("/adminGetloc")
	@ResponseBody 
	public List<LocationVO> adminGetloc(int areaIdx) {
		
		List<LocationVO> list = locationService.select(areaIdx); 
		return list;
	} 
	
	@RequestMapping("/adminGetBox") 
	public String adminGetBox(int locIdx, String locName, Model model) {	
		 
		model.addAttribute("locName", locName);
		model.addAttribute("locIdx", locIdx); 
		return "admin/adminGetBox";   
	}
	
	@RequestMapping("/addBox")
	@ResponseBody 
	public String addBox(BoxVO vo) {
		
		String str = "no";  
		BoxVO check = boxService.findBox(vo);
		
		if(check == null) {
			boxService.addBox(vo); 
			str = "clear";
		}   
		
		return str; 
	} 
	
	@RequestMapping("/addLocation")
	@ResponseBody 
	public String addLocation(LocationVO vo) {
		
		String str = "no";  
		LocationVO check = locationService.findLocation(vo);
		
		if(check == null) {
			locationService.addLocation(vo); 
			str = "clear";
		}    
		
		return str; 
	}
	
	@RequestMapping("/addArea")
	@ResponseBody 
	public String addArea(AreaVO vo) {
		
		String str = "no";  
		AreaVO check = areaService.findArea(vo);
		
		if(check == null) {
			areaService.addArea(vo); 
			str = "clear";
		}    
		
		return str; 
	}
	
} 

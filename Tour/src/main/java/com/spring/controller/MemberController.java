package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.Common;
import com.spring.domain.MemberVO;
import com.spring.domain.Paging;
import com.spring.domain.PaymentVO;
import com.spring.service.MemberService;
import com.spring.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private PaymentService payService; 

	@RequestMapping("/memberlogin")
	public String memberlogin() {
		log.info("로그인 화면 출력");

		return "member/memberlogin";
	}

	@RequestMapping("/memberInsert")
	public String memberInsert() { 
		log.info("회원가입 페이지");

		return "member/memberInsert";

	}

	@PostMapping("/registMember")
	public String registMember(MemberVO vo) {
		log.info("회원가입");
 
		if (vo.getGrade() == null) {
			vo.setGrade("Silver");
		}
		log.info("" + vo.getName()); 

		service.registMember(vo);

		return "redirect:memberlogin";
	}

	@RequestMapping("/check_id")
	@ResponseBody
	public String check_id(@ModelAttribute("checkId") String checkId) { 
		log.info("ID 중복체크"); 

		MemberVO vo = service.checkId(checkId);
		log.info("" + vo);

		String res = "no";
		if(vo == null) {
			res = "yes";
		}

		return res;
	}
	
	@PostMapping("/loginForm")
	@ResponseBody
	public String loginForm(@ModelAttribute("id") String id, @ModelAttribute("password") String password, HttpSession session) {
		log.info("로그인");
		
		MemberVO vo = service.checkId(id);
		String res = "clear";
		 
		if (vo == null) {
			res = "no_id";
			return res;
		}
		if (!vo.getPassword().equals(password)) {
			res = "no_pw";
		}
		  
		if(vo.getAdmin() == 1) {
			res = "admin";
			return res; 
		} 
		
		session.setAttribute("logon", vo);
		session.setMaxInactiveInterval(3600); 
		
		return res;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();
		session.removeAttribute("logon");
		 
		return "redirect:/";    
		
	}
	
	@RequestMapping("/checkEmail")
	@ResponseBody
	public String checkemail(MemberVO vo) throws Exception {
		
		String str = "notexist";
		MemberVO check = service.checkEmail(vo.getEmail());
		if(check!=null) {
			if(check.getAuthstatus() == 1) {
				str = "exist";
			} else if(check.getAuthstatus() == 0) {
				str = "notyetauth";
			}
			return str;
		} else {
			service.checkMail(vo);
			return "requestCheckEmailSuccess";
		}
	}
	 
	@RequestMapping("/emailConfirm")
	public String emailConfirm(MemberVO vo, RedirectAttributes rttr) throws Exception {
		log.info("메일인증확인");
		vo.setAuthstatus(1);
		int result = service.updateAuthstatus(vo);
		
		return "member/emailConfirm"; 
	}
	
	@RequestMapping("/myPage")
	public String myPage(Model model, String page) {
		
		// 댓글페이지네이
		int nowPage = 1; // 기본으로 보여질 페이지
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		} else {
			page = "1";
		}
		int row_total = payService.getTotal(); 
		
		String pageMenu = Paging.getPaging("/tour/myPage?", nowPage, row_total, Common.Reply.BLOCKLIST, Common.Reply.BLOCKPAGE);
		
		model.addAttribute("page", page);
		model.addAttribute("pageMenu", pageMenu); 
				
		return "member/myPage";
	}
	
	@RequestMapping("/getTicket")
	@ResponseBody
	public List<PaymentVO> getTicket(int memberIdx, String page) {
		
		int nowPage = 1; // 기본으로 보여질 페이지
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		
		List<PaymentVO> ticket = payService.getTicket(nowPage, memberIdx);
		return ticket;
	}
	
} 

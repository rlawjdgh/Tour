package com.spring.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.MovieReplyVO;
import com.spring.domain.MovieVO;
import com.spring.service.MovieReplyService;

import com.spring.domain.Common;
import lombok.extern.slf4j.Slf4j;
import com.spring.domain.Paging;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class MovieController {
	
	@Autowired
	private MovieReplyService ReplyService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		log.info("홈페이지 출력");
		
		return "movie/main";
	}
	
	@GetMapping("/movieInfo")
	public String movieInfo(Model model, String page, @ModelAttribute("movieVO")MovieVO movieVO) {	
		log.info("영화 상세정보 출력");
		
		//댓글페이지네이션
		int nowPage = 1;	//기본으로 보여질 페이지
		if(page!=null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		
		//전체게시물 목록받아오기
		List<MovieReplyVO> replies = ReplyService.getRepliesPaging(nowPage, movieVO.getMovieNm());
		//전체게시물 수 구하기
		int row_total = ReplyService.getTotal();
		
		//현재 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("/tour/movieInfo?movieNm="+movieVO.getMovieNm(), nowPage, row_total, Common.Reply.BLOCKLIST, Common.Reply.BLOCKPAGE);
		
		model.addAttribute("pageMenu", pageMenu);
		model.addAttribute("reply", replies);
		return "movie/movieInfo";
	}

	@PostMapping("/movieTest")
	public void movieTest() {
		
	}
	
}

﻿package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.MovieReplyVO;
import com.spring.domain.MovieVO;
import com.spring.service.AreaService;
import com.spring.service.BoxService;
import com.spring.service.LocationService;
import com.spring.service.MovieReplyService;
import com.spring.domain.AreaVO;
import com.spring.domain.BoxVO;
import com.spring.domain.Common;
import com.spring.domain.LocationVO;

import lombok.extern.slf4j.Slf4j;
import com.spring.domain.Paging;

/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class MovieController {

	@Autowired
	private MovieReplyService replyService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private LocationService locationService;
	@Autowired
	private BoxService boxService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		log.info("홈페이지 출력");

		return "movie/main";
	}

	@GetMapping("/movieInfo")
	public String movieInfo(Model model, @ModelAttribute("movieVO") MovieVO movieVO, String page) {
		log.info("영화 상세정보 출력");

		// 댓글페이지네이션
		int nowPage = 1; // 기본으로 보여질 페이지
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		} else {
			page = "1";
		}
		// 전체게시물 수 구하기
		int row_total = replyService.getTotal();

		// 현재 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("/tour/movieInfo?movieNm=" + movieVO.getMovieNm(), nowPage, row_total,
				Common.Reply.BLOCKLIST, Common.Reply.BLOCKPAGE);

		model.addAttribute("page", page);
		model.addAttribute("pageMenu", pageMenu);
		// model.addAttribute("reply", replies);
		return "movie/movieInfo";
	}

	@GetMapping("/getReplyLists")
	@ResponseBody
	public List<MovieReplyVO> getReLists(String movieNm, String page) {
		log.info(movieNm);
		// 댓글페이지네이션
		int nowPage = 1; // 기본으로 보여질 페이지
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		// 전체게시물 목록받아오기
		List<MovieReplyVO> replies = replyService.getRepliesPaging(nowPage, movieNm);

		return replies;
	}

	@PostMapping("/insertReply")
	@ResponseBody
	public String insertReply(String movieNm, String writer, String reply) {
		String str = "fail";
		int result = replyService.insertReply(movieNm, writer, reply);
		if (result > 0) {
			str = "success";
		}
		return str;
	}

	@RequestMapping("/movieTicketing")
	public String movieTicketing(Model model) {
		
		List<AreaVO> area = areaService.getArea();
		model.addAttribute("area", area);

		return "/movie/movieTicketing";
	}
	
	@RequestMapping("/ready_loc")
	@ResponseBody
	public List<LocationVO> ready_loc(int areaIdx) { 
		
		List<LocationVO> loc = locationService.select(areaIdx);	
		return loc;
	}
	
	@RequestMapping("/click_loc")
	@ResponseBody
	public List<LocationVO> area_loc(int areaIdx) { 
		
		log.info("" + areaIdx);
		
		List<LocationVO> loc = locationService.select(areaIdx);	
		return loc;
	}
	
	@RequestMapping("/loading_box")
	@ResponseBody
	public List<BoxVO> loading_box(int locIdx) {
		
		List<BoxVO> box = boxService.select(locIdx);
		return box;
	}

	@RequestMapping("/searchList")
	public void searchList() {

	}
	
	@RequestMapping("/movieSitBooking")
	public String sitBooking(int boxIdx, String movieNm) {
		
		return "/movie/movieSitBooking";
	}

}

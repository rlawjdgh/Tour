/*package com.spring.scrapy;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Crawling {
	@RequestMapping("/testing")
	public String crawling() throws Exception {
		String url = "http://www.cgv.co.kr/theaters/";
		System.out.println("===============");
		System.out.println("url : " + url);
		
		Document doc = Jsoup.connect(url).get();
		Elements element = doc.select("div.skipnaiv");
		element.select("a").text();
		return "{\"l\":\"l\"}";
	}
}
*/
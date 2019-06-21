package com.spring.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.Common;
import com.spring.domain.MailUtils;
import com.spring.domain.NoticeVO;
import com.spring.mapper.NoticeMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("notice")
public class NoticeServiceImpl implements NoticetService {
	
	@Inject 
	private JavaMailSender mailSender;
	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public int insert(NoticeVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public List<NoticeVO> getNotice(int nowPage, int memberIdx) {
		
		//한 페이지에 표시되는 게시물의 시작과 끝번호를 계산
		int start = (nowPage -1) * Common.Reply.BLOCKLIST + 1;	//nowpage(쪽)가 1이면 0 * 10 + 1 = 1
		int end = start + Common.Reply.BLOCKLIST -1;	//1 + 10 -1 = 10 
		//>>>1~10번 게시물이 표시
		//start와 end를 map으로 묶어서 이제 DB에 요청
		HashMap<String, Object> hash = new HashMap<>();
		hash.put("start", start);
		hash.put("end", end);
		hash.put("memberIdx", memberIdx);
				
		return mapper.getNotice(hash); 
	}

	@Override
	public int getTotal() {  
		return mapper.getTotal();
	}

	@Override
	public List<NoticeVO> selectAll() {
		return mapper.selectAll();
	}

	@Override
	@Transactional
	public int answerEmail(NoticeVO vo) {
		
		MailUtils sendMail;
		
		try { 
			sendMail = new MailUtils(mailSender);
			
			sendMail.setSubject("[MAGACGV] 문의내용 답변");
			sendMail.setText(new StringBuffer().append("<h1>[문의내용]</h1>")
					.append("<p>"+vo.getTitle()+"</p>")
					.append("<p>내용 : "+vo.getContent()+"</p><br>") 
					.append("<br><h1>[답변내용]</h1>")
					.append("<p>"+vo.getAnswer()+"</p><br>")
					.toString());
			sendMail.setFrom("jeonghoo1228@gmail.com", "MAGACGV"); 
			sendMail.setTo(vo.getEmail());
			sendMail.send();
			log.info("메일!!!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.answerEmail(vo);
		
	}
 
}

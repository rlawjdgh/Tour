package com.spring.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.MailUtils;
import com.spring.domain.MemberVO;
import com.spring.domain.TempKey;
import com.spring.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("member")
public class MemberServiceImpl implements MemberService{
	
	@Inject 
	private JavaMailSender mailSender;
	@Autowired  
	private MemberMapper mapper; 
	
	@Override
	public int registMember(MemberVO vo) {
		return mapper.registMember(vo);
	}

	@Override
	public MemberVO checkId(String id) {
		log.info(id);
		
		return mapper.checkId(id);
	}
	
	// 중복체크
	@Override
	public MemberVO checkEmail(String email) {
		return mapper.checkEmail(email);
	}
	
	@Override
	@Transactional
	public void checkMail(MemberVO email) {
		
		email.setName("username");
		email.setPassword("1111"); 
		
		mapper.registEmail(email); 
		MemberVO vo = mapper.getIdx(email.getEmail());
		
		String authkey = new TempKey().getKey(50, false);
		vo.setAuthkey(authkey);
		
		mapper.updateAuthKey(vo); 
		
		log.info("updateAuthKey"); 
		//보낼 mail내용  
		MailUtils sendMail; 
		log.info("zzzzzzzzzzz");
		try {
			log.info("11111111111");
			sendMail = new MailUtils(mailSender);
			log.info("메일 보내기");
			sendMail.setSubject("[MAGACGV] 회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
					.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://localhost:9090/tour/emailConfirm?idx=")
					.append(vo.getIdx())
					.append("&authkey=") 
					.append(authkey)
					.append("' target='_blenk'>이메일 인증 확인</a>")
					.toString());
			sendMail.setFrom("jeonghoo1228@gmail.com", "MAGACGV"); 
			sendMail.setTo(vo.getEmail());
			sendMail.send();
			log.info("메일!!!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	@Override
	public int updateAuthstatus(MemberVO vo) {
		return mapper.updateAuthstatus(vo);
	}
	
	@Override
	public MemberVO getPoint(int idx) {
		return mapper.getPoint(idx);
	}

	@Override
	public int setPoint(MemberVO vo) {
		return mapper.setPoint(vo); 
	}

	@Override
	public int memberDelete(int idx) {
		return mapper.memberDelete(idx);
	}

	@Override
	public int reInsert(MemberVO vo) {
		return mapper.reInsert(vo);
	}

}

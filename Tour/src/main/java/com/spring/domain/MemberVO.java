package com.spring.domain;

import lombok.Data;

@Data
public class MemberVO {
	
	private int idx;
	private String name;
	private String id;
	private String email;
	private String password;
	private int phone;
	private String grade;
	private String authkey;
	private int authstatus;
	private int point; 
	private int admin;
	
} 

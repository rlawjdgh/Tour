package com.spring.domain;
//게시판별로 페이지관리 편리하게 하기 위한 클래스
public class Common {

	public static class Reply{
		
		//한페이지당 보여줄 게시물 수
		public final static int BLOCKLIST = 10;
		
		//한 화면에 보여지는 페이지 메뉴 수
		//< 1 2 3 4 5 > 이런거
		public final static int BLOCKPAGE = 5;
		
	}

}
	
	//왜 이걸 따로 만들었냐 : 게시판이 여러개일경우 여기서 한번에 관리하기 위해서.
	//밑에는 예시
//	public static class Notice{
//		public final static int BLOCKLIST = 10;
//		public final static int BLOCKPAGE = 5;
//	}
	

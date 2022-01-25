package com.mycompany.myapp.service;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberService {

		
		public void memberjoin(MemberVO membervo) throws Exception;
		
		public MemberVO memberlogin(MemberVO membervo) throws Exception;
		
		public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);
		
		public void memberUpdate(MemberVO membervo) throws Exception;
		
}

package com.mycompany.myapp.service;

import java.util.List;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberService {

		
		public void memberjoin(MemberVO membervo) throws Exception;
		
		public MemberVO memberlogin(MemberVO membervo) throws Exception;
		
		public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);
		
		public void memberUpdate(MemberVO membervo) throws Exception;
		
		public List<MemberVO> memberView() throws Exception;
		
		public void memberDelete(String uid) throws Exception;
		
		public int idCheck(String uid) throws Exception;
		
		public int nickCheck(String nickname) throws Exception;
}

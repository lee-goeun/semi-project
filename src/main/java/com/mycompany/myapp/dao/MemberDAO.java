package com.mycompany.myapp.dao;

import java.util.List;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberDAO {
	public void memberjoin(MemberVO membervo) throws Exception;

	public MemberVO memberlogin(MemberVO membervo) throws Exception;
	
	public void memberUpdate(MemberVO membervo) throws Exception;
	
	public List<MemberVO> memberView()throws Exception;
	
	public void memberDelete(String uid) throws Exception;
}
	
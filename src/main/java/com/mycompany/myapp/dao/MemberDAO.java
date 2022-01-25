package com.mycompany.myapp.dao;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberDAO {
	public void memberjoin(MemberVO membervo) throws Exception;

	public MemberVO memberlogin(MemberVO membervo) throws Exception;
}
	
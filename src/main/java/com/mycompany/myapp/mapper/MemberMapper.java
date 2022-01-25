package com.mycompany.myapp.mapper;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberMapper {
	// join 
	public void memberJoin(MemberVO membervo);

	public void memberLogin(MemberVO membervo);
	
}

package com.mycompany.myapp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.vo.MemberVO;




@Repository("MemberDAO")
public class MemberDAOimpl implements MemberDAO {
	
	@Autowired 
	private SqlSession sql;
	
	@Override
	public void memberjoin(MemberVO membervo) throws Exception {
		sql.insert("com.mycompany.myapp.mapper.MemberMapper.memberJoin", membervo);
		
		
		
	}

	@Override
	public MemberVO memberlogin(MemberVO membervo) throws Exception {
	
		return sql.selectOne("com.mycompany.myapp.mapper.MemberMapper.memberLogin", membervo);
	}
	
	
	

}

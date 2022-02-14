package com.mycompany.myapp.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.dao.MemberDAO;
import com.mycompany.myapp.mapper.MemberMapper;
import com.mycompany.myapp.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service("MemberService")
public class MemberServiceimpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	@Autowired
	MemberMapper membermapper;

	@Override
	public void memberjoin(MemberVO membervo) throws Exception {
			dao.memberjoin(membervo);
		
	}
	  
	@Override
	public MemberVO memberlogin(MemberVO membervo) throws Exception {
			
		return dao.memberlogin(membervo);
	}


	@Override
	public void memberUpdate(MemberVO membervo) throws Exception {
		dao.memberUpdate(membervo);
		
	}
	
	
	@Override
	public List<MemberVO> memberView() throws Exception {
		
		return dao.memberView();
	}
	
	
	@Override
	public void memberDelete(String uid) throws Exception {
		dao.memberDelete(uid);
		
		
		
		
	}
	
	

	@Override
	public int idCheck(String uid) throws Exception {
		// TODO Auto-generated method stub
		return membermapper.idCheck(uid);
	}
	
	
	
	@Override
	public int nickCheck(String nickname) throws Exception {
		// TODO Auto-generated method stub
		return membermapper.nickCheck(nickname);
	}
	
	
	

	//sms 
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSHYSJMYM84M2G6"; 
		String api_secret = "SLGNRXFDZHGRT7ST7XCXSJKZX9MRTRCV"; 
		Message coolsms = new Message(api_key, api_secret); // 4 params(to, from, type, text) are mandatory. must be filled 
		HashMap<String, String> params = new HashMap<String, String>(); 
		params.put("to", userPhoneNumber); // 수신전화번호 
		params.put("from", "01075699952"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 
		params.put("type", "SMS"); 
		params.put("text", "[칰폭] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력 
		params.put("app_version", "test app 1.2"); // application name and version 
		try {
			JSONObject obj = (JSONObject)coolsms.send(params); 
		System.out.println(obj.toString()); 
		} 
		catch (CoolsmsException e) 
		{
			System.out.println(e.getMessage()); 
			System.out.println(e.getCode());
			} 
		}
}// end class();
	
	
	
	
	

	  
	



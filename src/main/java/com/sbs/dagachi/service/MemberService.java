package com.sbs.dagachi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.dagachi.repository.MemberRepository;
import com.sbs.dagachi.vo.Member;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRespository) {
		this.memberRepository = memberRespository;
	}
	
	public List<Member> getMember(){
		List<Member> memberList= memberRepository.getMember();
		
		return memberList;
		
	}
	public Member getMemberById(String member_id) {
		 Member member= memberRepository.getMemberById(member_id);
		return member;
	}
	public int login(String member_id,String member_pwd) {
		int result = 0;
		
		Member member = memberRepository.getMemberById(member_id);
		
		if(member != null) {
			if(member.getMember_pwd().equals(member_pwd)) {
				result=0;
			}else {
				result=1;
			}
			
		}else {
			result=2;
		}
		
		
		return result;
	}
	
	
	
	
}

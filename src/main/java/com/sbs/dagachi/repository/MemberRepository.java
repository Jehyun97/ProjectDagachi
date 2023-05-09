package com.sbs.dagachi.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sbs.dagachi.vo.Member;

@Mapper
public interface MemberRepository {

	List<Member> getMember();
	
	Member getMemberById(String member_id);
	
}

package com.sbs.dagachi.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sbs.dagachi.vo.MemberVO;

@Mapper
public interface MemberRepository {

	List<MemberVO> getMember();
	
	MemberVO getMemberById(String member_id);
	
}
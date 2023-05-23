package com.sbs.dagachi.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sbs.dagachi.vo.Member;

@Mapper
public interface MemberRepository {
	
	//이름으로 member가져오기
	public List<Member> getMembername(@Param("member_name")String member_name);
	
	List<Member> getMember();
	
	Member getMemberById(String member_id);
	
	public List<Member> getDepartmentRepresentative(@Param("member_department")int member_department);
	}

package com.sbs.dagachi.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sbs.dagachi.vo.ProjectL;

@Mapper
public interface ProjectLRepository {
	List<ProjectL>getPLlistByTeam(String teamName);
}

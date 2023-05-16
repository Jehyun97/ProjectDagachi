package com.sbs.dagachi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sbs.dagachi.repository.ProjectLRepository;
import com.sbs.dagachi.vo.ProjectL;

@Service
public class ProjectLService {
	private ProjectLRepository projectLRepository;
	
	public ProjectLService(ProjectLRepository projectLRepository) {
		this.projectLRepository=projectLRepository;
	}
	
	public List<ProjectL>getPLlistByTeam(String teamName){
		return projectLRepository.getPLlistByTeam(teamName);
	}
	
	
}

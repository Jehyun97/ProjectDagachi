package com.sbs.dagachi.service;

import java.util.Date;
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
	
	public void moveAnotherTeam(int pl_id, String teamName) {
		projectLRepository.moveAnotherTeam(pl_id, teamName);
	}
	
	public void registPL (String pl_name, Date pl_endDate, String pl_register, String pl_manager, String pl_team, String pl_body) {
		projectLRepository.registPL(pl_name, pl_endDate, pl_register, pl_manager, pl_team, pl_body);
		
	}
	
	public String getTeamName(int pl_id) {
		return projectLRepository.getTeamName(pl_id);
				
	}
	
	public void removePl(int pl_id) {
		projectLRepository.removePl(pl_id);
		
	}
	
	
}

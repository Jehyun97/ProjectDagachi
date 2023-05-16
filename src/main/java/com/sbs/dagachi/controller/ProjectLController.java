package com.sbs.dagachi.controller;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sbs.dagachi.service.MemberService;
import com.sbs.dagachi.service.ProjectLService;
import com.sbs.dagachi.service.TeamService;
import com.sbs.dagachi.vo.Member;
import com.sbs.dagachi.vo.ProjectL;
import com.sbs.dagachi.vo.TeamVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProjectLController {
	private ProjectLService projectLService;
	private TeamService teamService;
	private MemberService memberService;
	
	public ProjectLController(ProjectLService projectLService, TeamService teamService, MemberService memberService) {
		this.projectLService=projectLService;
		this.teamService=teamService;
		this.memberService=memberService;
	}
	
	
	@RequestMapping("dagachi/projectL/list")
	public String showProjectL(Model model, HttpSession session) {
		Member loginUser=(Member)session.getAttribute("loginUser");
		String userId=loginUser.getMember_id();
		
		String dep=memberService.getMemberById(userId).getMember_department();//부서를 스트링으로 받아오기
		int depInt=Integer.parseInt(dep);
		int memberAuth=memberService.getMemberById(userId).getMember_auth();//권한 인트값으로 받아오기 2=임원 1=직원
		List<TeamVO>teamlist=teamService.getTeamListByDep(depInt);
		
		model.addAttribute("teamlist", teamlist);
		model.addAttribute("memberAuth", memberAuth);
		
		return "projectL/projectL_list";
	}
	
	@RequestMapping("dagachi/projectL/moveAnotherTeam")
	public String moveAnotherTeam(int pl_id, String team_name) {
		projectLService.moveAnotherTeam(pl_id, team_name);
		return"projectL/resultPLlist";
	}
	
	
	@RequestMapping("dagachi/projectL/plList")
	public String showResultList(Model model, String teamName,HttpSession session) {
		List<ProjectL>plList=projectLService.getPLlistByTeam(teamName);
		Member loginUser=(Member)session.getAttribute("loginUser");
		String userId=loginUser.getMember_id();
		String dep=memberService.getMemberById(userId).getMember_department();//부서를 스트링으로 받아오기
		int depInt=Integer.parseInt(dep);
		List<TeamVO>teamlist=teamService.getTeamListByDep(depInt);
		
		model.addAttribute("teamlist", teamlist);
		model.addAttribute("plList", plList);
		
		return "projectL/resultPLlist";
		
		
	}
	
	@RequestMapping("dagachi/projectL/registForm")
	public String showRegistForm(HttpSession session,Model model) {
		Member loginUser=(Member)session.getAttribute("loginUser");
		String pl_register=loginUser.getMember_id();
		String dep=memberService.getMemberById(pl_register).getMember_department();//부서를 스트링으로 받아오기
		int depInt=Integer.parseInt(dep);
		List<TeamVO>teamlist=teamService.getTeamListByDep(depInt);
		model.addAttribute("teamlist", teamlist);
		return "projectL/registForm";
	}
	
	@RequestMapping("dagachi/projectL/regist")
	public String plRegist(HttpSession session, String pl_name,  @DateTimeFormat(pattern="yyyy-MM-dd")Date pl_endDate, 
			String pl_manager, String pl_team, String pl_body,Model model) {
		Member loginUser=(Member)session.getAttribute("loginUser");
		String pl_register=loginUser.getMember_id();
		
		pl_manager="user3";
		
		projectLService.registPL(pl_name, pl_endDate, pl_register, pl_manager, pl_team, pl_body);
		return showResultList(model, pl_register, session);
	}
	
	
}

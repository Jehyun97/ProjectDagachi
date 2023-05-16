package com.sbs.dagachi.controller;

import java.util.List;

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
	
	
	@RequestMapping("dagachi/projectL/plList")
	public String showResultList(Model model, String teamName) {
		List<ProjectL>plList=projectLService.getPLlistByTeam(teamName);
		
		model.addAttribute("plList", plList);
		
		return "projectL/resultPLlist";
		
		
	}
	
	@RequestMapping("dagachi/projectL/plRegist")
	public String showRegistForm(HttpSession session) {
		
		return "";
	}
	
	
}

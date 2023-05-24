package com.sbs.dagachi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sbs.dagachi.service.MemberService;
import com.sbs.dagachi.service.TeamService;

import jakarta.servlet.http.HttpSession;

@Controller
public class IncludeController {
	private MemberService memberService;
	private TeamService teamService;
	
	public IncludeController(MemberService memberService, TeamService teamService) {
		this.memberService=memberService;
		this.teamService=teamService;
	}
	
	@RequestMapping("dagachi/*")
	public String showHead(HttpSession session,Model model) {
		
		model.addAttribute("check", "zz");
		return "include/head";
		
	}
	
	
	
}

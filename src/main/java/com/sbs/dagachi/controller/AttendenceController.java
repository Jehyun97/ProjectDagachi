package com.sbs.dagachi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendenceController {
	@RequestMapping("/attendence/teamDetail")
	public String showMain() {
		return "attendence/teamDetail";
	}
	
}

package com.sbs.dagachi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class Main {

		
		@RequestMapping("/main")
		public String showMain() {
			return "/home/main";
		}
		


		
		
		  
	

}

package com.ssafy.hello.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {
	
	@GetMapping("/move")
	public String start(Model model) {
		model.addAttribute("msg", "안녕하세요");
		return "hello";
	}
	
	@GetMapping("/main")
	public String moveMain() {
		return "page/main/main";
	}
}

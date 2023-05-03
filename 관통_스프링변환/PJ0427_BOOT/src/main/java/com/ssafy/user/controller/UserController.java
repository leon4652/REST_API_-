package com.ssafy.user.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.user.model.User;
import com.ssafy.user.model.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	private UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}

	@ResponseBody
	@PostMapping("/login")
	public boolean login(@RequestBody User user, HttpSession session) throws Exception {
		System.out.println(user.getId());
		System.out.println(user.getPassword());
		
		User u = userService.loginUser(user);
		System.out.println(u.getId() + " " + u.getPassword() + " " + u.getName());
		return true;
	}
}

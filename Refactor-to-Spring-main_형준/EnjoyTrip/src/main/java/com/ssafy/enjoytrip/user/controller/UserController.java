package com.ssafy.enjoytrip.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.enjoytrip.user.model.User;
import com.ssafy.enjoytrip.user.model.service.UserService;
import com.ssafy.enjoytrip.user.model.service.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController extends HttpServlet {

	private UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}

	// 로그인
	@PostMapping("login")
	private String login(HttpSession session, String id, String pw, String remember, HttpServletResponse response) {

		User user;

		try {
			// 사용자가 입력한값과 db에 값이 같은게 있는지 찾아서 있으면 값을 없으면 null
			user = userService.login(id, pw);
			System.out.println(user.getId());
			System.out.println(user.getName());
			System.out.println(user.getEmail());
		} catch (Exception e) {
			e.printStackTrace();
			return "error/error";
		}

		if (remember != null) {
			Cookie cookie = new Cookie("savedId", id);
			cookie.setMaxAge(60 * 60 * 24 * 365 * 20);
			response.addCookie(cookie);

		} else {
			Cookie cookie = new Cookie("savedId", id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}

		// db에서 받아온값에 아이디와 비밀번호가 있다면 로그인해라
		if (user.getId() != null && user.getName() != null) {
			session.setAttribute("userInfo", user);

			return "index";
		} else {
			// 그외에는 로그인 되면 안된다!
			return "/loginForm";
		}
	}

	//로그인 폼
	@GetMapping("login")
	private String login() {
		return "user/loginForm";
	}
	
	//로그인 아웃
	@GetMapping("logout")
	private String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "index";
	}

	// 회원가입
	@PostMapping("regist")
	private String register(User user) {
		try {
			// 회원가입
			userService.register(user);
		} catch (Exception e) {
			e.printStackTrace();
			return "error/error";
		}
		return "redirect:login";
	}

	@GetMapping("regist")
	private String register() {
		return "user/register";
	}

	// ajax를 통해 입력값 체크
	@GetMapping("duplicateCheck")
	@ResponseBody
	private String duplicateCheck(String id) throws Exception {
		String check = userService.duplicateCheck(id);
		return check;
	}

	// 비밀번호 업데이트
	@PostMapping("pwupdate")
	private String pwUpdate(String passwd, String id, Model model) {
		try {
			model.addAttribute("update", userService.pwUpdate(id, passwd));
		} catch (Exception e) {
			e.printStackTrace();
			return "/error/error";
		}

		return "pwUpdate";
	}

	// 비밀번호 찾기
	@PostMapping("pwfind")
	private String pwFind(String id, String email, Model model) {
		try {
			User user = userService.pwFind(id, email);
			model.addAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			return "/error/error";
		}

		return "pwUpdate";
	}

	//아이디 찾기 ajax
	@PostMapping("idfind")
	private void idFind(String name, String email, HttpServletResponse response) throws Exception {

		User user = userService.idFind(name, email);

		ObjectMapper objectMapper = new ObjectMapper();
		String userJson = objectMapper.writeValueAsString(user);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(userJson);
		out.flush();
	}
	
	@GetMapping("idFind")
	private String idFind() {
		return "user/idFind";
	}
	
	@GetMapping("pwfind")
	private String pwFind() {
		return "user/pwFind";
	}
	

}

package com.ssafy.enjoytrip.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.enjoytrip.user.model.User;
import com.ssafy.enjoytrip.user.model.service.UserService;
import com.ssafy.enjoytrip.user.model.service.UserServiceImpl;

@Controller
@RequestMapping("/mypage")
public class MypageController extends HttpServlet {
	
	private UserService userService;
	
	public MypageController(UserService userService) {
		this.userService = userService;
	}
		
	//정보 수정
	@PostMapping("modify")
	private void modify(String id, String name, String email, HttpSession session, HttpServletResponse response) {
		
		try {
			userService.modify(id, name, email);
			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setEmail(email);
			session.setAttribute("userInfo", user);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원정보가 정상적으로 수정되었습니다.'); location.href='mypageForm'; </script>");
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원 정보
	@GetMapping("mypageForm")
	private String mypageForm() {
		return "/user/myPage";
	}
	
	//회원 탈퇴
	@GetMapping("withdrawal")
	private String withdrawal(HttpSession session) {
		User user = (User) session.getAttribute("userInfo");
//		System.out.println(user.getId());
		try {
			userService.withdrawal(user);
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
			return "error/error";
		}
		
		return "/";
	}
	
}

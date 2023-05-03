package com.enjoy.trip.rest.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.enjoy.trip.dto.Notice;
import com.enjoy.trip.service.NoticeService;

@RestController
@RequestMapping("/api/notice")
public class NoticeController {
	private NoticeService noticeService;
	public NoticeController(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@GetMapping("/list")
	public List<Notice> select() throws Exception {
		return noticeService.selectNotice();
	}

	@PostMapping("/write")
	public void writeNotice(@RequestBody Notice param, HttpSession session) throws Exception {
		//User user = ((User) session.getAttribute("userInfo"));
		//if(user.getIsAdmin() != 1) return; //1인 경우 어드민 설정
		//int userNo = user.getNo(); 
		int userNo = 1; //임시 1 설정
		
		// 사용자 no 세션에서 가져와서 입력
		param.setUserNo(userNo);
		noticeService.writeNotice(param);
	}
	
	@GetMapping("/delete/{noticeNo}")
	public void deleteNotice(@PathVariable int noticeNo) throws Exception {
		noticeService.deleteNotice(noticeNo);
	}

	@PutMapping("/update/{noticeNo}")
	public void updateNotice(@PathVariable int noticeNo, @RequestBody Notice param) throws Exception {
		param.setNo(noticeNo);
		noticeService.updateNotice(param);
	}
	
	@GetMapping("/info/{noticeNo}")
	public Notice getNotice(@PathVariable int noticeNo) throws Exception {
		return noticeService.getNotice(noticeNo);
	}
	
	
	
}

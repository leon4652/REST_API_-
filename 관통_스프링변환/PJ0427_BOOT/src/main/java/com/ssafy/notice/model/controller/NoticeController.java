//package com.ssafy.notice.model.controller;
//
//import java.util.List;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.ssafy.notice.model.Notice;
//import com.ssafy.notice.model.service.NoticeService;
//
//
//
//
////@Controller
//@RestController
//@RequestMapping("/api/notice")
//public class NoticeController {
//	private NoticeService noticeService;
//	public NoticeController(NoticeService noticeService) {
//		this.noticeService = noticeService;
//	}
//	
//	@ResponseBody
//	@GetMapping("/list")
//	public List<Notice> select() throws Exception {
//		return noticeService.selectBoard();
//	}
//	
//	@ResponseBody
//	@GetMapping("/info/{no}")
//	public Notice getBoard(@PathVariable int no) throws Exception {
//		return noticeService.getBoard(no);
//	}
//	
//	@ResponseBody
//	@PostMapping("/write")
//	public void write(String subject, String content) throws Exception {
//		Notice write = new Notice();
//		write.setTitle(subject);
//		write.setContents(content);
//		write.setMemberNo(1);		// 사용자 no 가져와서 입력
//		noticeService.writeBoard(write);
//	}
//	
//	@ResponseBody
//	@GetMapping("/delete/{no}")
//	public void delete(@PathVariable int no) throws Exception {
//		noticeService.deleteBoard(no);
//	}
//	
//	@ResponseBody
//	//@PutMapping("/update/{no}")
//	@PostMapping("/update/{no}")
//	public void modify(@PathVariable int no, String subject, String content) throws Exception {
//		Notice update = new Notice();
//		update.setNo(no);
//		update.setContents(content);
//		update.setTitle(subject);
//		noticeService.updateBoard(update);
//	}
//	
//	
//}

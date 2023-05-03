//package com.ssafy.board.model.controller;
//
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.ssafy.board.model.ShareAttraction;
//import com.ssafy.board.model.service.ShareAttractionService;
//
//@RestController
//@RequestMapping("/api/shareboard")
//public class ShareAttractionController {
//	private ShareAttractionService shareBoardService;
//	public ShareAttractionController(ShareAttractionService shareBoardService) {
//		this.shareBoardService = shareBoardService;
//	}
//	
//	//share_attration 추가
//	@PostMapping("/write/{no}")
//	public void writeAttraction(@PathVariable int no, @RequestBody ShareAttraction param) {
//		shareBoardService.writeShareAttraction(param);
//	}
//}

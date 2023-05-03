package com.ssafy.board.model.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.board.model.Board;
import com.ssafy.board.model.service.BoardService;


@RestController
@RequestMapping("/api/board")
public class BoardController {
	private BoardService boardService;
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	

	@GetMapping("/list")
	public List<Board> select() throws Exception {
		return boardService.selectBoard();
	}
	

	@GetMapping("/info/{no}")
	public Board getBoard(@PathVariable int no) throws Exception {
		return boardService.getBoard(no);
	}
	
	@PostMapping("/write")
	public void write(@RequestBody Board param, HttpSession session) throws Exception {
//		int userNo = ((User) session.getAttribute("userInfo")).getNo();
		int userNo = 1;
		
		// 사용자 no 세션에서 가져와서 입력
		param.setMemberNo(userNo);
		boardService.writeBoard(param);
	}
	

	@GetMapping("/delete/{no}")
	public void delete(@PathVariable int no) throws Exception {
		boardService.deleteBoard(no);
	}

	@PutMapping("/update/{no}")
	public void modify(@PathVariable int no, @RequestBody Board param) throws Exception {
		param.setNo(no);
		boardService.updateBoard(param);
	}
	
}

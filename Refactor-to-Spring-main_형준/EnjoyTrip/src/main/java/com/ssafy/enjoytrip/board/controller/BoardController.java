package com.ssafy.enjoytrip.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.enjoytrip.board.model.Board;
import com.ssafy.enjoytrip.board.model.Page;
import com.ssafy.enjoytrip.board.model.service.BoardService;
import com.ssafy.enjoytrip.user.model.User;


@Controller
@RequestMapping("/board")
public class BoardController{
	
	private BoardService boardService;
	
	public BoardController(BoardService boardService) {
		super();
		this.boardService = boardService;
	}
	
	
	private boolean loginCheck(HttpSession session) {
		User user = (User) session.getAttribute("userInfo");
		if(user == null) return true;
		return false;
	}
	
	@GetMapping("/list")
	public String list(String pageNo, Model model) throws Exception{
		try {
			//페이지 수를 안했을 경우
			Page page = new Page();
			try {
				//페이지 NO가 넘어 오지 않았다면 Page 초기값으로 진행!
				page.setPageNo(Integer.parseInt(pageNo));
			}catch(Exception e){ }
			System.out.println(page.getPageNo());
			Map<String, Object> boardMap = boardService.list(page);
			model.addAttribute("boardMap", boardMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/board/list";
		
	}
	
	
	@GetMapping("/view")
	public String view(int articleNo, HttpSession session, RedirectAttributes ra, Model model) throws Exception{
		if(loginCheck(session)) {
			ra.addFlashAttribute("msg","로그인이 필요한 기능입니다.");
			return "redirect:/user/login";
		}
		
		Board board = boardService.getArticle(articleNo);
		model.addAttribute("board", board);
		boardService.updateHit(articleNo);
		return "board/view";
	}
	
	@GetMapping("/writeForm")
	public String writeForm(HttpSession session, RedirectAttributes ra) {
		if(loginCheck(session)) {
			ra.addFlashAttribute("msg","로그인이 필요한 기능입니다.");
			return "redirect:/user/login";
		}
		return "board/write";
	}
	
	@PostMapping("/write")
	public String write(HttpSession session, RedirectAttributes ra, Board board) throws Exception {
		if(loginCheck(session)) {
			ra.addFlashAttribute("msg","로그인이 필요한 기능입니다.");
			return "redirect:/user/login";
		}
		User user = (User) session.getAttribute("userInfo");
		board.setUserId(user.getId());
		boardService.writeArticle(board);
		return "redirect:/board/list";
	}
	
	
	@GetMapping("/modifyForm")
	public String modifyForm(HttpSession session, RedirectAttributes ra, int articleNo) throws Exception {
		if(loginCheck(session)) {
			ra.addFlashAttribute("msg","로그인이 필요한 기능입니다.");
			return "redirect:/user/login";
		}
		Board board = boardService.getArticle(articleNo);
		ra.addAttribute("article", board);
		return "/board/modify";
		
	}
	
	@PostMapping("/modify")
	public String modify(HttpSession session, Board board, HttpServletRequest request, RedirectAttributes ra) throws Exception {
		if(loginCheck(session)) {
			ra.addFlashAttribute("msg","로그인이 필요한 기능입니다.");
			return "redirect:/user/login";
		}
		
		System.out.println(board.getArticleNo());
		System.out.println(board.getSubject());
		boardService.modifyArticle(board);
		
		//ra.addFlashAttribute("articleNo", String.format("%d",board.getArticleNo()));
		//String url = request.getHeader("REFERER"); 
		//System.out.println(url);
		return "redirect:/board/view?articleNo="+board.getArticleNo();
		//return "redirect:/board/view";
		
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session, RedirectAttributes ra, int articleNo) throws Exception {
		if(loginCheck(session)) {
			ra.addFlashAttribute("msg", "로그인이 필요한 기능입니다.");
			return "redirect:/user/login";
		}
		boardService.deleteArticle(articleNo);
		return "redirect:/board/list";
	}
}
package com.ssafy.enjoytrip.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.board.model.Board;
import com.ssafy.enjoytrip.board.model.Page;
import com.ssafy.enjoytrip.board.model.PageResult;
import com.ssafy.enjoytrip.board.model.mapper.BoardMapper;
import com.ssafy.enjoytrip.board.model.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper boardDao;

	private BoardServiceImpl (BoardMapper boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public Map<String, Object> list(Page page) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		result.put("list", boardDao.selectArticle(page));
		result.put("pageResult", new PageResult(page.getPageNo(), boardDao.selectArticleCount()));
		
		return result;
	}

	@Override
	public void writeArticle(Board Board) throws Exception {
		boardDao.writeArticle(Board);
	}

	@Override
	public Board getArticle(int articleNo) throws Exception {
		return boardDao.getArticle(articleNo);
	}

	@Override
	public void updateHit(int articleNo) throws Exception {
		boardDao.updateHit(articleNo);
	}

	@Override
	public void modifyArticle(Board board) throws Exception {
		boardDao.modifyArticle(board);
	}

	@Override
	public void deleteArticle(int articleNo) throws Exception {
		boardDao.deleteArticle(articleNo);
	}
}

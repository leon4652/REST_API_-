package com.ssafy.enjoytrip.board.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.enjoytrip.board.model.Board;
import com.ssafy.enjoytrip.board.model.Page;

public interface BoardService {
	Map<String, Object> list(Page page) throws Exception;
	void writeArticle(Board Board) throws Exception;
	Board getArticle(int articleNo) throws Exception;
	void updateHit(int articleNo) throws Exception;
	void modifyArticle(Board Board) throws Exception;
	void deleteArticle(int articleNo) throws Exception;
}

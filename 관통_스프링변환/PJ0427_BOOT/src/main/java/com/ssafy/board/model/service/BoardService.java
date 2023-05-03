package com.ssafy.board.model.service;

import java.util.List;

import com.ssafy.board.model.Board;

public interface BoardService {
	List<Board> selectBoard() throws Exception;

	void deleteBoard(int no) throws Exception;

	void writeBoard(Board write) throws Exception;

	Board getBoard(int no) throws Exception;

	void updateBoard(Board update) throws Exception;
}

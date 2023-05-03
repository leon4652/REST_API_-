package com.ssafy.board.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.board.model.Board;
import com.ssafy.board.model.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	private BoardMapper boardMapper;	
	public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}

	@Override
	public List<Board> selectBoard() throws Exception {
		return boardMapper.selectBoard();
	}
	
	@Override
	public void deleteBoard(int no) throws Exception {
		boardMapper.deleteBoard(no);
	}

	@Override
	public void updateBoard(Board update) throws Exception {
		boardMapper.updateBoard(update);
	}

	@Override
	public void writeBoard(Board write) throws Exception {
		boardMapper.writeBoard(write);
	}

	@Override
	public Board getBoard(int no) throws Exception {
		return boardMapper.getBoard(no);
	}



}

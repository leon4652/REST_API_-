package com.ssafy.board.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.board.model.Board;

@Mapper
public interface BoardMapper {
	List<Board> selectBoard() throws Exception;
	Board getBoard(int no) throws Exception;
	void deleteBoard(int no) throws Exception;
	void updateBoard(Board update) throws Exception;
	void writeBoard(Board write) throws Exception;
}

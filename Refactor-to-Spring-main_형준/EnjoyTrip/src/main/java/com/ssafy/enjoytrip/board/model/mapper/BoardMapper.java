package com.ssafy.enjoytrip.board.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.board.model.Board;
import com.ssafy.enjoytrip.board.model.Page;

@Mapper
public interface BoardMapper {
	List<Board> selectArticle(Page page) throws SQLException;
	void writeArticle(Board Board) throws SQLException;
	Board getArticle(int articleNo) throws SQLException;
	void updateHit(int articleNo) throws SQLException;
	void modifyArticle(Board Board) throws SQLException;
	void deleteArticle(int articleNO) throws SQLException;
	int selectArticleCount() throws SQLException;
}

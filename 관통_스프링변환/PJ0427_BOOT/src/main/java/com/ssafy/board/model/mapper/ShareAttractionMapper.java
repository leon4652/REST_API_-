package com.ssafy.board.model.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.ssafy.board.model.ShareAttraction;

@Mapper
public interface ShareAttractionMapper {
	void writeShareBoard(ShareAttraction param);
}

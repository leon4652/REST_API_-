package com.ssafy.board.model.service;


import org.springframework.stereotype.Service;

import com.ssafy.board.model.ShareAttraction;
import com.ssafy.board.model.mapper.ShareAttractionMapper;

@Service
public class ShareAttractionServiceImpl implements ShareAttractionService {
	private ShareAttractionMapper shareBoardMapper;
	public ShareAttractionServiceImpl(ShareAttractionMapper shareBoardMapper) {
		this.shareBoardMapper = shareBoardMapper;
	}
	@Override
	public void writeShareAttraction(ShareAttraction param) {
		shareBoardMapper.writeShareBoard(param);
	}
	
}

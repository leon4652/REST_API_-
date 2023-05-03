package com.ssafy.enjoytrip.attraction.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.attraction.model.Attraction;
import com.ssafy.enjoytrip.attraction.model.ContentType;
import com.ssafy.enjoytrip.attraction.model.Sido;
import com.ssafy.enjoytrip.attraction.model.mapper.AttractionMapper;

@Service
public class AttractionServiceImpl implements AttractionService {
	private AttractionMapper attMapper;
	
	public AttractionServiceImpl(AttractionMapper attMapper) {
		super();
		this.attMapper = attMapper;
	}

	@Override
	public List<Sido> sidoList() throws Exception {
		return attMapper.selectSido();
	}

	@Override
	public List<ContentType> contentTypeList() throws Exception {
		return attMapper.selectContent();
	}

	@Override
	public List<Attraction> attList(int sidoCode, int contentId) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("sidoCode", sidoCode);
		map.put("contentId", contentId);
		return attMapper.selectAttraction(map);
	}

	@Override
	public List<Attraction> attListByContent(int contentTypeId) throws Exception {
		return attMapper.selectAttByContent(contentTypeId);
	}
	
	//디테일 페이지를 위한 List 호출 
	@Override
	public List<Attraction> attListByDetail(int contentId, String mode) throws Exception {
		//사용자가 선택한 정보
		List<Attraction> list = null;
		Attraction chooseAttraction = attMapper.attChooseContent(contentId);
		if(mode.equals("sido")) list = attMapper.attListByDetailSido(chooseAttraction);
		//else if(mode.equals("serch"))
		list.add(0, chooseAttraction);
	
		return list;
	}
	
	//디테일 페이지의 띄울 리스트 처리!
	@Override
	public List<Attraction> attListByDetailForm(int contentId, String mode) throws Exception {
		List<Attraction> list = null;
		//contentID 값의 데이터 DB에서 찾아오기
		Attraction chooseAttraction = attMapper.attChooseContent(contentId);
		//클릭한 값의 이미지가 없다면 
		if(chooseAttraction.getFirstImage().trim().equals("")) chooseAttraction.setFirstImage("/WEB-INF/resources/img/noimage.png");
		if(mode.equals("sido")) list = attMapper.attListByDetailSido(chooseAttraction);
		if(mode.equals("content")) list = attMapper.attListByDetailContent(chooseAttraction);
		//선택한 이미지와 같은게 있다면 삭제하고 이미지가 없다면 NO Image 추가
		for(int i = list.size()-1; i >= 0; i--) {
			if(list.get(i).getContentId() == chooseAttraction.getContentId()) list.remove(i);
			if(list.get(i).getFirstImage().trim().equals("")) list.get(i).setFirstImage("/WEB-INF/resources/img/noimage.png");
		}
		list.add(0, chooseAttraction);
		return list;
	}
	
	//검색시
	@Override
	public List<Attraction> search(String keyword) throws Exception {
		List<Attraction> list = attMapper.selectAttByKeyword(keyword);
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getFirstImage().trim().equals("")) list.get(i).setFirstImage("/WEB-INF/resources/img/noimage.png");
		}
		return list;
	}
	
	//디테일 -> 상세를 위한 값 호출
	@Override
	public Attraction getAttraction(int contentId) throws Exception {
		Attraction chooseAttraction = attMapper.attChooseContent(contentId);
		//클릭한 값의 이미지가 없다면 
		if(chooseAttraction.getFirstImage().trim().equals("")) chooseAttraction.setFirstImage("/WEB-INF/resources/img/noimage.png");
		return chooseAttraction;
	}
}

package com.ssafy.enjoytrip.attraction.model.service;

import java.util.List;

import com.ssafy.enjoytrip.attraction.model.Attraction;
import com.ssafy.enjoytrip.attraction.model.ContentType;
import com.ssafy.enjoytrip.attraction.model.Sido;

public interface AttractionService {
	List<Sido> sidoList() throws Exception;
	List<ContentType> contentTypeList() throws Exception;
	List<Attraction> attList(int sidoCode, int contentId) throws Exception;
	List<Attraction> attListByContent(int contentTypeId) throws Exception;
	List<Attraction> attListByDetail(int contentId, String mode) throws Exception;
	List<Attraction> attListByDetailForm(int contentId, String mode) throws Exception;
	List<Attraction> search(String keyword) throws Exception;
	Attraction getAttraction(int contentId) throws Exception;
}

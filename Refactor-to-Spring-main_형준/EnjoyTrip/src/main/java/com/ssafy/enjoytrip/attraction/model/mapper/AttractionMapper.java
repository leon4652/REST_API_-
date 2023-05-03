package com.ssafy.enjoytrip.attraction.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.attraction.model.Attraction;
import com.ssafy.enjoytrip.attraction.model.ContentType;
import com.ssafy.enjoytrip.attraction.model.Sido;

@Mapper
public interface AttractionMapper {
	List<Sido> selectSido() throws SQLException;
	List<ContentType> selectContent() throws SQLException;
	List<Attraction> selectAttraction(Map<String, Integer> map) throws SQLException;
	List<Attraction> selectAttByContent(int contentTypeId) throws SQLException;
	List<Attraction> attListByDetailSido(Attraction attaction) throws SQLException;
	Attraction attChooseContent(int contentId) throws SQLException;
	List<Attraction> selectAttByKeyword(String keyword) throws SQLException;
	List<Attraction> attListByDetailContent(Attraction attaction) throws SQLException;
}



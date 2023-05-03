package com.enjoy.trip.mapper;

import java.util.List;

import com.enjoy.trip.dto.Notice;

public interface NoticeMapper {
	List<Notice> selectNotice();
	void writeNotice(Notice param) throws Exception;
	void deleteNotice(int noticeNo) throws Exception;
	void updateNotice(Notice param) throws Exception;
	Notice getNotice(int noticeNo) throws Exception;
	void hitsRateUp(int noticeNo) throws Exception;
}

package com.gym.service;

import java.util.List;

import com.gym.domain.Ex_BoardVO;
import com.gym.domain.FreeBoardVO;
import com.gym.domain.NoticeVO;

public interface NewsService {
	
	//공지사항 목록 
	public List<NoticeVO> getNotiNews() throws Exception;
	
	//자유게시판 목록
	public List<FreeBoardVO> getFreeNews() throws Exception;

	//운동게시판 목록
	public List<Ex_BoardVO> getExNews() throws Exception;
	

}

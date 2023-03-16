package com.gym.service;

import java.util.List;

import com.gym.domain.Ex_BoardVO;

public interface Ex_BoardService {

	//게시물 목록
	public List<Ex_BoardVO> getList() throws Exception;
	
	//게시물 작성
	public void write(Ex_BoardVO evo) throws Exception;
	
	//게시물 조회
	public Ex_BoardVO view(int ex_num) throws Exception;
	
	//게시물 수정
	public void Ex_Modify(Ex_BoardVO evo) throws Exception;
	
	//게시물 삭제
	public void Ex_delete(int ex_num) throws Exception;
	
	//게시물 총 갯수 
	public int ex_count() throws Exception;

	//게시물 목록 + 페이징
	public List<Ex_BoardVO> ex_listPage(int displayPost, int postNum) throws Exception;
	
	//게시물 목록 + 페이징 + 검색
	public List<Ex_BoardVO> ex_search(
			int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	//게시물 총 갯수 + 검색
	public int ex_SearchCount(String searchType, String keyword) throws Exception;
	
}

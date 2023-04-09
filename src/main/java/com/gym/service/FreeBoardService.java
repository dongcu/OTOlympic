package com.gym.service;

import java.util.List;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.ReplyVO;

public interface FreeBoardService {

	// 게시물 총 개수 + 검색한 게시물 개수
	public int getSearchCnt(String keyword, String searchType) throws Exception;

	// 게시물 목록 보기
	public List<FreeBoardVO> getFreelist(String keyword, String searchType, int display, int PostpostNum) throws Exception;

	// 게시물 본문 보기
	public FreeBoardVO getFreeDetail(int b_num) throws Exception;

	// 게시물 조회수
	public void freeViewCnt(int b_num) throws Exception;

	// 게시물 글쓰기
	public void freeWrite(FreeBoardVO vo) throws Exception;

	// 게시물 수정
	public void freeModify(FreeBoardVO vo) throws Exception;

	// 게시물 삭제
	public void freeDelete(int b_num) throws Exception;

	// 댓글 작성
	public void freeReplyWrite(ReplyVO vo) throws Exception;

	// 댓글 조회
	public List<ReplyVO> freeReplylist(int b_num, int displayPost, int postNum) throws Exception;

	// 댓글 총 개수
	public int getReplyCnt(int b_num) throws Exception;

	// 댓글 삭제
	public int replyDelete(int c_num) throws Exception;

	// 댓글 수정
	public void replyModify(ReplyVO vo) throws Exception;

	public ReplyVO replyDetail(int c_num);
}
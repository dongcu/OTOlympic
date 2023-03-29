package com.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.FreeBoardDAO;
import com.gym.domain.FreeBoardVO;
import com.gym.domain.ReplyVO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	private FreeBoardDAO dao;

	// 게시판 총 개수 세기
	@Override
	public int getFreeCnt() throws Exception {
		return dao.getFreeCnt();
	}

	// 게시판 목록 불러오기
	@Override
	public List<FreeBoardVO> getFreelist(String keyword, String searchType, int displayPost, int postNum) throws Exception {
		return dao.getFreelist(keyword, searchType, displayPost, postNum);
	}

	// 게시판 본문 보기
	@Override
	public FreeBoardVO getFreeDetail(int b_num) throws Exception {
		return dao.getFreeDetail(b_num);
	}

	// 게시물 조회수
	@Override
	public void freeViewCnt(int b_num) throws Exception {
		dao.freeViewCnt(b_num);
	}

	// 게시물 글 작성
	@Override
	public void freeWrite(FreeBoardVO vo) throws Exception {
		dao.freewrite(vo);
	}

	// 게시물 수정
	@Override
	public void freeModify(FreeBoardVO vo) throws Exception {
		dao.freeModify(vo);
	}

	// 게시물 삭제
	@Override
	public void freeDelete(int b_num) throws Exception {
		dao.freeDelete(b_num);
	}

	// 게시물 내용 검색
	@Override
	public int getSearchCnt(String keyword, String searchType) throws Exception {
		return dao.getSearchCnt(keyword, searchType);
	}

	// 댓글 작성
	@Override
	public void freeReplyWrite(ReplyVO vo) throws Exception {
		dao.freeReplyWrite(vo);
	}

	// 댓글 조회
	@Override
	public List<ReplyVO> freeReplylist(int b_num, int displayPost, int postNum) throws Exception {
		return dao.freeReplylist(b_num, displayPost, postNum);
	}

	// 댓글 총 개수
	@Override
	public int getReplyCnt(int b_num) throws Exception {
		return dao.getReplyCnt(b_num);
	}

	// 댓글 삭제
	@Override
	public int replyDelete(int c_num) throws Exception {
		return dao.replyDelete(c_num);
	}

	// 댓글 수정
	@Override
	public void replyModify(ReplyVO vo) throws Exception {
		dao.replyModify(vo);
	}

	@Override
	public ReplyVO replyDetail(int c_num) {
		return dao.replyDetail(c_num);
	}

}
package com.gym.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.ReplyVO;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.gym.mappers.free";

	// 게시물 총 개수 + 검색한 게시물 개수
	@Override
	public int getSearchCnt(String keyword, String searchType) throws Exception {
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("keyword", keyword);
		data.put("searchType", searchType);

		return sql.selectOne(namespace + ".freeSearchCnt", data);
	}

	// 게시글 목록 보기
	@Override
	public List<FreeBoardVO> getFreelist(String keyword, String searchType, int displayPost, int postNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		data.put("searchType", searchType);

		return sql.selectList(namespace + ".freeList", data);
	}

	// 게시글 내용 보기
	@Override
	public FreeBoardVO getFreeDetail(int b_num) throws Exception {
		return sql.selectOne(namespace + ".freeDetail", b_num);
	}

	// 게시글 조회수
	@Override
	public void freeViewCnt(int b_num) throws Exception {
		sql.selectOne(namespace + ".freeViewCnt", b_num);
	}

	// 게시물 글쓰기
	@Override
	public void freewrite(FreeBoardVO vo) throws Exception {
		sql.insert(namespace + ".freeWrite", vo);
	}

	// 게시물 수정하기
	@Override
	public void freeModify(FreeBoardVO vo) throws Exception {
		sql.update(namespace + ".freeModify", vo);
	}

	// 게시물 삭제
	@Override
	public void freeDelete(int b_num) throws Exception {
		sql.delete(namespace + ".freeDelete", b_num);
	}

	// 댓글 작성
	@Override
	public void freeReplyWrite(ReplyVO vo) throws Exception {
		sql.insert(namespace + ".freeReplyWrite", vo);
	}

	// 댓글 조회
	@Override
	public List<ReplyVO> freeReplylist(int b_num, int displayPost, int postNum) throws Exception {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("b_num", b_num);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		return sql.selectList(namespace + ".freeReplyList", data);
	}

	// 댓글 총 개수
	@Override
	public int getReplyCnt(int b_num) throws Exception {
		return sql.selectOne(namespace + ".freeReplyCnt", b_num);
	}

	// 댓글 삭제
	@Override
	public int replyDelete(int c_num) throws Exception {
		return sql.delete(namespace + ".freeReplyDelete", c_num);
	}

	// 댓글 수정
	@Override
	public void replyModify(ReplyVO vo) throws Exception {
		sql.update(namespace + ".freeReplyUpdate", vo);
	}

	@Override
	public ReplyVO replyDetail(int c_num) {
		return sql.selectOne(namespace + ".replyDetail", c_num);
	}

}
package com.gym.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "com.gym.mappers.user";

//   회원가입
	@Override
	public int join(UserVO vo) throws Exception {
		return sql.insert(namespace + ".join", vo);
	}

//   id 중복 체크
	@Override
	public int idchk(String userid) throws Exception {
		return sql.selectOne(namespace + ".idchk", userid);
	}

//	로그인
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
	}
 
//	아이디 찾기
	@Override
	public UserVO findId(String username, String email) throws Exception {
		HashMap<String, String> vo = new HashMap<String, String>();
		vo.put("username", username);
		vo.put("email", email);
		return sql.selectOne(namespace +".findId", vo);
	}

//	비밀번호 찾을 때 회원 정보 찾기
	@Override
	public int findpw(String userid, String email) {
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("userid", userid);
		data.put("email", email);
		return sql.selectOne(namespace + ".findPw", data);
	}
//	비밀번호 변경
	@Override
	public void changePW(String userid, String userpw) throws Exception {
		HashMap<String, String> map =  new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		sql.update(namespace + ".changePW", map);
	}
	
}

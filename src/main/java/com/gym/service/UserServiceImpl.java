package com.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.UserDAO;
import com.gym.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO udao;
	
//  회원가입
	@Override
	public int join(UserVO vo) throws Exception {
		return udao.join(vo);
	}

//  id 중복 체크
	@Override
	public int idchk(String userid) throws Exception {
		return udao.idchk(userid);
	}

//	로그인
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return udao.login(vo);
	}

//	아이디 찾기
	@Override
	public UserVO findId(String username, String email) throws Exception {
		return udao.findId(username, email);
	}
 
//	비밀번호 찾기할때 회원정보 확인하기
	@Override
	public int findpw(String userid, String email) throws Exception {
		return udao.findpw(userid, email);
	}
	
//	비밀번호 변경
	@Override
	public void changePW(String userid, String userpw) throws Exception {
		udao.changePW(userid, userpw);
	}
}

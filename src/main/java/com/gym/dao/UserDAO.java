package com.gym.dao;

import com.gym.domain.UserVO;

public interface UserDAO {

//  회원가입
	public int join(UserVO vo) throws Exception;

//  id 중복 체크
	public int idchk(String userid) throws Exception;

//	로그인
	public UserVO login(UserVO vo) throws Exception;

//	아이디 찾기
	public UserVO findId(String username, String email) throws Exception;

//	비밀번호 찾을 때 아이디랑 이메일주소 회원정보에서 비교하기
	public int findpw(String userid, String email);
	
//	비밀번호 변경
	public void changePW(String userid, String userpw) throws Exception;
}
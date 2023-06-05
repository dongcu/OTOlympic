package com.gym.service;

import com.gym.domain.UserVO;

public interface UserService {

//  회원가입
	public int join(UserVO vo) throws Exception;

//  id 중복 체크
	public int idchk(String userid) throws Exception;

//	로그인
	public UserVO login(UserVO vo) throws Exception;

//	아이디 찾기
	public UserVO findId(String username, String email) throws Exception;

//	비밀번호 찾을 때 아이디랑 이메일 주소 확인하기
	public int findpw(String userid, String email) throws Exception;

//	비밀번호 변경
	public void changePW(String userid, String userpw) throws Exception;
}
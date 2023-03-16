package com.gym.dao;

import com.gym.domain.PreReadyVO;
import com.gym.domain.UserVO;

public interface PreReadyDAO {

	// 상품정보 가져오기
	public PreReadyVO getProduct(String proNum) throws Exception;
	
	public void upDate(String userId, Integer month) throws Exception;

	public UserVO updateloginUser(String userid);
	
}

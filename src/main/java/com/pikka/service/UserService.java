package com.pikka.service;

import com.pikka.domain.UserVO;

public interface UserService {

	public boolean signUpUser(UserVO vo);
	
	public boolean deleteUser(String userId);
	
}

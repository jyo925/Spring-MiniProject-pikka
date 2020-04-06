package com.pikka.dao;

import java.util.List;

import com.pikka.domain.AuthVO;
import com.pikka.domain.UserVO;

public interface UserDao {
	
	public String getTime();
	
	public List<UserVO> getAllid();
	
	public UserVO read(String userId);
	
	public boolean insertUser(UserVO vo);
	
	public boolean insertAuth(AuthVO vo);
	
	public boolean deleteUser(String userId);

}

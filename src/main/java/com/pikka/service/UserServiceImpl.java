package com.pikka.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pikka.dao.UserDao;
import com.pikka.domain.AuthVO;
import com.pikka.domain.UserVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	BCryptPasswordEncoder bEncoder;
	
	@Override
	public boolean signUpUser(UserVO vo) {
	
		vo.setUserPw(bEncoder.encode(vo.getUserPw()));
		
		AuthVO auth = new AuthVO();
		auth.setUserId(vo.getUserId());
		auth.setAuth("ROLE_MEMBER");
		
		return userDao.insertUser(vo) & userDao.insertAuth(auth);
	}

	@Override
	public boolean deleteUser(String userId) {
		
		return userDao.deleteUser(userId);
	}
	
	

	
}

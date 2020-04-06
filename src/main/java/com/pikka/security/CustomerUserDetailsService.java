package com.pikka.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.pikka.dao.UserDao;
import com.pikka.domain.CustomUser;
import com.pikka.domain.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomerUserDetailsService implements UserDetailsService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("load user by user name : " + username);

		UserVO vo = userDao.read(username);
		
		log.warn(vo);
		
		
		return vo == null ? null : new CustomUser(vo);
	}

}

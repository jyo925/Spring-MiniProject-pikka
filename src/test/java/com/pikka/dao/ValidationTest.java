package com.pikka.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.validation.Errors;

import com.pikka.domain.UserVO;
import com.pikka.validator.CustomValidator;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/security_context.xml")
public class ValidationTest {
	
	@Autowired
	CustomValidator c;

	public void validateTest() {
		
		UserVO user = new UserVO();
		user.setUserId("");
		user.setUserName("");
		user.setUserTel("");
		user.setUserPw("");
		
	}
	
}

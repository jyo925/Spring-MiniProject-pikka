package com.pikka.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pikka.domain.AuthVO;
import com.pikka.domain.UserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/security-context.xml")
public class UserDaoTest {

	@Autowired
	UserDao dao;
	@Autowired
	BCryptPasswordEncoder bEncoder;

	public void test2() {
		log.info(dao.getTime());
	}

	public void test() {

		for (int i = 3; i < 13; i++) {
			UserVO vo = new UserVO();

			vo.setUserId("member" + i);
			vo.setUserName("정나다" + i);
			vo.setUserPw(bEncoder.encode("1234"));
			vo.setUserTel("0101234123" + i);
			log.info(dao.insertUser(vo));

			AuthVO vo1 = new AuthVO();
			vo1.setAuth("ROLE_MEMBER");
			vo1.setUserId(vo.getUserId());

			log.info(dao.insertAuth(vo1));
		}
	}
	
	@Test
	public void deleteTest() {
		
		log.info(dao.deleteUser("member1234"));
	}
}
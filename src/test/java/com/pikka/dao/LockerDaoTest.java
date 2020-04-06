package com.pikka.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pikka.domain.AuthVO;
import com.pikka.domain.UserVO;
import com.pikka.domain.Locker;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/security-context.xml")
public class LockerDaoTest {
	
	@Autowired
	LockerDao dao;
	
	@Test
	public void testGetList() {
//		log.info(dao.getList());
		Date date = new Date();
		log.info(new SimpleDateFormat("yyyy-MM-dd").format(date));

	}
	
	
	public void testGet() {
		log.info(dao.get("2E"));
	}
	
	
	
	public void testUpdate() {
		Locker loc = new Locker();
		loc.setLockerNo("1A");
		loc.setLockerStatus(1);
		
		

	}
	
	
	

}

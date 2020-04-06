package com.pikka.dao;

import java.time.LocalDate;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LockerTicketDaoTest {

	@Autowired
	LockerTicketDao dao;

	@Test
	public void testGetList() {
		// log.info(dao.getList());
//		log.info(dao.get("jy1"));
//		log.info(dao.delete("jy1"));

//		LockerTicket locTicket = new LockerTicket();
//		locTicket.setUserId("jy4");
//		locTicket.setLockerNo("5C");
//		locTicket.setLockerUseDays(60);
//		locTicket.setLockerUsePrice(70000);
//		log.info(dao.insert(locTicket));

		/*
		 * LockerTicket locTicket = dao.get("jy1"); locTicket.setLockerUseDays(50);
		 * log.info(dao.update(locTicket));
		 */
		
		LocalDate date = LocalDate.now();
		date = date.minusDays(1);
		System.out.println(date.toString());
		

	}
}

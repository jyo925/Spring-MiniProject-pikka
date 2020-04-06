package com.pikka.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pikka.dao.LockerDao;
import com.pikka.dao.LockerTicketDao;
import com.pikka.domain.Locker;
import com.pikka.domain.LockerTicket;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class LockerServiceImpl implements LockerService {
	
	@Autowired
	private LockerDao locDao;
	@Autowired
	private LockerTicketDao locTicketDao;
	
	
	@Override
	public List<Locker> getLockerList() {
		log.info("service getLockerList()");
		List<Locker> list = locDao.getList();
		return list;
	}

	@Override
	public boolean updateLocState(Locker locker) {
		locDao.update(locker);
		return (locDao.update(locker) ==1);
	}


	@Override
	public void registerTicket(LockerTicket ticket) {
		locTicketDao.insert(ticket);
	}

	@Override
	public List<String> getEndLocker(String today) {
		List<String> list = locTicketDao.selectEndTicket(today);
		return list;
	}
	
	@Override
	public boolean checkTicket(String userId) {
		return false;
	}

	@Override
	public LockerTicket getTicket(String userId) {
		return locTicketDao.get(userId);
	}

	@Override
	public int getCountLocker() {
		
		return locDao.useListCount();
	}

}

package com.pikka.dao;

import java.util.List;

import com.pikka.domain.LockerTicket;

public interface LockerTicketDao {
	
	//모든 락커 티켓
	public List<LockerTicket> getList();
	//개별 락커 티켓
	public LockerTicket get(String userId);
	//종료된사물함 가져오기
	public List<String> selectEndTicket(String today);
	//이용권 구매시 생성
	public int insert(LockerTicket locTicket);
	

	/* ---------------쓸지말지 미정인 기능들 --------------*/
	//이용권 만료시 삭제
	public int delete(String userId);
	//이용권 변경시
	public int update(LockerTicket locTicket);

	
	

}

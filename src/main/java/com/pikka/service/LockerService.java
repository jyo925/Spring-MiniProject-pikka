package com.pikka.service;

import java.util.List;

import com.pikka.domain.Locker;
import com.pikka.domain.LockerTicket;

public interface LockerService {
	
	
	//사물함 전체 현황 가져오기
	public List<Locker> getLockerList();
	
	//종료되는 사물함 가져오기
	public List<String> getEndLocker(String today);
	
	//사물함 상태 바꾸기
	public boolean updateLocState(Locker locker);
	
	//이용권 등록하기
	public void registerTicket(LockerTicket ticket);
	
	
	
	/*----------------- 아직 사용 안된 기능들---------------------- */
	//이용권 있는지 없는지(이용권 가져오기랑 합칠수 있는지 생각해보기)
	public boolean checkTicket(String userId);
	//고객의 이용권 가져오기
	public LockerTicket getTicket(String userId);
	
	//티켓 삭제하기는 보류, 티켓 구매내역 로그가 없으므로
	
	
	
	

}

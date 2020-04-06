package com.pikka.dao;

import java.util.List;

import com.pikka.domain.Locker;

public interface LockerDao {
	
	//모든 락커 가져오기
	public List<Locker> getList();
	//개별 락커  get
	public Locker get(String lockerNo);
	//락커 정보 업데이트
	public int update(Locker locker);

}

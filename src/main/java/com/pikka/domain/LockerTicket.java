package com.pikka.domain;

import lombok.Data;

@Data
public class LockerTicket {
	
	private int lockerTicketNo; //락커티켓번호 자동생성 
	private String lockerNo; //락커번호
	private String userId; //사용자
	private int lockerUseDays; //30일,60일,90일권
	private int lockerUsePrice; //5000, 1000, 14000
	private String lockerStartDate; //사용시작일자 = 결제일 = today
	private String lockerEndDate; 

}

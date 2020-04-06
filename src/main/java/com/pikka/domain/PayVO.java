package com.pikka.domain;

import lombok.Data;

@Data
public class PayVO {
	
	private String userId;
	private String locNo;
	private int locType;
	private String price;
	private String useDays;
	private String payType;
	
	

}

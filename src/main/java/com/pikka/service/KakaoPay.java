package com.pikka.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.pikka.dao.LockerDao;
import com.pikka.dao.LockerTicketDao;
import com.pikka.domain.KakaoPayApprovalVO;
import com.pikka.domain.KakaoPayReadyVO;
import com.pikka.domain.Locker;
import com.pikka.domain.LockerTicket;
import com.pikka.domain.PayVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class KakaoPay {
	
	
	private static final String HOST = "https://kapi.kakao.com";
	private PayVO pay;
	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	public String kakaoPayReady(PayVO pay) {
		
		this.pay= pay;
		RestTemplate restTemplate = new RestTemplate();
		
		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "2c434e9ab5359a6b46286513f6e2df7a");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", pay.getUserId());
		params.add("partner_user_id", pay.getUserId());
		params.add("item_name", Integer.toString(pay.getLocType())+"일권");
		params.add("quantity", "1");
		params.add("total_amount", pay.getPrice());
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:8080/kakaoPaySuccess");
		params.add("cancel_url", "http://localhost:8080/kakaoPayCancel");
		params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
		params.add("useDays", pay.getUseDays()); //사물함 사용기간 
		params.add("locNo", pay.getLocNo()); //사물함 번호
		
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);

			log.info("" + kakaoPayReadyVO);

			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pay";
	}

	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
		
		log.info("KakaoPayInfoVO............................................");
		log.info("-----------------------------");

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "2c434e9ab5359a6b46286513f6e2df7a");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", pay.getUserId());
		params.add("partner_user_id", pay.getUserId()); //유저정보
		params.add("pg_token", pg_token);
		params.add("total_amount", pay.getPrice()); //가격
		params.add("item_name", Integer.toString(pay.getLocType())); //사물함 이용권종류 
		params.add("useDays", pay.getUseDays()); //사물함 사용기간 
		params.add("locNo", pay.getLocNo()); //사물함 번호
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			log.info("" + kakaoPayApprovalVO);

			return kakaoPayApprovalVO;

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}

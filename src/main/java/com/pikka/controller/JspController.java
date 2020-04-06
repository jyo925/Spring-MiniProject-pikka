package com.pikka.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pikka.domain.Locker;
import com.pikka.domain.LockerTicket;
import com.pikka.domain.PayVO;
import com.pikka.service.KakaoPay;
import com.pikka.service.LockerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping
@AllArgsConstructor
@Log4j
public class JspController {

	private LockerService service;
	private PayVO pay;
	private KakaoPay kakaopay;
	
	@GetMapping("/errors")
	public String defaultError() {
		return "/pikka/errors";
	}

	@RequestMapping(value = "/LockerStatus")
	public String goLockerStatus(Model model) {

		log.info("-------------LockerStatus--------------");
		// 만료된 사물함 있는지 체크하고 있으면 status변경
		LocalDate date = LocalDate.now();
		String today = date.minusDays(1).toString();
		// 사물함 만료일이 어제까지인 것들 불러와서 활성화
		List<String> endList = service.getEndLocker(today);
		Locker locker = new Locker();
		locker.setLockerStatus(0);
		for (String list : endList) {
			log.info("만료된 사물함 번호:" + list);
			locker.setLockerNo(list);
			service.updateLocState(locker);
		}
		// 사물함 List 전달 -> RestController에서 처리
		return "/pikka/LockerStatus";
	}

	@PostMapping(value = "/buyTicket")
	public String buyTicket(Model model, String locNo) {

		model.addAttribute("locNo", locNo);
		return "/pikka/buyTicket";
	}

	@RequestMapping(value = "/")
	public String main() {
		return "/pikka/main";
	}

	@GetMapping("/SignUp")
	public String signUp() {
		return "/pikka/SignUp";
	}

	@GetMapping("/myPage")
	public String nav() {
		return "/pikka/myPage";
	}

	/* --------------------카드 결제 관련 --------------------- */
	@PostMapping("/cardPay")
	public String cardPay(PayVO pays, Model model) {
		// 결제성공했으니 이용권 추가
		LockerTicket locTicket = new LockerTicket();
		locTicket.setLockerNo(pays.getLocNo());
		locTicket.setUserId(pays.getUserId());
		locTicket.setLockerUseDays(pays.getLocType());
		locTicket.setLockerUsePrice(Integer.parseInt(pays.getPrice()));
		service.registerTicket(locTicket);

		Locker locker = new Locker();
		locker.setLockerNo(pays.getLocNo());
		locker.setLockerStatus(1);
		service.updateLocState(locker);
		model.addAttribute("ticket", service.getTicket(pays.getUserId()));
		return "pikka/carPaySuccess";
	}

	/* --------------------카카오 페이 관련 --------------------- */
	@GetMapping("/kakaoPay")
	public String kakaoPayGet() {
		return "pikka/kakaoPay";
	}

	@PostMapping("/kakaoPay")
	public String kakaoPay(PayVO pays) {
		this.pay = pays;
		log.info("kakaoPay post............................................");
		pays.setUserId(pays.getUserId().trim());
		return "redirect:" + kakaopay.kakaoPayReady(pays);
	}

	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, Principal principal) {
		log.info("kakaoPaySuccess get............................................");
		log.info("kakaoPaySuccess pg_token : " + pg_token);
		model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));

		log.info(pay);
		// 결제성공했으니 이용권 추가
		LockerTicket locTicket = new LockerTicket();
		locTicket.setLockerNo(pay.getLocNo());
		locTicket.setUserId(pay.getUserId());
		locTicket.setLockerUseDays(pay.getLocType());
		locTicket.setLockerUsePrice(Integer.parseInt(pay.getPrice()));
		service.registerTicket(locTicket);

		Locker locker = new Locker();
		locker.setLockerNo(pay.getLocNo());
		locker.setLockerStatus(1);
		service.updateLocState(locker);
		model.addAttribute("ticket", service.getTicket(principal.getName()));
		return "pikka/kakaoPaySuccess";
	}

}

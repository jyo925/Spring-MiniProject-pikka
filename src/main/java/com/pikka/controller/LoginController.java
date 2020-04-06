package com.pikka.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pikka.domain.Locker;
import com.pikka.domain.UserVO;
import com.pikka.service.LockerService;
import com.pikka.service.UserService;
import com.pikka.validator.CustomValidator;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Controller
public class LoginController {
	
	private UserService userService;
	private CustomValidator customValidator;
	private LockerService lockerService;
	
	@InitBinder
	public void InitBinder(WebDataBinder dataBinder) {
		dataBinder.addValidators(customValidator);
	}
	
	
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpProcess(@Validated UserVO vo, BindingResult result) {
		log.info(vo);
		if(result.hasErrors()) return "/pikka/SignUp";
		log.info("==== 회원가입 유효성 검사 완료====");
		if(userService.signUpUser(vo)) 	return "redirect:/";
			
		return "pikka/customLogin";
	}
	
	@PostMapping("/user/modify")
	public String modifyProcess(UserVO vo) {
		log.info("===수정되는 회원 정보===");
		log.info(vo);
		return "redirect:/";
	}
	
	@PostMapping("/delete")
	public String deleteProcess(String userId) {
		log.info("삭제할 유저의 ID : " + userId);
		
		/*
		 * Cookie[] cookies = request.getCookies();
		 * 
		 * for ( Cookie cookie : cookies ) { log.info(cookie.getName());
		 * cookie.setMaxAge(0); log.info("쿠키 제거"); response.addCookie(cookie); }
		 * 
		 * 
		 * request.getSession().invalidate();
		 */
		
		lockerService.updateLocState(new Locker(lockerService.getTicket(userId).getLockerNo(),0));
		
		log.info("유저 삭제 여부 : " + userService.deleteUser(userId));
		return "redirect:/logout";
	}
	
}

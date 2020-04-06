package com.pikka.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model){
		log.info("access denied :    " + auth);
		
		model.addAttribute("msg", "access Denied");
		
	}
	
	@GetMapping("/customLogin")
	public String loginInput(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) model.addAttribute("error", "LoginError Check Your account");
		if(logout != null) model.addAttribute("logout", "LoginError Check Your account");
		
		return "pikka/customLogin";
	}
}

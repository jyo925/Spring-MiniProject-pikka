package com.pikka.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.pikka.domain.Locker;
import com.pikka.domain.LockerTicket;
import com.pikka.service.LockerService;


@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private LockerService service;
	
	//사물함 List return
	@RequestMapping(value = "/getLocker", method = RequestMethod.POST,
			produces = {MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE,
						MediaType.APPLICATION_ATOM_XML_VALUE})
	public List<Locker> getLocker(Model model) {
		return service.getLockerList();
	}
	
	
	@RequestMapping(value="/checkTicket", method = RequestMethod.POST,produces = {MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE,
			MediaType.APPLICATION_ATOM_XML_VALUE})
	public LockerTicket getTicket(Principal principal){
		
		return service.getTicket(principal.getName());
	}
}

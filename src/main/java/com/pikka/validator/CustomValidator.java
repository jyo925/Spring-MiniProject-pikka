package com.pikka.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.pikka.domain.UserVO;

public class CustomValidator implements  Validator{

	
	private String userTelRegExp = "^01(?:0|1|[6-9])[.-]?(\\d{4})[.-]?(\\d{4})$";
	private String userPwRegExp = "^(\\d{4})";
	
	
	@Override
	public boolean supports(Class clazz) {
		return UserVO.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors e) {

		ValidationUtils.rejectIfEmpty(e, "userId", "Id를 입력해주세요.");
		ValidationUtils.rejectIfEmpty(e, "userPw", "Pw를 입력해주세요.");
		ValidationUtils.rejectIfEmpty(e, "userName", "비밀번호를 입력해주세요.");
		ValidationUtils.rejectIfEmpty(e, "userTel", "전화번호를 입력해주세요.");
		
		/*
		 * UserVO user = (UserVO)target;
		 * 
		 * if(user.getUserPw().matches(userPwRegExp)){
		 * 
		 * }
		 */
		
	}
	
	
}

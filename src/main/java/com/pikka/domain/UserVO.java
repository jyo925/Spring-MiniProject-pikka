package com.pikka.domain;

import java.util.List;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.validation.annotation.Validated;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class UserVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userTel;
	private List<AuthVO> authList;
	
}

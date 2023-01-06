package com.co_nnect.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@NoArgsConstructor
@Data
@NonNull
@Getter
@AllArgsConstructor

//회원가입 시 필수작성항목을 받아오는 vo
public class UserVO {
	
	private String email;
	private String id;
	private String password;
	private String nickName;
	
	
}

package com.co_nnect.model;


import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@NoArgsConstructor
@Data
@NonNull
@Getter
@RequiredArgsConstructor

// 유저의 프로필을 설정할 때 입력하는 항목들
public class UserDetailVO {

	// 회원가입 이후 프로필 설정 시 작성항목
	// 기본적인 시스템 구현에 필요한 항목들에 @NonNull 붙여줬음
	// 회원 아이디의 경우에는 UserVO (T_MEMBER 테이블) 참조하여 가져올 것
	@NonNull private String status;
	@NonNull private String skills;
	@NonNull private String programs;
	@NonNull private String introduction;
	@NonNull private String gitUrl;
	@NonNull private String tistoryUrl;
	
	private String instaUrl;
	private String facebookUrl;
	private String twitterUrl;
	private String websiteUrl;
	
	
}

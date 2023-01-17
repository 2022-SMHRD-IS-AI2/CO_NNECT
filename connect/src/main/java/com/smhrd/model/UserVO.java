package com.smhrd.model;

import java.sql.Timestamp;

//회원가입 시 필수작성항목을 받아오는 vo
public class UserVO {
	
	private String id;
	private String pw;
	private String nick;
	private String email;
	private Timestamp joindate;
	private String type;
	
	public UserVO(String id, String pw, String nick, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.email = email;
	}
	
	public UserVO(String nick) {
		super();
		this.nick = nick;
		
	}
	
	public UserVO(String id, String pw, String nick, String email,Timestamp joindate,String type ) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.email = email;
		this.joindate = joindate;
		this.type = type;
	}

	// 두 개의 매개변수를 받아 아이디, 이메일, 비밀번호를 초기화하는 생성자메소드
	public UserVO(String idEmail, String pw) {
		if(idEmail.indexOf("@")>0) {
			this.email = idEmail;
		}else{
			this.id = idEmail;
		}
		
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getJoindate() {
		return joindate;
	}

	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
}

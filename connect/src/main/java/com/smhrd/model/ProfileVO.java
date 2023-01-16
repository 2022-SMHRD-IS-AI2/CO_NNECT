package com.smhrd.model;

public class ProfileVO {

	
	private String id;
	private String status;
	private String skills;
	private String programs;
	private String introduction;
	private String github;
	private String tistory;
	private String instagram;
	private String website;
	private String facebook;
	private String twitter;
	private String profile_pic;
	
	public ProfileVO() {
		
	}
	
	public ProfileVO(String id, String status, String skills, String programs, String introduction) {
		this.id=id;
		this.status=status;
		this.skills=skills;
		this.programs=programs;
		this.introduction=introduction;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getPrograms() {
		return programs;
	}

	public void setPrograms(String programs) {
		this.programs = programs;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getGithub() {
		return github;
	}

	public void setGithub(String github) {
		this.github = github;
	}

	public String getTistory() {
		return tistory;
	}

	public void setTistory(String tistory) {
		this.tistory = tistory;
	}

	public String getInstagram() {
		return instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getProfile_pic() {
		return profile_pic;
	}

	public void setProfile_pic(String profile_pic) {
		this.profile_pic = profile_pic;
	}
	
	
}

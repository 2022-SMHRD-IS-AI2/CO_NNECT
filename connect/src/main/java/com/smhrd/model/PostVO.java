package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Clob;
import java.sql.Timestamp;

public class PostVO {
	
	private BigDecimal seq;
	private String content;
	private String filename;
	private Timestamp regdt;
	private String id;
	private int cnt;
	private String hashtag;
	private int likes;
	private Clob codeblock;
	
	
	public PostVO(String content, String filename,String id,String hashtag,
			int like) {
		
		
		this.content = content;
		this.filename = filename;
		
		this.id = id;
		
		this.hashtag = hashtag;
		this.likes = like;
		
	}
	
	
	
	public PostVO(BigDecimal seq, String content, String filename, Timestamp regdt, String id, int cnt, String hashtag,
			int like, Clob codeblock) {
		super();
		this.seq = seq;
		this.content = content;
		this.filename = filename;
		this.regdt = regdt;
		this.id = id;
		this.cnt = cnt;
		this.hashtag = hashtag;
		this.likes = like;
		this.codeblock = codeblock;
	}
	
	public PostVO() {
		
	}
	// filename -> hashtag if문 작성
	public PostVO(String content, String filename, String id) {
		
		this.content = content;
		this.filename = filename;
		this.id = id;
	}
	
	
	



	public PostVO(String content, String filename, String id, String hashtag) {
		
		this.content = content;
		this.filename = filename;
		this.id = id;
		this.hashtag = hashtag;
	}



	public PostVO(String content, String id) {
		
		this.content = content;
		this.id = id;
	}





	public BigDecimal getSeq() {
		return seq;
	}

	public void setSeq(BigDecimal seq) {
		this.seq = seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Timestamp getRegdt() {
		return regdt;
	}

	public void setRegdt(Timestamp regdt) {
		this.regdt = regdt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public int getLike() {
		return likes;
	}

	public void setLike(int like) {
		this.likes = like;
	}

	public Clob getCodeblock() {
		return codeblock;
	}

	public void setCodeblock(Clob codeblock) {
		this.codeblock = codeblock;
	}


	
	
}

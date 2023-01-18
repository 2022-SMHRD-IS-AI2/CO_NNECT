package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class CommentVO {
	
	
	private BigDecimal cmt_seq;
	private BigDecimal b_seq;
	private String cmt_content;
	private Timestamp cmt_regdt;
	private String mem_id;
	
	public CommentVO() {
		
		
	}
	public CommentVO(BigDecimal cmt_seq, BigDecimal b_seq, String cmt_content, Timestamp cmt_regdt, String mem_id) {
		super();
		this.cmt_seq = cmt_seq;
		this.b_seq = b_seq;
		this.cmt_content = cmt_content;
		this.cmt_regdt = cmt_regdt;
		this.mem_id = mem_id;
	}

	public CommentVO(BigDecimal b_seq, String cmt_content, String mem_id) {
		
		this.b_seq = b_seq;
		this.cmt_content = cmt_content;
		this.mem_id = mem_id;
	}
	
	public BigDecimal getCmt_seq() {
		return cmt_seq;
	}
	public void setCmt_seq(BigDecimal cmt_seq) {
		this.cmt_seq = cmt_seq;
	}
	public BigDecimal getB_seq() {
		return b_seq;
	}
	public void setB_seq(BigDecimal b_seq) {
		this.b_seq = b_seq;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public Timestamp getCmt_regdt() {
		return cmt_regdt;
	}
	public void setCmt_regdt(Timestamp cmt_regdt) {
		this.cmt_regdt = cmt_regdt;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
}

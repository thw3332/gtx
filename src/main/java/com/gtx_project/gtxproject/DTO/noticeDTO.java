package com.gtx_project.gtxproject.DTO;

public class noticeDTO {

	private int nt_num; // 번호
	private String nt_title; // 제목
	private String nt_content; // 내용
	private String nt_date; // 등록일
	private String id; // 작성자(관리자)
	
	public int getNt_num() {
		return nt_num;
	}
	public void setNt_num(int nt_num) {
		this.nt_num = nt_num;
	}
	public String getNt_title() {
		return nt_title;
	}
	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}
	public String getNt_content() {
		return nt_content;
	}
	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}
	public String getNt_date() {
		return nt_date;
	}
	public void setNt_date(String nt_date) {
		this.nt_date = nt_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}

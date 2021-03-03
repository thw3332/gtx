package com.gtx_project.gtxproject.DTO;

public class ticketDTO {

	private int rt_num; // 번호
	private String rt_code; // 운행코드
	private String st_scode; // 출발역코드
	private String st_ecode; // 도착역코드
	private String st_sname; // 출발역명
	private String st_ename; // 도착역명
	private String rt_stime; // 출발시간
	private String rt_etime; // 도착시간
	private String rt_leadtime; // 소요시간
	private String tr_code; // 차량코드
	
	public int getRt_num() {
		return rt_num;
	}
	public void setRt_num(int rt_num) {
		this.rt_num = rt_num;
	}
	public String getRt_code() {
		return rt_code;
	}
	public void setRt_code(String rt_code) {
		this.rt_code = rt_code;
	}
	public String getSt_scode() {
		return st_scode;
	}
	public void setSt_scode(String st_scode) {
		this.st_scode = st_scode;
	}
	public String getSt_ecode() {
		return st_ecode;
	}
	public void setSt_ecode(String st_ecode) {
		this.st_ecode = st_ecode;
	}
	public String getSt_sname() {
		return st_sname;
	}
	public void setSt_sname(String st_sname) {
		this.st_sname = st_sname;
	}
	public String getSt_ename() {
		return st_ename;
	}
	public void setSt_ename(String st_ename) {
		this.st_ename = st_ename;
	}
	public String getRt_stime() {
		return rt_stime;
	}
	public void setRt_stime(String rt_stime) {
		this.rt_stime = rt_stime;
	}
	public String getRt_etime() {
		return rt_etime;
	}
	public void setRt_etime(String rt_etime) {
		this.rt_etime = rt_etime;
	}
	public String getRt_leadtime() {
		return rt_leadtime;
	}
	public void setRt_leadtime(String rt_leadtime) {
		this.rt_leadtime = rt_leadtime;
	}
	public String getTr_code() {
		return tr_code;
	}
	public void setTr_code(String tr_code) {
		this.tr_code = tr_code;
	}
	
	
}

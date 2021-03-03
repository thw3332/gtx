package com.gtx_project.gtxproject.DTO;

public class reserveDTO {
	
	private String rs_code; //예약번호
	private String rt_code; //운행코드
	private String tr_code; //차량코드
	private String st_scode; //출발역
	private String st_ecode; //도착역
	private String rs_date; //예약일자
	private String rs_startdate; //출발일자
	private String tr_areano; //예약칸(호차)
	private String tr_room; //예약객실
	private String rs_seat; //예약좌석
	private String rs_passenger; //승객구분
	private int rs_count; //인원수
	private int rs_totalprice; //금액
	private String id; //아이디
	private String rt_stime; //출발시간
	private String rt_etime; //도착시간
	private String pr_childprice; //어린이가격
	private String pr_adultprice; //성인가격
	private String rs_refundyn; // 환불여부
	private int rs_refundprice; //환불가격
	
	public String getRs_code() {
		return rs_code;
	}
	public void setRs_code(String rs_code) {
		this.rs_code = rs_code;
	}
	public String getRt_code() {
		return rt_code;
	}
	public void setRt_code(String rt_code) {
		this.rt_code = rt_code;
	}
	public String getTr_code() {
		return tr_code;
	}
	public void setTr_code(String tr_code) {
		this.tr_code = tr_code;
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
	public String getRs_date() {
		return rs_date;
	}
	public void setRs_date(String rs_date) {
		this.rs_date = rs_date;
	}
	public String getRs_startdate() {
		return rs_startdate;
	}
	public void setRs_startdate(String rs_startdate) {
		this.rs_startdate = rs_startdate;
	}
	public String getTr_areano() {
		return tr_areano;
	}
	public void setTr_areano(String tr_areano) {
		this.tr_areano = tr_areano;
	}
	public String getTr_room() {
		return tr_room;
	}
	public void setTr_room(String tr_room) {
		this.tr_room = tr_room;
	}
	public String getRs_seat() {
		return rs_seat;
	}
	public void setRs_seat(String rs_seat) {
		this.rs_seat = rs_seat;
	}
	public String getRs_passenger() {
		return rs_passenger;
	}
	public void setRs_passenger(String rs_passenger) {
		this.rs_passenger = rs_passenger;
	}
	public int getRs_count() {
		return rs_count;
	}
	public void setRs_count(int rs_count) {
		this.rs_count = rs_count;
	}
	public int getRs_totalprice() {
		return rs_totalprice;
	}
	public void setRs_totalprice(int rs_totalprice) {
		this.rs_totalprice = rs_totalprice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getPr_childprice() {
		return pr_childprice;
	}
	public void setPr_childprice(String pr_childprice) {
		this.pr_childprice = pr_childprice;
	}
	public String getPr_adultprice() {
		return pr_adultprice;
	}
	public void setPr_adultprice(String pr_adultprice) {
		this.pr_adultprice = pr_adultprice;
	}
	public String getRs_refundyn() {
		return rs_refundyn;
	}
	public void setRs_refundyn(String rs_refundyn) {
		this.rs_refundyn = rs_refundyn;
	}
	public int getRs_refundprice() {
		return rs_refundprice;
	}
	public void setRs_refundprice(int rs_refundprice) {
		this.rs_refundprice = rs_refundprice;
	}
	
	
}

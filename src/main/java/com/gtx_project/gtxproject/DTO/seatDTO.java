package com.gtx_project.gtxproject.DTO;

public class seatDTO {

	private String rs_code; //예약번호
	private String rt_code; //운행코드
	private String tr_code; //차량코드
	private String tr_areano; //예약칸(호차)
	private String tr_room; //예약객실
	private String rs_seat; //예약좌석
	private int tr_seat; // 잔여좌석수
	private String buy_code; //구매번호
	private String buy_areano; //구매칸(호차)
	private String buy_room; //구매객실
	private String buy_seat; //구매좌석
	
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
	public int getTr_seat() {
		return tr_seat;
	}
	public void setTr_seat(int tr_seat) {
		this.tr_seat = tr_seat;
	}
	public String getBuy_code() {
		return buy_code;
	}
	public void setBuy_code(String buy_code) {
		this.buy_code = buy_code;
	}
	public String getBuy_areano() {
		return buy_areano;
	}
	public void setBuy_areano(String buy_areano) {
		this.buy_areano = buy_areano;
	}
	public String getBuy_room() {
		return buy_room;
	}
	public void setBuy_room(String buy_room) {
		this.buy_room = buy_room;
	}
	public String getBuy_seat() {
		return buy_seat;
	}
	public void setBuy_seat(String buy_seat) {
		this.buy_seat = buy_seat;
	}
	
	
}

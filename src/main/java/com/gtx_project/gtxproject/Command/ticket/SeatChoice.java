package com.gtx_project.gtxproject.Command.ticket;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.ticketDAO;

public class SeatChoice implements TicketInterface {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ticketDAO tdao = new ticketDAO();
		
		String trcode = request.getParameter("tr_code"); // 열차코드
		String st_scode = request.getParameter("st_scode"); // 출발역
		String st_ecode = request.getParameter("st_ecode"); // 도착역
		String startdate = request.getParameter("start_date"); // 출발일자
		String adult = request.getParameter("adult"); // 어른 인원 수(section)
		String child = request.getParameter("child"); // 어린이 인원 수(section)
		int person = 0;
		
		if(adult != null && child != null) {
			person = Integer.parseInt(adult) + Integer.parseInt(child);
		}
		String adult_person = request.getParameter("adult_person"); // 어른 인원 수
		String child_person = request.getParameter("child_person"); // 어린이 인원 수
		
		if(adult_person != null && child_person != null) {
			person = Integer.parseInt(adult_person) + Integer.parseInt(child_person);
		}
		int ho = Integer.parseInt(request.getParameter("hocha")); // 열차 칸
		String hocha = ""; // 호차
		
		if(ho == 3) {
			hocha = "3호차";
		}else if(ho == 1 || ho == 0){
			hocha = "1호차";
		}else if(ho == 2){
			hocha = "2호차";
		}else if(ho == 4){
			hocha = "4호차";
		}else if(ho == 5){
			hocha = "5호차";
		}
		
		String start_name = tdao.getStartStation(st_scode); // 출발 역명
		String end_name = tdao.getEndStation(st_ecode); // 도착 역명
		ArrayList<String> sdto1 = tdao.getTrainReserveSeat(trcode, st_scode, st_ecode, startdate, hocha);
		ArrayList<String> sdto2 = tdao.getTrainBuySeat(trcode, st_scode, st_ecode, startdate, hocha);
		ArrayList<String> resultset = new ArrayList<String>();
		
		for(String str : sdto1) {
			resultset.add(str);
		}
		
		for(String str : sdto2) {
			resultset.add(str);
		}
		
		model.addAttribute("trcode", trcode);
		model.addAttribute("st_scode", st_scode);
		model.addAttribute("st_ecode", st_ecode);
		model.addAttribute("startdate", startdate);
		model.addAttribute("adult", adult); // 어른 인원 수(section)
		model.addAttribute("child", child); // 어린이 인원 수(section)
		model.addAttribute("adult_person", adult_person); // 어른 인원 수
		model.addAttribute("child_person", child_person); // 어린이 인원 수
		model.addAttribute("person", person);
		model.addAttribute("ho", ho);
		model.addAttribute("start_name", start_name);
		model.addAttribute("end_name", end_name);
		model.addAttribute("resultset", resultset);
		
	}

}

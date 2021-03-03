package com.gtx_project.gtxproject.Command.ticket;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.ticketDAO;
import com.gtx_project.gtxproject.DTO.ticketDTO;

public class TicketSelect implements TicketInterface {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ArrayList<ticketDTO> tdto = new ArrayList<>();
		ticketDAO tdao = new ticketDAO();
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdf.parse(request.getParameter("start_date"));
			
			String startstation = request.getParameter("start_station"); // 출발역
			String endstation = request.getParameter("end_station"); // 도착역
			String startdate = sdf.format(date); // 출발일자
			String starttime = request.getParameter("start_time"); // 출발시간
			int time = Integer.parseInt(starttime);
			
			if(time < 10) {
				starttime = "0" + starttime;
			}
			
			String adult = request.getParameter("adult"); // 어른 인원 수(section)
			String child = request.getParameter("child"); // 어린이 인원 수(section)
			String adult_person = request.getParameter("adult_person"); // 어른 인원 수
			String child_person = request.getParameter("child_person"); // 어린이 인원 수
			
			String start_name = tdao.getStartStation(startstation); // 출발 역명
			String end_name = tdao.getEndStation(endstation); // 도착 역명
			tdto = tdao.getAllTicket(startstation, endstation, starttime); // 승차권 조회 리스트
			
			model.addAttribute("startstation", startstation); // 출발역
			model.addAttribute("endstation", endstation); // 도착역
			model.addAttribute("startdate", startdate); // 출발일자
			model.addAttribute("starttime", starttime); // 출발시간
			model.addAttribute("adult", adult); // 어른 인원 수(section)
			model.addAttribute("child", child); // 어린이 인원 수(section)
			model.addAttribute("adult_person", adult_person); // 어른 인원 수
			model.addAttribute("child_person", child_person); // 어린이 인원 수
			model.addAttribute("tdto", tdto); // 승차권 조회 리스트
			model.addAttribute("start_name", start_name); // 출발 역명
			model.addAttribute("end_name", end_name); // 도착 역명
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

}

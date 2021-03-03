package com.gtx_project.gtxproject.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gtx_project.gtxproject.Command.ticket.SeatChoice;
import com.gtx_project.gtxproject.Command.ticket.TicketInterface;
import com.gtx_project.gtxproject.Command.ticket.TicketSelect;
import com.gtx_project.gtxproject.DAO.ticketDAO;
import com.gtx_project.gtxproject.DTO.seatDTO;

@Controller
public class TicketController {

	@Autowired
	ticketDAO tdao;
	
	private TicketInterface command;
	
	@RequestMapping(value="ticketCheck", method={RequestMethod.GET, RequestMethod.POST})
	public String openTicketCheck(Model model) {
		model.addAttribute("section", "ticket/TicketCheck.jsp"); // 승차권 조회 화면
		return "Index";
	}
	
	@RequestMapping(value="ticketCheckDate", method={RequestMethod.GET, RequestMethod.POST})
	public String openTicketCheckDate(Model model) {
		model.addAttribute("section", "ticket/TicketCheck.jsp"); // 승차권 조회 화면
		return "Index";
	}
	
	@RequestMapping(value="ticketCheckInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String openTicketCheckInfo(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		
		command = new TicketSelect(); // 승차권 조회
		command.execute(model);
		
		model.addAttribute("section", "ticket/TicketCheck.jsp"); // 승차권 조회 화면
		return "Index";
	}
	
	@RequestMapping(value="ticketCheckList", method={RequestMethod.GET, RequestMethod.POST})
	public String openTicketCheckList(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		
		command = new TicketSelect(); // 승차권 조회
		command.execute(model);
		
		model.addAttribute("section", "ticket/TicketCheck.jsp"); // 승차권 조회 화면
		return "Index";
	}
	
	@RequestMapping(value="seatChoice", method={RequestMethod.GET, RequestMethod.POST})
	public String openSeatChoice(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		
		command = new SeatChoice(); // 좌석 조회 및 선택
		command.execute(model);
				
		model.addAttribute("section", "ticket/SeatChoice.jsp"); // 좌석 조회 및 선택 화면
		return "Index";
	}
	
	@RequestMapping(value="seatReserve", method={RequestMethod.GET, RequestMethod.POST})
	public String openSeatReserve(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		
		String trcode = request.getParameter("tr_code"); // 열차코드
		String st_scode = request.getParameter("st_scode"); // 출발역
		String st_ecode = request.getParameter("st_ecode"); // 도착역
		String startdate = request.getParameter("start_date"); // 출발일자
		String adult = request.getParameter("adult"); // 어른 인원 수(section)
		String child = request.getParameter("child"); // 어린이 인원 수(section)
		String adult_person = request.getParameter("adult_person"); // 어른 인원 수
		String child_person = request.getParameter("child_person"); // 어린이 인원 수
		String ahm = "어른"; // 어른
		String chm = "어린이"; // 어린이
		int person = 0; // 총 인원수
		int adultprice = 0; // 어른 금액
		int childprice = 0; // 어린이 금액
		String route = tdao.getRoute(trcode, st_scode, st_ecode); // 경로번호
		int ho = Integer.parseInt(request.getParameter("hocha")); // 열차 칸
		String hocha = ""; // 호차
		String room = ""; // 객실
		String seat1 = request.getParameter("seat1");
		String seat2 = request.getParameter("seat2");
		String seat3 = request.getParameter("seat3");
		String seat4 = request.getParameter("seat4");
		String seat5 = request.getParameter("seat5");
		String seat6 = request.getParameter("seat6");
		String seat7 = request.getParameter("seat7");
		String seat8 = request.getParameter("seat8");
		String seat9 = request.getParameter("seat9");
		
		if(ho == 3) {
			hocha = "3호차";
			room = "특실";
		}else if(ho == 1 || ho == 0){
			hocha = "1호차";
			room = "일반";
		}else if(ho == 2){
			hocha = "2호차";
			room = "일반";
		}else if(ho == 4){
			hocha = "4호차";
			room = "일반";
		}else if(ho == 5){
			hocha = "5호차";
			room = "일반";
		}
		int aprice = tdao.getAdultPrice(st_scode, st_ecode, room); // DB 어른 금액
		int cprice = tdao.getChildPrice(st_scode, st_ecode, room); // DB 어린이 금액
		
		if(adult != "" && child != "") {
			System.out.println("Integer.parseInt(adult) : "+adult);
			if(Integer.parseInt(adult) > 0) {
				model.addAttribute("ahm", ahm);
				System.out.println("ahm : "+ahm);
				System.out.println("aprice : "+aprice);
				adultprice = aprice * Integer.parseInt(adult);
			}
			System.out.println("Integer.parseInt(child_person)"+Integer.parseInt(child_person));
			if(Integer.parseInt(child_person) > 0) {
				model.addAttribute("chm", chm);
				System.out.println("chm : "+chm);
				System.out.println("cprice : "+cprice);
				childprice = cprice * Integer.parseInt(child);
			}
			person = Integer.parseInt(adult) + Integer.parseInt(child);
			
			if(person != 0) {
				model.addAttribute("person", person);
			}
		}
		
		if(adult_person != "" && child_person != "") {
			System.out.println("Integer.parseInt(adult_person) : "+adult_person);
			System.out.println("Integer.parseInt(adult_person) : "+Integer.parseInt(adult_person));
			if(Integer.parseInt(adult_person) > 0) {
				model.addAttribute("ahm", ahm);
				System.out.println("ahm : "+ahm);
				System.out.println("aprice : "+aprice);
				adultprice = aprice * Integer.parseInt(adult_person);
			}
			if(Integer.parseInt(child_person) > 0) {
				model.addAttribute("chm", chm);
				System.out.println("chm : "+chm);
				System.out.println("cprice : "+cprice);
				childprice = cprice * Integer.parseInt(child_person);
			}
			person = Integer.parseInt(adult_person) + Integer.parseInt(child_person);
			
			if(person != 0) {
				model.addAttribute("person", person);
			}
		}
		String rs_code = tdao.getLastNumber(); // 예약 및 구매완료 중 마지막 번호
		
		System.out.println("trcode : "+trcode);
		System.out.println("st_scode : "+st_scode);
		System.out.println("st_ecode : "+st_ecode);
		System.out.println("startdate : "+startdate);
		System.out.println("person : "+person);
		System.out.println("rs_code : "+rs_code);
		System.out.println("adult : "+adult);
		System.out.println("child : "+child);
		System.out.println("adult_person : "+adult_person);
		System.out.println("child_person : "+child_person);
		System.out.println("adultprice : "+adultprice);
		System.out.println("childprice : "+childprice);
		System.out.println("route : "+route);
		System.out.println("hocha : "+hocha);
		System.out.println("room : "+room);
		System.out.println("seat1 : "+seat1);
		System.out.println("seat2 : "+seat2);
		System.out.println("seat3 : "+seat3);
		System.out.println("seat4 : "+seat4);
		System.out.println("seat5 : "+seat5);
		System.out.println("seat6 : "+seat6);
		System.out.println("seat7 : "+seat7);
		System.out.println("seat8 : "+seat8);
		System.out.println("seat9 : "+seat9);
		
		
		
		//command = new SeatChoice(); // 좌석 조회 및 선택
		//command.execute(model);
				
		model.addAttribute("section", "ticket/IssueCancel.jsp"); // 좌석 조회 및 선택 화면
		return "Index";
	}
	
}

package com.gtx_project.gtxproject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InfoController {
	
	// 회원서비스 - 회원제도소개 맵핑
	@RequestMapping(value="memberservice", method={RequestMethod.GET, RequestMethod.POST})
	public String memberservice(Model model) {
		model.addAttribute("section", "member/JoinInfo.jsp");
		return "Index";
	}
			
	// 고객안내 - 유실물안내 맵핑
	@RequestMapping(value="lostInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String lostinfo(Model model) {
		model.addAttribute("section", "LostInfo.jsp");
		return "Index";
	}
	
	// 이용안내 - 운행구간 맵핑
	@RequestMapping(value="routeArea", method={RequestMethod.GET, RequestMethod.POST})
	public String infoRouteArea(Model model) {
		model.addAttribute("section", "info/RouteArea.jsp");
		return "Index";
	}
	
	// 이용안내 - 정차역이용안내 맵핑
	@RequestMapping(value="station", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStation(Model model) {
		model.addAttribute("section", "info/Station.jsp");
		return "Index";
	}
	
	// 이용안내 - 승차권이용안내 - 열차 운임 및 시간표 맵핑
		@RequestMapping(value="trainSchedule", method={RequestMethod.GET, RequestMethod.POST})
		public String trainSchedule(Model model) {
			model.addAttribute("section", "info/Schedule.jsp");
			return "Index";
	}
	
	// 이용안내 - 승차권이용안내 - 열차지연/운행중지 맵핑
		@RequestMapping(value="delayInfo", method={RequestMethod.GET, RequestMethod.POST})
		public String delayInfo(Model model) {
			model.addAttribute("section", "info/Delay.jsp");
			return "Index";
	}
	
	// 이용안내 - 승차권이용안내 맵핑
	@RequestMapping(value="ticket", method={RequestMethod.GET, RequestMethod.POST})
	public String infoTicket(Model model) {
		model.addAttribute("section", "info/Ticket.jsp");
		return "Index";
	}
	
	// 이용안내 - 열차서비스이용안내 맵핑
	@RequestMapping(value="train", method={RequestMethod.GET, RequestMethod.POST})
	public String infoTrain(Model model) {
		model.addAttribute("section", "info/Train.jsp");
		return "Index";
	}
	
	// 이용안내 - 열차서비스이용안내 맵핑
		@RequestMapping(value="institution", method={RequestMethod.GET, RequestMethod.POST})
		public String infoUserInstitution(Model model) {
			model.addAttribute("section", "info/UserInstitution.jsp");
			return "Index";
		}
}

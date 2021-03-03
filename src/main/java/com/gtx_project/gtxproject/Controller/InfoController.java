package com.gtx_project.gtxproject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InfoController {
	
	// ȸ������ - ȸ�������Ұ� ����
	@RequestMapping(value="memberservice", method={RequestMethod.GET, RequestMethod.POST})
	public String memberservice(Model model) {
		model.addAttribute("section", "member/JoinInfo.jsp");
		return "Index";
	}
			
	// ���ȳ� - ���ǹ��ȳ� ����
	@RequestMapping(value="lostInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String lostinfo(Model model) {
		model.addAttribute("section", "LostInfo.jsp");
		return "Index";
	}
	
	// �̿�ȳ� - ���౸�� ����
	@RequestMapping(value="routeArea", method={RequestMethod.GET, RequestMethod.POST})
	public String infoRouteArea(Model model) {
		model.addAttribute("section", "info/RouteArea.jsp");
		return "Index";
	}
	
	// �̿�ȳ� - �������̿�ȳ� ����
	@RequestMapping(value="station", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStation(Model model) {
		model.addAttribute("section", "info/Station.jsp");
		return "Index";
	}
	
	// �̿�ȳ� - �������̿�ȳ� - ���� ���� �� �ð�ǥ ����
		@RequestMapping(value="trainSchedule", method={RequestMethod.GET, RequestMethod.POST})
		public String trainSchedule(Model model) {
			model.addAttribute("section", "info/Schedule.jsp");
			return "Index";
	}
	
	// �̿�ȳ� - �������̿�ȳ� - ��������/�������� ����
		@RequestMapping(value="delayInfo", method={RequestMethod.GET, RequestMethod.POST})
		public String delayInfo(Model model) {
			model.addAttribute("section", "info/Delay.jsp");
			return "Index";
	}
	
	// �̿�ȳ� - �������̿�ȳ� ����
	@RequestMapping(value="ticket", method={RequestMethod.GET, RequestMethod.POST})
	public String infoTicket(Model model) {
		model.addAttribute("section", "info/Ticket.jsp");
		return "Index";
	}
	
	// �̿�ȳ� - ���������̿�ȳ� ����
	@RequestMapping(value="train", method={RequestMethod.GET, RequestMethod.POST})
	public String infoTrain(Model model) {
		model.addAttribute("section", "info/Train.jsp");
		return "Index";
	}
	
	// �̿�ȳ� - ���������̿�ȳ� ����
		@RequestMapping(value="institution", method={RequestMethod.GET, RequestMethod.POST})
		public String infoUserInstitution(Model model) {
			model.addAttribute("section", "info/UserInstitution.jsp");
			return "Index";
		}
}

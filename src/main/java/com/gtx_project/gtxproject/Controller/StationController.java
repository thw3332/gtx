package com.gtx_project.gtxproject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StationController {

	// �λ꿪�� ����
	@RequestMapping(value="stationBusan", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationBusan(Model model) {
		model.addAttribute("section", "info/StationBusan.jsp");
		return "Index";
	}
	// õ�Ⱦƻ꿪�� ����
	@RequestMapping(value="stationCheonan", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationCheonan(Model model) {
		model.addAttribute("section", "info/StationCheonan.jsp");
		return "Index";
	}
	// �������� ����
	@RequestMapping(value="stationDaejeon", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationDaejeon(Model model) {
		model.addAttribute("section", "info/StationDaejeon.jsp");
		return "Index";
	}
	// ���뱸���� ����
	@RequestMapping(value="stationDongdaegu", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationDongdaegu(Model model) {
		model.addAttribute("section", "info/StationDongdaegu.jsp");
		return "Index";
	}
	// ��ź���� ����
	@RequestMapping(value="stationDongtan", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationDongtan(Model model) {
		model.addAttribute("section", "info/StationDongtan.jsp");
		return "Index";
	}
	// �������� ����
	@RequestMapping(value="stationJije", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationJije(Model model) {
		model.addAttribute("section", "info/StationJije.jsp");
		return "Index";
	}
	// ��õ(����)���� ����
	@RequestMapping(value="stationKimcheon", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationKimcheon(Model model) {
		model.addAttribute("section", "info/StationKimcheon.jsp");
		return "Index";
	}
	// ���ۿ��� ����
	@RequestMapping(value="stationOhsong", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationOhsong(Model model) {
		model.addAttribute("section", "info/StationOhsong.jsp");
		return "Index";
	}
	// �Ű��ֿ��� ����
	@RequestMapping(value="stationSinkyungju", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationSinkyungju(Model model) {
		model.addAttribute("section", "info/StationSinkyungju.jsp");
		return "Index";
	}
	// �������� ����
	@RequestMapping(value="stationSuseo", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationSuseo(Model model) {
		model.addAttribute("section", "info/StationSuseo.jsp");
		return "Index";
	}
	// ��꿪�� ����
	@RequestMapping(value="stationUlsan", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationUlsan(Model model) {
		model.addAttribute("section", "info/StationUlsan.jsp");
		return "Index";
	}
}

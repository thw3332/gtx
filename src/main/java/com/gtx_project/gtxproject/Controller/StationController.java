package com.gtx_project.gtxproject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StationController {

	// 부산역상세 맵핑
	@RequestMapping(value="stationBusan", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationBusan(Model model) {
		model.addAttribute("section", "info/StationBusan.jsp");
		return "Index";
	}
	// 천안아산역상세 맵핑
	@RequestMapping(value="stationCheonan", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationCheonan(Model model) {
		model.addAttribute("section", "info/StationCheonan.jsp");
		return "Index";
	}
	// 대전역상세 맵핑
	@RequestMapping(value="stationDaejeon", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationDaejeon(Model model) {
		model.addAttribute("section", "info/StationDaejeon.jsp");
		return "Index";
	}
	// 동대구역상세 맵핑
	@RequestMapping(value="stationDongdaegu", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationDongdaegu(Model model) {
		model.addAttribute("section", "info/StationDongdaegu.jsp");
		return "Index";
	}
	// 동탄역상세 맵핑
	@RequestMapping(value="stationDongtan", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationDongtan(Model model) {
		model.addAttribute("section", "info/StationDongtan.jsp");
		return "Index";
	}
	// 지제역상세 맵핑
	@RequestMapping(value="stationJije", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationJije(Model model) {
		model.addAttribute("section", "info/StationJije.jsp");
		return "Index";
	}
	// 김천(구미)역상세 맵핑
	@RequestMapping(value="stationKimcheon", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationKimcheon(Model model) {
		model.addAttribute("section", "info/StationKimcheon.jsp");
		return "Index";
	}
	// 오송역상세 맵핑
	@RequestMapping(value="stationOhsong", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationOhsong(Model model) {
		model.addAttribute("section", "info/StationOhsong.jsp");
		return "Index";
	}
	// 신경주역상세 맵핑
	@RequestMapping(value="stationSinkyungju", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationSinkyungju(Model model) {
		model.addAttribute("section", "info/StationSinkyungju.jsp");
		return "Index";
	}
	// 수서역상세 맵핑
	@RequestMapping(value="stationSuseo", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationSuseo(Model model) {
		model.addAttribute("section", "info/StationSuseo.jsp");
		return "Index";
	}
	// 울산역상세 맵핑
	@RequestMapping(value="stationUlsan", method={RequestMethod.GET, RequestMethod.POST})
	public String infoStationUlsan(Model model) {
		model.addAttribute("section", "info/StationUlsan.jsp");
		return "Index";
	}
}

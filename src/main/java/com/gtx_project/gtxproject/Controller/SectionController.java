package com.gtx_project.gtxproject.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gtx_project.gtxproject.DAO.ticketDAO;
import com.gtx_project.gtxproject.DTO.noticeDTO;

@Controller
public class SectionController {

	@Autowired
	ticketDAO tdao;
	
	/*@RequestMapping(value="/index")
	public String goIndex() {
		return "Index";
	}*/
	
	@RequestMapping(value="section", method={RequestMethod.GET, RequestMethod.POST})
	public String openSection(Model model, ArrayList<noticeDTO> ndto) {
		ndto = tdao.getAllNotice(); // 공지사항 목록
		model.addAttribute("ndto", ndto);
		model.addAttribute("section", "Section.jsp"); // 메인 섹션 화면
		return "Index";
	}
	
	@RequestMapping(value="calendar", method={RequestMethod.GET, RequestMethod.POST})
	public String openCalendar() {
		return "Calendar"; // 달력 화면
	}
	
}

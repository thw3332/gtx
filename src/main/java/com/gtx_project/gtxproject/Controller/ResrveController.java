package com.gtx_project.gtxproject.Controller;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.gtx_project.gtxproject.Command.reserve.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.gtx_project.gtxproject.DAO.reserveDAO;
import com.gtx_project.gtxproject.DTO.reserveDTO;

@Controller
public class ResrveController {
	
	private ReserveInterface command;
	
	@Autowired
	reserveDAO dao;
	
	@RequestMapping(value="issueList", method={RequestMethod.GET, RequestMethod.POST})
	// 예약한 승차권 내역 나오는 부분 (발권/취소)
	public String issueList(Model model, HttpServletRequest request, HttpSession session, ArrayList<reserveDTO> rsdto) {			
		
		String id=(String)session.getAttribute("id");// login정보 세션
		//-----------------------------------------------------------------------------// 이부분부터 request받아와서 넣어야함
		String rs_startdate = "2020-11-05"; 
		String rt_code = "route-02";
		String tr_code ="gtx-302";
		//-----------------------------------------------------------------------------// 이부분까지 request받아와서 넣어야함
		rsdto = dao.selectListid(id, rs_startdate, rt_code, tr_code); // login한 id의 선택한 예약 하나만 조회
		int count = dao.reserveCount(); // 예약테이블 개수 조회 메서드
		String name = dao.membername(id); // id정보로 이름 조회
		
		//Date date= new Date(dao.nowtime(rt_code, tr_code, rs_startdate)); // DAO에서 예약날짜,시간정보 받아옴
		/*String st = dao.nowtime(rt_code, tr_code, rs_startdate);
		SimpleDateFormat time = new SimpleDateFormat("HH:mm"); // 날짜,시간 형식 변환 
		Calendar cal = Calendar.getInstance(); // 시간정보 세팅하기 위해 calender사용
		//cal.setTime(date); // 받아온 날짜,시간 정보 set시킴
		cal.add(Calendar.MINUTE, 10); // 10분 후 시간나타내기위해 add
		String nowtime = time.format(cal.getTime()); // 10분 후 시간을 simpledate 형식으로 받아와서 변수에 담음*/	
	
		String nowtime = "";
		try {
			String dateString = dao.nowtime(rt_code, tr_code, rs_startdate);
			System.out.println(dateString);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = sdf.parse(dateString);
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.MINUTE, 10);
			SimpleDateFormat odf = new SimpleDateFormat("HH:mm");
			nowtime = odf.format(cal.getTime());
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("rsdto", rsdto);
		model.addAttribute("count",count);
		model.addAttribute("name",name);
		model.addAttribute("nowtime",nowtime);
		model.addAttribute("section", "ticket/IssueCancel.jsp");
		return "Index";
	}
	
	@RequestMapping(value="reserveChange", method={RequestMethod.GET, RequestMethod.POST})
	// 예약변경할 승차권 내역 나오는 부분 (예약변경할 예약 선택)
	public String reservechange(Model model, HttpServletRequest request, HttpSession session, ArrayList<reserveDTO> rsdto) {	
		String id=(String)session.getAttribute("id");// login정보 세션
		//-----------------------------------------------------------------------------// 이부분부터 request받아와서 넣어야함
		String rs_startdate = "2020-11-05"; 
		String rt_code = "route-02";
		String tr_code ="gtx-302";
		//-----------------------------------------------------------------------------// 이부분까지 request받아와서 넣어야함
		rsdto = dao.selectListid(id, rs_startdate, rt_code, tr_code);  // login한 id의 선택한 예약 하나만 조회
		int count = dao.reserveCount(); // 예약테이블 개수 조회 메서드
		String name = dao.membername(id); // id정보로 이름 조회
		model.addAttribute("rsdto", rsdto);
		model.addAttribute("count",count);
		model.addAttribute("name",name);
		model.addAttribute("section", "ticket/ReserveChange.jsp");
		
		return "Index";
	}
	
	@RequestMapping(value="reserveChangeForm", method={RequestMethod.GET, RequestMethod.POST})
	// 예약변경할 승차권 내역 나오는 부분 (예약변경 직접 수정하는 폼)
	public String reserveChangeForm(Model model, HttpServletRequest request, ArrayList<reserveDTO> rsdto,ArrayList<reserveDTO> rsdto2, HttpSession session) {			
		String id = (String)session.getAttribute("id");
		String rs_startdate = request.getParameter("rs_startdate");
		String rt_code =  request.getParameter("rt_code");
		String tr_code = request.getParameter("tr_code");

		rsdto = dao.selectListid(id, rs_startdate, rt_code, tr_code); // login한 id의 선택한 예약 하나만 조회(인원수합산)
		rsdto2 = dao.selectListid2(id, rs_startdate, rt_code, tr_code); // login한 id의 선택한 예약 하나만 조회(인원수분리)
		int count = dao.reserveCount(); // 예약테이블 개수 조회 메서드
		model.addAttribute("rsdto", rsdto);
		model.addAttribute("rsdto2", rsdto2);
		model.addAttribute("count",count);
		model.addAttribute("section", "ticket/ReserveChangeForm.jsp");
		
		return "Index";
	}
	
	@RequestMapping(value="reserveUpadateForm", method= {RequestMethod.GET, RequestMethod.POST})
	// 예약변경시 승객유형, 인원수 업데이트되어 페이지에 출력 
	public String reserveUpadateForm(HttpSession session, HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		command =new ReserveUpdate();
		command.execute(model);
		model.addAttribute("section", "ticket/ReserveUpdate.jsp");
		return "Index";
	}
	
	// 예약 삭제 맵핑
	@RequestMapping(value="reserveDelete", method= {RequestMethod.GET, RequestMethod.POST})
	public String reserveDelete(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new ReserveDelete();
		command.execute(model);
		return "redirect:issueList";
	}
}

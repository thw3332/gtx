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
	// ������ ������ ���� ������ �κ� (�߱�/���)
	public String issueList(Model model, HttpServletRequest request, HttpSession session, ArrayList<reserveDTO> rsdto) {			
		
		String id=(String)session.getAttribute("id");// login���� ����
		//-----------------------------------------------------------------------------// �̺κк��� request�޾ƿͼ� �־����
		String rs_startdate = "2020-11-05"; 
		String rt_code = "route-02";
		String tr_code ="gtx-302";
		//-----------------------------------------------------------------------------// �̺κб��� request�޾ƿͼ� �־����
		rsdto = dao.selectListid(id, rs_startdate, rt_code, tr_code); // login�� id�� ������ ���� �ϳ��� ��ȸ
		int count = dao.reserveCount(); // �������̺� ���� ��ȸ �޼���
		String name = dao.membername(id); // id������ �̸� ��ȸ
		
		//Date date= new Date(dao.nowtime(rt_code, tr_code, rs_startdate)); // DAO���� ���೯¥,�ð����� �޾ƿ�
		/*String st = dao.nowtime(rt_code, tr_code, rs_startdate);
		SimpleDateFormat time = new SimpleDateFormat("HH:mm"); // ��¥,�ð� ���� ��ȯ 
		Calendar cal = Calendar.getInstance(); // �ð����� �����ϱ� ���� calender���
		//cal.setTime(date); // �޾ƿ� ��¥,�ð� ���� set��Ŵ
		cal.add(Calendar.MINUTE, 10); // 10�� �� �ð���Ÿ�������� add
		String nowtime = time.format(cal.getTime()); // 10�� �� �ð��� simpledate �������� �޾ƿͼ� ������ ����*/	
	
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
	// ���ຯ���� ������ ���� ������ �κ� (���ຯ���� ���� ����)
	public String reservechange(Model model, HttpServletRequest request, HttpSession session, ArrayList<reserveDTO> rsdto) {	
		String id=(String)session.getAttribute("id");// login���� ����
		//-----------------------------------------------------------------------------// �̺κк��� request�޾ƿͼ� �־����
		String rs_startdate = "2020-11-05"; 
		String rt_code = "route-02";
		String tr_code ="gtx-302";
		//-----------------------------------------------------------------------------// �̺κб��� request�޾ƿͼ� �־����
		rsdto = dao.selectListid(id, rs_startdate, rt_code, tr_code);  // login�� id�� ������ ���� �ϳ��� ��ȸ
		int count = dao.reserveCount(); // �������̺� ���� ��ȸ �޼���
		String name = dao.membername(id); // id������ �̸� ��ȸ
		model.addAttribute("rsdto", rsdto);
		model.addAttribute("count",count);
		model.addAttribute("name",name);
		model.addAttribute("section", "ticket/ReserveChange.jsp");
		
		return "Index";
	}
	
	@RequestMapping(value="reserveChangeForm", method={RequestMethod.GET, RequestMethod.POST})
	// ���ຯ���� ������ ���� ������ �κ� (���ຯ�� ���� �����ϴ� ��)
	public String reserveChangeForm(Model model, HttpServletRequest request, ArrayList<reserveDTO> rsdto,ArrayList<reserveDTO> rsdto2, HttpSession session) {			
		String id = (String)session.getAttribute("id");
		String rs_startdate = request.getParameter("rs_startdate");
		String rt_code =  request.getParameter("rt_code");
		String tr_code = request.getParameter("tr_code");

		rsdto = dao.selectListid(id, rs_startdate, rt_code, tr_code); // login�� id�� ������ ���� �ϳ��� ��ȸ(�ο����ջ�)
		rsdto2 = dao.selectListid2(id, rs_startdate, rt_code, tr_code); // login�� id�� ������ ���� �ϳ��� ��ȸ(�ο����и�)
		int count = dao.reserveCount(); // �������̺� ���� ��ȸ �޼���
		model.addAttribute("rsdto", rsdto);
		model.addAttribute("rsdto2", rsdto2);
		model.addAttribute("count",count);
		model.addAttribute("section", "ticket/ReserveChangeForm.jsp");
		
		return "Index";
	}
	
	@RequestMapping(value="reserveUpadateForm", method= {RequestMethod.GET, RequestMethod.POST})
	// ���ຯ��� �°�����, �ο��� ������Ʈ�Ǿ� �������� ��� 
	public String reserveUpadateForm(HttpSession session, HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		command =new ReserveUpdate();
		command.execute(model);
		model.addAttribute("section", "ticket/ReserveUpdate.jsp");
		return "Index";
	}
	
	// ���� ���� ����
	@RequestMapping(value="reserveDelete", method= {RequestMethod.GET, RequestMethod.POST})
	public String reserveDelete(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new ReserveDelete();
		command.execute(model);
		return "redirect:issueList";
	}
}

package com.gtx_project.gtxproject.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gtx_project.gtxproject.Command.payment.PaymentInsertDel;
import com.gtx_project.gtxproject.Command.payment.PaymentInterface;
import com.gtx_project.gtxproject.DAO.paymentDAO;
import com.gtx_project.gtxproject.DAO.reserveDAO;
import com.gtx_project.gtxproject.DTO.paymentDTO;
import com.gtx_project.gtxproject.DTO.reserveDTO;

@Controller
public class PaymentController {
	
	@Autowired
	paymentDAO dao;
	
	private PaymentInterface command;
	
	@RequestMapping(value="payment", method={RequestMethod.GET, RequestMethod.POST})
	// ���� ���� �Ǵ� �������� �̵�
	public String payment(Model model, HttpServletRequest request, HttpSession session, ArrayList<reserveDTO> pdto, ArrayList<reserveDTO> pdto1) {			
		String rs_startdate = request.getParameter("rs_startdate");
		String rt_code =  request.getParameter("rt_code");
		String tr_code = request.getParameter("tr_code");
		String id=(String)session.getAttribute("id");// login���� ����
		reserveDAO rdao = new reserveDAO();
		pdto = rdao.selectListid(id, rs_startdate, rt_code, tr_code); // login�� id�� ������ ���� �ϳ��� ��ȸ
		pdto1 = rdao.selectListid2(id, rs_startdate, rt_code, tr_code);
		int count = dao.paymentCount(); // �������̺� ���� ��ȸ �޼���
		model.addAttribute("pdto", pdto);
		model.addAttribute("pdto1", pdto1);
		model.addAttribute("count",count);
		model.addAttribute("section", "ticket/PaymentPage.jsp");
		
		return "Index";
	}
	@RequestMapping(value="paymentView", method={RequestMethod.GET, RequestMethod.POST})
	// ���� ���� �Ǵ� �������� �̵�
	public String paymentView(Model model, HttpServletRequest request, HttpSession session, ArrayList<reserveDTO> pdto, ArrayList<reserveDTO> pdto1) {			
		model.addAttribute("request", request);
		String id=(String)session.getAttribute("id");// login���� ����
		String rs_startdate = request.getParameter("rs_startdate");
		String rt_code =  request.getParameter("rt_code");
		String tr_code = request.getParameter("tr_code");
		reserveDAO rdao = new reserveDAO();
		pdto = rdao.selectListid(id, rs_startdate, rt_code, tr_code);// login�� id�� ������ ���� �ϳ��� ��ȸ
		pdto1 = rdao.selectListid2(id, rs_startdate, rt_code, tr_code);
		int count = dao.paymentCount(); // �������̺� ���� ��ȸ �޼���
		model.addAttribute("pdto", pdto);
		model.addAttribute("pdto1", pdto1);
		model.addAttribute("count",count);
		
		String name = rdao.membername(id); // id������ �̸� ��ȸ
		model.addAttribute("name",name);
		
		model.addAttribute("section", "ticket/PaymentViewPage.jsp");
		
		return "Index";
	}
	@RequestMapping(value="paymentAction", method={RequestMethod.GET, RequestMethod.POST})
	// ���� ���� �Ǹ� �������̺� ���� �����ǰ� �������̺� ���� ���� �� ȭ�鿡 ���
	public String paymentAction(Model model, HttpServletRequest request, ArrayList<paymentDTO> pdto) {			
		model.addAttribute("request", request);
		
		int count = dao.paymentCount(); // �������̺� ���� ��ȸ �޼���
		model.addAttribute("count",count);
		
		command = new PaymentInsertDel();
		command.execute(model);

		model.addAttribute("section", "ticket/PaymentResult.jsp");
		
	return "Index";
	}
	
	@RequestMapping(value="usageHistory", method={RequestMethod.GET, RequestMethod.POST})
	// �̿볻�� ������
	public String usageHistory(Model model, HttpServletRequest request,  HttpSession session, ArrayList<paymentDTO> pdto) {			
		model.addAttribute("request", request);
		
		int count = dao.paymentCount(); // �������̺� ���� ��ȸ �޼���
		model.addAttribute("count",count);
		
		String id=(String)session.getAttribute("id"); // login���� ����
		String rs_startdate = request.getParameter("rs_startdate");
		String rt_code =  request.getParameter("rt_code");
		String tr_code = request.getParameter("tr_code");
		reserveDAO rdao = new reserveDAO();
		
		String name = rdao.membername(id); // id������ �̸� ��ȸ
		model.addAttribute("name",name);
		
		pdto = dao.selectListid(id);
		model.addAttribute("pdto", pdto);
		model.addAttribute("section", "mypage/UsageHistory.jsp");
		
	return "Index";
	}
	
}

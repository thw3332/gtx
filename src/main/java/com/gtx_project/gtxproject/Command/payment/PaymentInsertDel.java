package com.gtx_project.gtxproject.Command.payment;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.paymentDAO;
import com.gtx_project.gtxproject.DAO.reserveDAO;
import com.gtx_project.gtxproject.DTO.paymentDTO;
import com.gtx_project.gtxproject.DTO.reserveDTO;

public class PaymentInsertDel implements PaymentInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		
		String id=(String)session.getAttribute("id");// login정보 세션
		String rt_code = request.getParameter("rt_code");
		String tr_code = request.getParameter("tr_code");
		String rs_startdate = request.getParameter("rs_startdate");
		
		reserveDTO rsdto = new reserveDTO();
		paymentDAO pdao = new paymentDAO();
		System.out.println("rscode"+request.getParameter("rs_code"));
		System.out.println("rt_code"+request.getParameter("rt_code"));
		System.out.println("tr_code"+request.getParameter("tr_code"));
		System.out.println("rs_startdate"+request.getParameter("rs_startdate"));
		System.out.println("st_ecode"+request.getParameter("st_ecode"));
		System.out.println("buy_areano"+request.getParameter("buy_areano"));
		System.out.println("st_scode"+request.getParameter("st_scode"));
		System.out.println("buy_room"+request.getParameter("buy_room"));
		System.out.println("buy_seat"+request.getParameter("buy_seat"));
		System.out.println("buy_passenger"+request.getParameter("buy_passenger"));
		System.out.println("buy_count"+request.getParameter("buy_count"));
		System.out.println("buy_totalprice"+request.getParameter("buy_totalprice"));
		System.out.println("buy_refundyn"+request.getParameter("buy_refundyn"));
		System.out.println("buy_refundprice"+request.getParameter("buy_refundprice"));
		
		rsdto.setRs_code(request.getParameter("rs_code"));
		rsdto.setRt_code(rt_code);
		rsdto.setTr_code(tr_code);
		rsdto.setSt_scode(request.getParameter("st_scode"));
		rsdto.setSt_ecode(request.getParameter("st_ecode"));
		rsdto.setRs_startdate(rs_startdate);
		rsdto.setTr_areano(request.getParameter("buy_areano"));
		rsdto.setTr_room(request.getParameter("buy_room"));
		rsdto.setRs_seat(request.getParameter("buy_seat"));
		rsdto.setRs_passenger(request.getParameter("buy_passenger"));
		rsdto.setRs_count(Integer.parseInt(request.getParameter("buy_count")));
		rsdto.setRs_totalprice(Integer.parseInt(request.getParameter("buy_totalprice")));
		rsdto.setId(id);
		rsdto.setRs_refundyn(request.getParameter("buy_refundyn"));
		rsdto.setRs_refundprice(Integer.parseInt(request.getParameter("buy_refundprice")));	

		
		pdao.insertdel(rsdto,rt_code,tr_code,rs_startdate);
		
		
		ArrayList<paymentDTO> pdto =pdao.selectListid(id);
		model.addAttribute("pdto",pdto);
	}

	
}

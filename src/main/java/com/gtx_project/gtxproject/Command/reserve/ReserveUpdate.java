package com.gtx_project.gtxproject.Command.reserve;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.reserveDAO;
import com.gtx_project.gtxproject.DTO.reserveDTO;

public class ReserveUpdate implements ReserveInterface{

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");// login정보 세션

		String rs_code=   request.getParameter("rs_code");
		String rs_passenger = request.getParameter("rs_passenger");
		
		String rs_startdate = request.getParameter("rs_startdate");
		String rt_code =  request.getParameter("rt_code");
		String tr_code = request.getParameter("tr_code");
		
		reserveDAO rsdao = new reserveDAO();
		
		rsdao.reserveChange(rs_passenger, rs_code, id);
		
		ArrayList<reserveDTO> rsdto2 =rsdao.selectListid2(id, rs_startdate, rt_code, tr_code);
		
		model.addAttribute("rsdto2",rsdto2);
		
	}
    
}

package com.gtx_project.gtxproject.Command.reserve;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.boardDAO;
import com.gtx_project.gtxproject.DAO.reserveDAO;

public class ReserveDelete implements ReserveInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
	
		String rt_code=request.getParameter("rt_code");
		String tr_code=request.getParameter("tr_code");
		String rs_startdate=request.getParameter("rs_startdate");
		
		reserveDAO rsdao = new reserveDAO();
		
		rsdao.deleteReserve(rt_code,tr_code,rs_startdate);
		
		
	}

}

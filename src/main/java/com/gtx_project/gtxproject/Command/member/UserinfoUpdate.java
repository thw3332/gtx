package com.gtx_project.gtxproject.Command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.memberDAO;
import com.gtx_project.gtxproject.DTO.memberDTO;

public class UserinfoUpdate implements JoinInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		
		String id=(String)session.getAttribute("id");// login정보 세션
		
		memberDTO mdto = new memberDTO();
		
		
		mdto.setPassword(request.getParameter("password"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setPhone(request.getParameter("phone"));
		mdto.setZipcode(request.getParameter("zipcode"));
		mdto.setRoadaddress(request.getParameter("roadaddress"));
		mdto.setDetailaddress(request.getParameter("detailaddress"));
		mdto.setId(id);
		
		memberDAO mdao = new memberDAO();
		mdao.UpdateuserInfo(mdto);
		
	}

}

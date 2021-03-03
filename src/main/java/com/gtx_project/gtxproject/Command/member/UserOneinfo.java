package com.gtx_project.gtxproject.Command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.memberDAO;
import com.gtx_project.gtxproject.DTO.memberDTO;

public class UserOneinfo implements JoinInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		
		memberDAO mdao = new memberDAO();
		memberDTO mdto = mdao.getOnemember(id);
		System.out.println(mdto.getEmail());
		model.addAttribute("mdto", mdto);
		
		
				
		
	
		
	}

}

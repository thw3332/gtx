package com.gtx_project.gtxproject.Command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.memberDAO;
import com.gtx_project.gtxproject.DTO.memberDTO;

public class SearchFindId implements JoinInterface{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		memberDAO mdao = new memberDAO();
		String fid = mdao.findemail(name, email);
		
		model.addAttribute("fid", fid);
		
		
		
	}

}

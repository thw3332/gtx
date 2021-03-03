package com.gtx_project.gtxproject.Command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.memberDAO;
import com.gtx_project.gtxproject.DTO.memberDTO;


public class JoinOut implements JoinInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		memberDAO mdao = new memberDAO();
		mdao.Deletemember(name, id, password);
	
		
	}

}

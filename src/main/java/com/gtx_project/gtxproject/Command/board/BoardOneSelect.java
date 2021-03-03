package com.gtx_project.gtxproject.Command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.boardDAO;
import com.gtx_project.gtxproject.DAO.memberDAO;
import com.gtx_project.gtxproject.DTO.boardDTO;
import com.gtx_project.gtxproject.DTO.memberDTO;

public class BoardOneSelect implements BoardInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		
		boardDAO bdao = new boardDAO();
		boardDTO bdto = bdao.getOneboard(qna_num);
		
		model.addAttribute("bdto", bdto);
	}	
	
}

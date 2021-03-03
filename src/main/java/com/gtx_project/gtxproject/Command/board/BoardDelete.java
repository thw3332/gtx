package com.gtx_project.gtxproject.Command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.boardDAO;

public class BoardDelete implements BoardInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		boardDAO bdao = new boardDAO();
		bdao.Deleteqna(qna_num);
		

	}

	
}

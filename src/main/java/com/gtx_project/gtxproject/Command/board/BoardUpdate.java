package com.gtx_project.gtxproject.Command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.boardDAO;
import com.gtx_project.gtxproject.DTO.boardDTO;

public class BoardUpdate implements BoardInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		boardDTO bdto = new boardDTO();
		bdto.setQna_title(request.getParameter("qna_title"));
		bdto.setQna_content(request.getParameter("qna_content"));
		bdto.setQna_num(Integer.parseInt(request.getParameter("qna_num")));

		boardDAO bdao = new boardDAO();
		bdao.Updateqna(bdto);
	}
}

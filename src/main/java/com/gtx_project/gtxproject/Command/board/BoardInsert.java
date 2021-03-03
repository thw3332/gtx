package com.gtx_project.gtxproject.Command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.boardDAO;
import com.gtx_project.gtxproject.DTO.boardDTO;
import com.gtx_project.gtxproject.DTO.memberDTO;

public class BoardInsert implements BoardInterface{

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		boardDTO bdto = new boardDTO();
		//memberDTO mdto = new memberDTO();
		
		/*bdto.setQna_num(Integer.parseInt(request.getParameter("qna_num")));*/
		bdto.setQna_title(request.getParameter("qna_title"));
		bdto.setQna_content(request.getParameter("qna_content"));
		bdto.setId(id);
		/*bdto.setId(request.getParameter("id"));
		bdto.setRef(Integer.parseInt(request.getParameter("ref")));
		bdto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		bdto.setRe_level(Integer.parseInt(request.getParameter("re_level")));*/
		
		
		boardDAO bdao = new boardDAO();
		bdao.insert(bdto);
	}

}

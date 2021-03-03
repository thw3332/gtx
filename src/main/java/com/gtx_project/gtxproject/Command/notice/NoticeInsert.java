package com.gtx_project.gtxproject.Command.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.noticeDAO;

import com.gtx_project.gtxproject.DTO.noticeDTO;

public class NoticeInsert implements NoticeInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		noticeDTO ndto = new noticeDTO();
		
		ndto.setNt_title(request.getParameter("nt_title"));
		ndto.setNt_content(request.getParameter("nt_content"));
		ndto.setId(id);
		
		noticeDAO ndao = new noticeDAO();
		ndao.noticeinsert(ndto);
		
	}

}

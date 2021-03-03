package com.gtx_project.gtxproject.Command.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.noticeDAO;

public class NoticeDelete implements NoticeInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int nt_num = Integer.parseInt(request.getParameter("nt_num"));
		
		noticeDAO ndao = new noticeDAO();
		ndao.noticeDelete(nt_num);
	}

}

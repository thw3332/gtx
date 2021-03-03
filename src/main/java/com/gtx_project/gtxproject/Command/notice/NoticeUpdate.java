package com.gtx_project.gtxproject.Command.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.noticeDAO;
import com.gtx_project.gtxproject.DTO.noticeDTO;

public class NoticeUpdate implements NoticeInterface {

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		noticeDTO ndto = new noticeDTO();
		ndto.setNt_title(request.getParameter("nt_title"));
		ndto.setNt_content(request.getParameter("nt_content"));
		ndto.setNt_num(Integer.parseInt(request.getParameter("nt_num")));
		
		noticeDAO ndao = new noticeDAO();
		ndao.Updatenotice(ndto);
		
	}

}

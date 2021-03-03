package com.gtx_project.gtxproject.Command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.memberDAO;
import com.gtx_project.gtxproject.DTO.memberDTO;


public class JoinInsert implements JoinInterface {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		memberDTO mdto = new memberDTO();
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String birthday = year + "-" + month + "-" + day;

		mdto.setId(request.getParameter("id"));
		mdto.setPassword(request.getParameter("password"));
		mdto.setName(request.getParameter("name"));
		mdto.setPhone(request.getParameter("phone"));
		mdto.setBirthday(birthday);
		mdto.setEmail(request.getParameter("email"));	
		mdto.setZipcode(request.getParameter("zipcode"));
		mdto.setRoadaddress(request.getParameter("roadaddress"));
		mdto.setDetailaddress(request.getParameter("detailaddress"));
		mdto.setTerms_agreeyn(request.getParameter("terms_agreeyn"));
		mdto.setPersonal_agreeyn(request.getParameter("personal_agreeyn"));
		mdto.setChild_agreeyn(request.getParameter("child_agreeyn"));
		mdto.setEmail_agreeyn(request.getParameter("email_agreeyn"));
		mdto.setThird_agreeyn(request.getParameter("third_agreeyn"));
		
		memberDAO jdao = new memberDAO();
		jdao.Joininsert(mdto);
	}

}

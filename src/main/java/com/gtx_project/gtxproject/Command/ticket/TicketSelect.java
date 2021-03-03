package com.gtx_project.gtxproject.Command.ticket;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gtx_project.gtxproject.DAO.ticketDAO;
import com.gtx_project.gtxproject.DTO.ticketDTO;

public class TicketSelect implements TicketInterface {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ArrayList<ticketDTO> tdto = new ArrayList<>();
		ticketDAO tdao = new ticketDAO();
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdf.parse(request.getParameter("start_date"));
			
			String startstation = request.getParameter("start_station"); // ��߿�
			String endstation = request.getParameter("end_station"); // ������
			String startdate = sdf.format(date); // �������
			String starttime = request.getParameter("start_time"); // ��߽ð�
			int time = Integer.parseInt(starttime);
			
			if(time < 10) {
				starttime = "0" + starttime;
			}
			
			String adult = request.getParameter("adult"); // � �ο� ��(section)
			String child = request.getParameter("child"); // ��� �ο� ��(section)
			String adult_person = request.getParameter("adult_person"); // � �ο� ��
			String child_person = request.getParameter("child_person"); // ��� �ο� ��
			
			String start_name = tdao.getStartStation(startstation); // ��� ����
			String end_name = tdao.getEndStation(endstation); // ���� ����
			tdto = tdao.getAllTicket(startstation, endstation, starttime); // ������ ��ȸ ����Ʈ
			
			model.addAttribute("startstation", startstation); // ��߿�
			model.addAttribute("endstation", endstation); // ������
			model.addAttribute("startdate", startdate); // �������
			model.addAttribute("starttime", starttime); // ��߽ð�
			model.addAttribute("adult", adult); // � �ο� ��(section)
			model.addAttribute("child", child); // ��� �ο� ��(section)
			model.addAttribute("adult_person", adult_person); // � �ο� ��
			model.addAttribute("child_person", child_person); // ��� �ο� ��
			model.addAttribute("tdto", tdto); // ������ ��ȸ ����Ʈ
			model.addAttribute("start_name", start_name); // ��� ����
			model.addAttribute("end_name", end_name); // ���� ����
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

}

package com.gtx_project.gtxproject.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gtx_project.gtxproject.Command.board.BoardDelete;
import com.gtx_project.gtxproject.Command.board.BoardInsert;
import com.gtx_project.gtxproject.Command.board.BoardOneSelect;
import com.gtx_project.gtxproject.Command.notice.NoticeDelete;
import com.gtx_project.gtxproject.Command.notice.NoticeInsert;
import com.gtx_project.gtxproject.Command.notice.NoticeInterface;
import com.gtx_project.gtxproject.Command.notice.NoticeUpdate;
import com.gtx_project.gtxproject.Command.notice.NoticeOneSelect;
import com.gtx_project.gtxproject.DAO.noticeDAO;
import com.gtx_project.gtxproject.DTO.boardDTO;
import com.gtx_project.gtxproject.DTO.noticeDTO;

@Controller
public class NoticeController {

	@Autowired
		noticeDAO ndao;
	
		private NoticeInterface command;
		
		
			@RequestMapping(value="NoticeListPage", method= {RequestMethod.GET, RequestMethod.POST})
				public String gonoticeList( Model model){
					model.addAttribute("section", "notice/NoticeListPage.jsp");
					return "Index";
				}
		
		//��ü �Խñ��� ��ȸ�ϴ� ����
		@RequestMapping(value="noticeListPage")
		public String noticeListp(Model model, ArrayList<noticeDTO> ndto, HttpServletRequest request){
			String pageNum = "";
			if(request.getParameter("pageNum") != null) pageNum = request.getParameter("pageNum");
			else pageNum ="1";
		
			int pageSize = 5; // �� ȭ�鿡 �������� �Խñ� ��
			// pageNum�� null ���� ó��
			/*if(pageNum.equals("0")){
				pageNum = "1";
			}*/
			int count = 0; //��ü �Խñ��� ����
			int number = 0; // �Խ��� �ֽ� �� �ۼ� ������ ��ȣ ���� 30,29,28 ~~~
			int CurrentPage = Integer.parseInt(pageNum); // ���� ������ ��ȣ
			
			
			//===========�� ������ ���� ����Ͽ� ��============
			count  = ndao.getAllCount(); // ��ü �Խñ� �� �� count�� ����
			number =  count - (CurrentPage -1)* pageSize;
			int startRow = (CurrentPage -1) * pageSize+1; // �� ȭ���� �������� ��
		/*	int endRow = CurrentPage * pageSize; // �� ȭ�鿡 ���������� ��*/		
			// �ֽű��� 5���� ���� �޾��ִ� �޼���
			
		// ����¡�� �ʿ��� ���� ���� view�� ������ �������� model.Attribute ��´�
			
			//[1][2][3] ����¡�ϴµ� �ʿ��Ѽҽ��ڵ� ���� �ʱ�ȭ �Ѵ�.
			int pageCount = 0; //��ü ������ �ѹ��� ����=>3������ �� ȭ�鿡 3���� ����¡
			/*int pageblock = 3;*/   // �� ȭ�鿡 ����¡ �ϰ� ���� ����
			int startPage = 1;     //���� 1�������̸� startPage = 1; 2 ������=>4
											//[1][2][3] => 1�������� ���۹�ȣ�� 1�� �ȴ�. �� ���� ��� ����startPage = 1;
											//[1][2][3] => 1�������� ��������ȣ�� 3�� �ȴ�. �� ���� ��� ����endPage = 3;
			int endPage = 0;
			int result = 0;
											//����¡�� �ʿ��� ���� ���� view�� ������ �������� model.addAttribute�� ��´�
			
			//===============����¡ ����===================
				if(count>0){
					pageCount = count/pageSize+(count % pageSize == 0?0:1);
					result = CurrentPage / 3;
					
					//���� ȭ�� 1 ������ [1][2][3]
					if(CurrentPage % 3 !=0){
						startPage = result*3+1;
					}else {
						startPage = (result - 1)*3+1;
					}
					endPage = (startPage + 3)-1;
					// ������ endPage ���� �����ϴ� �ڵ�
					if(endPage > pageCount){
						endPage = pageCount;
					}
				}
				
				// ==================�˻�=====================
				String search = request.getParameter("search");
				
				if(search != null) {
					noticeDAO ndao = new noticeDAO();
					ndto = ndao.search(search,startRow);
					model.addAttribute("ndto", ndto);
				}else {
					noticeDAO ndao = new noticeDAO();
					ndto = ndao.noticeAllboard(startRow);
					model.addAttribute("ndto", ndto);
				}
				
				
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("count", count);
				model.addAttribute("number", number );
				model.addAttribute("CurrentPage", CurrentPage);
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("result", result);
				model.addAttribute("section", "notice/NoticeListPage.jsp");
				return "Index";

		}
		// �ϳ��� �Խñ��� ��ȸ�ϴ� ����
		@RequestMapping(value="NoticeView", method= {RequestMethod.GET, RequestMethod.POST})
		public String gonoticeview(Model model, HttpServletRequest request, HttpSession session) {
			model.addAttribute("request", request);
			
			String id = (String)session.getAttribute("id");
			
			if(id == null){
				model.addAttribute("notlogin", "�α��� �� �̿��ϼ���");
				return "Alert";
			}else {
				command = new NoticeOneSelect();
				command.execute(model);
				model.addAttribute("section", "notice/NoticeViewPage.jsp");
				return "Index";
			}
			
		}
		// �Խñ� �μ�Ʈ �ϴ� ������ ���� ����
		@RequestMapping(value="NoticeWriteForm", method= {RequestMethod.GET, RequestMethod.POST})
		public String gonoticewrite( Model model,HttpServletRequest request, HttpSession session){
			String id = (String)session.getAttribute("id");
			
			if(id == null){
				model.addAttribute("notlogin", "�α��� �� �̿��ϼ���");
				return "Alert";
			}else {
				model.addAttribute("section", "notice/NoticeWriteForm.jsp");
				return "Index";
			}
			
			
		}
		
		// �Խñ� �μ�Ʈ �ϴ� ����
		@RequestMapping(value="noticeWrite", method= {RequestMethod.GET, RequestMethod.POST})
		public String writego(Model model, HttpSession session, HttpServletRequest request){
			model.addAttribute("request", request);
			
			command = new NoticeInsert();
			command.execute(model);
			
			return "redirect:noticeListPage";
			
		}
		//�Խñ� �����ϴ� ������ ���� ����
		@RequestMapping(value="noticeUpPage", method= {RequestMethod.GET, RequestMethod.POST})
		public String gonoticeupdate(HttpServletRequest request, Model model){
			model.addAttribute("request", request);
			
			command = new NoticeOneSelect();
			command.execute(model);
			
			model.addAttribute("section", "notice/NoticeUpdatePage.jsp");
			return "Index";
		}
		
		// �Խñ� ���� �ϴ� ����
				@RequestMapping(value="goup", method= {RequestMethod.GET, RequestMethod.POST})
				public String updatego(Model model, HttpServletRequest request){
					model.addAttribute("request", request);
					
					command = new NoticeUpdate();
					command.execute(model);
					
					return "redirect:noticeListPage";
					
				}
				
				// �Խñ� ���� ����
				@RequestMapping(value="noticeDelete", method= {RequestMethod.GET, RequestMethod.POST})
				public String deletenotice(Model model, HttpServletRequest request) {
					model.addAttribute("request", request);
					
					command = new NoticeDelete();
					command.execute(model);
					return "redirect:noticeListPage";
				}		
}

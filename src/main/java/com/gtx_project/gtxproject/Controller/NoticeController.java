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
		
		//전체 게시글을 조회하는 맵핑
		@RequestMapping(value="noticeListPage")
		public String noticeListp(Model model, ArrayList<noticeDTO> ndto, HttpServletRequest request){
			String pageNum = "";
			if(request.getParameter("pageNum") != null) pageNum = request.getParameter("pageNum");
			else pageNum ="1";
		
			int pageSize = 5; // 한 화면에 보여지는 게시글 수
			// pageNum에 null 값을 처리
			/*if(pageNum.equals("0")){
				pageNum = "1";
			}*/
			int count = 0; //전체 게시글의 개수
			int number = 0; // 게시판 최신 글 작성 순서로 번호 누적 30,29,28 ~~~
			int CurrentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
			
			
			//===========각 변수에 값을 계산하여 줌============
			count  = ndao.getAllCount(); // 전체 게시글 수 를 count에 담음
			number =  count - (CurrentPage -1)* pageSize;
			int startRow = (CurrentPage -1) * pageSize+1; // 안 화면의 시작행의 값
		/*	int endRow = CurrentPage * pageSize; // 한 화면에 마지막행의 값*/		
			// 최신글을 5개씩 리턴 받아주는 메서드
			
		// 페이징에 필요한 값을 다음 view로 가지고 가기위해 model.Attribute 담는다
			
			//[1][2][3] 페이징하는데 필요한소스코드 변수 초기화 한다.
			int pageCount = 0; //전체 페이지 넘버수 현재=>3페이지 한 화면에 3개씩 페이징
			/*int pageblock = 3;*/   // 한 화면에 페이징 하고 싶은 개수
			int startPage = 1;     //현재 1페이지이면 startPage = 1; 2 페이지=>4
											//[1][2][3] => 1페이지의 시작번호는 1이 된다. 그 값을 담는 변수startPage = 1;
											//[1][2][3] => 1페이지의 마지막번호는 3이 된다. 그 값을 담는 변수endPage = 3;
			int endPage = 0;
			int result = 0;
											//페이징에 필요한 값을 다음 view로 가지고 가기위해 model.addAttribute에 담는다
			
			//===============페이징 로직===================
				if(count>0){
					pageCount = count/pageSize+(count % pageSize == 0?0:1);
					result = CurrentPage / 3;
					
					//현재 화면 1 페이지 [1][2][3]
					if(CurrentPage % 3 !=0){
						startPage = result*3+1;
					}else {
						startPage = (result - 1)*3+1;
					}
					endPage = (startPage + 3)-1;
					// 강제로 endPage 값을 지정하는 코드
					if(endPage > pageCount){
						endPage = pageCount;
					}
				}
				
				// ==================검색=====================
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
		// 하나의 게시글을 조회하는 맵핑
		@RequestMapping(value="NoticeView", method= {RequestMethod.GET, RequestMethod.POST})
		public String gonoticeview(Model model, HttpServletRequest request, HttpSession session) {
			model.addAttribute("request", request);
			
			String id = (String)session.getAttribute("id");
			
			if(id == null){
				model.addAttribute("notlogin", "로그인 후 이용하세요");
				return "Alert";
			}else {
				command = new NoticeOneSelect();
				command.execute(model);
				model.addAttribute("section", "notice/NoticeViewPage.jsp");
				return "Index";
			}
			
		}
		// 게시글 인서트 하는 폼으로 가는 맵핑
		@RequestMapping(value="NoticeWriteForm", method= {RequestMethod.GET, RequestMethod.POST})
		public String gonoticewrite( Model model,HttpServletRequest request, HttpSession session){
			String id = (String)session.getAttribute("id");
			
			if(id == null){
				model.addAttribute("notlogin", "로그인 후 이용하세요");
				return "Alert";
			}else {
				model.addAttribute("section", "notice/NoticeWriteForm.jsp");
				return "Index";
			}
			
			
		}
		
		// 게시글 인서트 하는 맵핑
		@RequestMapping(value="noticeWrite", method= {RequestMethod.GET, RequestMethod.POST})
		public String writego(Model model, HttpSession session, HttpServletRequest request){
			model.addAttribute("request", request);
			
			command = new NoticeInsert();
			command.execute(model);
			
			return "redirect:noticeListPage";
			
		}
		//게시글 수정하는 폼으로 가는 맵핑
		@RequestMapping(value="noticeUpPage", method= {RequestMethod.GET, RequestMethod.POST})
		public String gonoticeupdate(HttpServletRequest request, Model model){
			model.addAttribute("request", request);
			
			command = new NoticeOneSelect();
			command.execute(model);
			
			model.addAttribute("section", "notice/NoticeUpdatePage.jsp");
			return "Index";
		}
		
		// 게시글 수정 하는 맵핑
				@RequestMapping(value="goup", method= {RequestMethod.GET, RequestMethod.POST})
				public String updatego(Model model, HttpServletRequest request){
					model.addAttribute("request", request);
					
					command = new NoticeUpdate();
					command.execute(model);
					
					return "redirect:noticeListPage";
					
				}
				
				// 게시글 삭제 맵핑
				@RequestMapping(value="noticeDelete", method= {RequestMethod.GET, RequestMethod.POST})
				public String deletenotice(Model model, HttpServletRequest request) {
					model.addAttribute("request", request);
					
					command = new NoticeDelete();
					command.execute(model);
					return "redirect:noticeListPage";
				}		
}

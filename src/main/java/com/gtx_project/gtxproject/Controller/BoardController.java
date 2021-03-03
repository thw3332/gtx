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
import com.gtx_project.gtxproject.Command.board.BoardInterface;
import com.gtx_project.gtxproject.Command.board.BoardOneSelect;
import com.gtx_project.gtxproject.Command.board.BoardReInsert;
import com.gtx_project.gtxproject.Command.board.BoardUpdate;
import com.gtx_project.gtxproject.DAO.boardDAO;
import com.gtx_project.gtxproject.DTO.boardDTO;

@Controller
public class BoardController {
	
	@Autowired
	boardDAO bdao;
	
	private BoardInterface command;
	
	
	
	// 게시글 삭제 맵핑
	@RequestMapping(value="boardDelete", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteboard(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		
		command = new BoardDelete();
		command.execute(model);
		return "redirect:boardListPage";
	}
	
	//게시글 수정 폼으로 이동하는 맵핑
	@RequestMapping(value="boardUpPage", method= {RequestMethod.GET, RequestMethod.POST})
	public String upPage( HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		
		command = new BoardOneSelect();
		command.execute(model);
		
		model.addAttribute("section", "qna/BoardUpdatePage.jsp");
		return "Index";
		
	}
	
	//게시글 수정완료 하는 맵핑
	@RequestMapping(value="boardUp", method= {RequestMethod.GET, RequestMethod.POST})
	public String updateqna(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		
		command = new BoardUpdate();
		command.execute(model);
		return "redirect:boardListPage";
	}
	
	@RequestMapping(value="boardRe", method= {RequestMethod.GET, RequestMethod.POST})
	public String goboardRe(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new BoardReInsert();
		command.execute(model);
		return "redirect:boardListPage";
	}
	
	// 게시글에 대한 답글을 하는 폼으로 가는 맵핑
	@RequestMapping(value="boardReWrite", method= {RequestMethod.GET, RequestMethod.POST})
	public String gorewrite(Model model, HttpServletRequest request, HttpSession session){
		
		String id = (String)session.getAttribute("id");
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
		
		model.addAttribute("ref", ref);
		model.addAttribute("re_step", re_step);
		model.addAttribute("re_level", re_level);
		model.addAttribute("section", "qna/BoardReWrite.jsp");
		return "Index";
		
	}
	
	// 하나의 게시글을 조회하는 맵핑
	@RequestMapping(value="boardView", method= {RequestMethod.GET, RequestMethod.POST})
	public String goboardview(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("request", request);
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			model.addAttribute("notlogin", "로그인 후 이용하세요");
			return "Alert";
		}else {
			command = new BoardOneSelect();
			command.execute(model);
			model.addAttribute("section", "qna/BoardViewPage.jsp");
			return "Index";
		}
		
		
	}
	
	@RequestMapping(value="boardWriteForm")
	public String goboardwrite( Model model,HttpServletRequest request, HttpSession session){
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			model.addAttribute("notlogin", "로그인 후 이용하세요");
			return "Alert";
		}else {
			model.addAttribute("section", "qna/BoardWriteForm.jsp");
			return "Index";
		}
	}
	
	// 게시글 쓰는 맵핑
	@RequestMapping(value="boardWrite", method= {RequestMethod.GET, RequestMethod.POST})
	public String writego(Model model, HttpSession session, HttpServletRequest request){
		model.addAttribute("request", request);
		
		command = new BoardInsert();
		command.execute(model);
		return "redirect:boardListPage";
	}
	
	
	
	//전체 게시글을 조회하는 맵핑
	@RequestMapping(value="boardListPage")
	public String boardListp(Model model, ArrayList<boardDTO> bdto, HttpServletRequest request){
		String pageNum = "";
		
		if(request.getParameter("pageNum") != null) pageNum = request.getParameter("pageNum");
		else pageNum ="1";
	
		int pageSize = 5; // 한 화면에 보여지는 게시글 수
		// pageNum에 null 값을 처리
		/*if(pageNum.equals("0")){
			pageNum = "1";
		}*/
		int count = 0; //전체 게시글의 개수
		int searchcount=0; // 검색한 게시글의 개수
		int number = 0; // 게시판 최신 글 작성 순서로 번호 누적 30,29,28 ~~~
		int number1 =0;
		int CurrentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		
		
		//===========각 변수에 값을 계산하여 줌============
		count  = bdao.getAllCount(); 
		number =  count - (CurrentPage -1)* pageSize;
		int startRow = (CurrentPage -1) * pageSize+1; 
	
		int pageCount = 0; 
		int startPage = 1;     
		int endPage = 0;
		int result = 0;
		//==================================
		
		//===============페이징 로직===================
			if(count>0){
				pageCount = count/pageSize+(count % pageSize == 0?0:1);
				result = CurrentPage / 3;
				
				if(CurrentPage % 3 !=0){
					startPage = result*3+1;
				}else {
					startPage = (result - 1)*3+1;
				}
				endPage = (startPage + 3)-1;
			
				if(endPage > pageCount){
					endPage = pageCount;
				}
			}
			// ==================검색=====================
			String search = request.getParameter("search");
			if(search != null){
				boardDAO bdao = new boardDAO();
				 bdto =  bdao.search(search,startRow);
				model.addAttribute("bdto", bdto);
			}else {
				boardDAO bdao = new boardDAO();
				 bdto =  bdao.getAllboard(startRow);
				model.addAttribute("bdto", bdto);
			}
			
		
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("count", count);
			model.addAttribute("number", number );
			model.addAttribute("CurrentPage", CurrentPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("result", result);
			model.addAttribute("section", "qna/BoardListPage.jsp");
			return "Index";

	}
	
	

}

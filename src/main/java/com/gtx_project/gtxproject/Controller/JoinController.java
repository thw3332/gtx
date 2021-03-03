package com.gtx_project.gtxproject.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gtx_project.gtxproject.Command.board.BoardOneSelect;
import com.gtx_project.gtxproject.Command.member.JoinInsert;
import com.gtx_project.gtxproject.Command.member.JoinInterface;
import com.gtx_project.gtxproject.Command.member.JoinOut;
import com.gtx_project.gtxproject.Command.member.SearchFindId;
import com.gtx_project.gtxproject.Command.member.SearchFindPw;
import com.gtx_project.gtxproject.Command.member.UserOneinfo;
import com.gtx_project.gtxproject.Command.member.UserinfoUpdate;
import com.gtx_project.gtxproject.DAO.memberDAO;
import com.gtx_project.gtxproject.DTO.memberDTO;

@Controller
public class JoinController {

	@Autowired
	memberDAO mdao;
	
	private JoinInterface command;
	
		//회원 탈퇴 폼으로 이동하는 맵핑
		@RequestMapping(value="memberoutForm", method= {RequestMethod.GET, RequestMethod.POST})
		public String memberout( Model model){

			model.addAttribute("section", "join/MemberOut.jsp");
			return "Index";
		}
		
		//회원정보 수정 폼으로 이동하는  맵핑
		@RequestMapping(value="userInfoUpdate")
		public String userinfoupdate(Model model, HttpServletRequest request){
			model.addAttribute("request", request);
				
			command = new UserOneinfo();
			command.execute(model);
			
			model.addAttribute("section", "mypage/UseIinfoUpdate.jsp");
			return "Index";
		}
		
		// 회원정보 수정 하는 폼
		@RequestMapping(value="infoUp", method= {RequestMethod.GET, RequestMethod.POST})
		public String upPage( HttpServletRequest request, Model model){
			model.addAttribute("request", request);
			
			command = new UserinfoUpdate();
			command.execute(model);
			
			return "redirect:section";
			
		}
		
		//아이디 찾는 폼으로 이동하는 맵핑
		@RequestMapping(value="FindId", method= {RequestMethod.GET, RequestMethod.POST})
		public String goFindId( Model model){

			model.addAttribute("section", "login/FindId.jsp");
			return "Index";
		}
	
		//비밀번호 찾는 폼으로 이동하는 맵핑
		@RequestMapping(value="FindPw", method= {RequestMethod.GET, RequestMethod.POST})
		public String goFindPw( Model model){
			model.addAttribute("section", "login/FindPw.jsp");
			return "Index";
		}
	
		//로그인 폼 으로 가는 맵핑
		@RequestMapping(value="loginForm", method= {RequestMethod.GET, RequestMethod.POST})
		public String gologin( Model model){
			model.addAttribute("section", "login/LoginForm.jsp");
			return "Index";
		}
		
		// 회원가입 동의 폼 으로 가는 맵핑
		@RequestMapping(value="joinForm", method= {RequestMethod.GET, RequestMethod.POST})
		public String gojoinagree( Model model){
			model.addAttribute("section", "join/JoinAgreeForm.jsp");
			return "Index";
		}
	
		// 회원가입  폼 으로 가는 맵핑
		@RequestMapping(value="agree", method= {RequestMethod.GET, RequestMethod.POST})
		public String gojoinview( Model model, HttpServletRequest request){
			
			String terms_agreeyn = request.getParameter("terms_agreeyn");
			String personal_agreeyn = request.getParameter("personal_agreeyn");
			String email_agreeyn = request.getParameter("email_agreeyn");
			String third_agreeyn =  request.getParameter("third_agreeyn");
			
			if(terms_agreeyn == null || terms_agreeyn.equals("N")) {
				model.addAttribute("msg", "필수 동의 여부를 확인 해주세요.");
				return "Alert";
			}else if(personal_agreeyn == null || personal_agreeyn.equals("N")){
				model.addAttribute("msg", "필수 동의 여부를 확인 해주세요.");
				return "Alert";
			}else if(email_agreeyn == null){
				model.addAttribute("msg", "동의 /미동의를 선택해주세요.");
				return "Alert";
			}else if(third_agreeyn == null){
				model.addAttribute("msg", "동의 /미동의를 선택해주세요.");
				return "Alert";
			}else {
				model.addAttribute("terms_agreeyn", terms_agreeyn);
				model.addAttribute("personal_agreeyn", personal_agreeyn);
				model.addAttribute("email_agreeyn", email_agreeyn);
				model.addAttribute("third_agreeyn", third_agreeyn);
				
				model.addAttribute("section", "join/JoinForm.jsp");
				return "Index";
			}
		}
	
		//회원가입 인서트 하는 맵핑
		@RequestMapping(value="goJoin", method= {RequestMethod.GET, RequestMethod.POST})
		public String gojoin(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pw = request.getParameter("password");
			String repw = request.getParameter("repassword");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String zipcode = request.getParameter("zipcode");
			String detailaddress = request.getParameter("detailaddress");
			
			if(id == "") {
				model.addAttribute("joinmsg", "아이디를 입력해주세요.");
				return "Alert";
			}
			else if(name == ""){
				model.addAttribute("joinmsg", "이름을 입력해주세요.");
				return "Alert";
			}
			else if(pw == ""){
				model.addAttribute("joinmsg", "비밀번호를 입력해주세요.");
				return "Alert";
			}
			else if(repw == ""){
				model.addAttribute("joinmsg", "비밀번호를 다시 입력해주세요.");
				return "Alert";
			}
			else if(month == ""){
				model.addAttribute("joinmsg", "생년월일을 정확히 입력해주세요.");
				return "Alert";
			}
			else if(day == ""){
				model.addAttribute("joinmsg", "생년월일을 정확히 입력해주세요.");
				return "Alert";
			}
			else if(email == ""){
				model.addAttribute("joinmsg", "이메일을 입력해주세요.");
				return "Alert";
			}
			else if(phone == ""){
				model.addAttribute("joinmsg", "전화번호를 입력해주세요.");
				return "Alert";
			}
			else if(zipcode == ""){
				model.addAttribute("joinmsg", "우편번호를 입력해주세요.");
				return "Alert";
			}
			else if(detailaddress == ""){
				model.addAttribute("joinmsg", "상세주소를 입력해주세요.");
				return "Alert";
			}
			else {
				command = new JoinInsert();
				command.execute(model);
				
				return "Index";
			}
			
			
		}
		// 아이디 찾는 맵핑
		@RequestMapping(value="gosearchid", method= {RequestMethod.GET, RequestMethod.POST})
			public String srhid(Model model, HttpServletRequest request, @RequestParam("name") String name,  @RequestParam("email") String email){
			model.addAttribute("request", request);
			 
				String findemail = mdao.findemail(email);
				String refindname = mdao.refindname(email);
				
				if(!email.equals("") && !name.equals("")){
					if(email.equals(findemail) && !name.equals(refindname) ){
						model.addAttribute("loginmsg", "이름이 일치하지 않습니다.");
						return "Alert";
					}else if(!email.equals(findemail) && !name.equals(refindname)){
						model.addAttribute("loginmsg", "이메일과 이름을 확인해주세요.");
						return "Alert";
					}else {
						command = new SearchFindId();
						command.execute(model);
						model.addAttribute("section", "login/ResultFindId.jsp");
						return "Index";
					}
				}else{
					model.addAttribute("loginmsg", "이메일과 이름을 확인해주세요.");
					return "Alert";
				}
		}
		
		// 비밀번호 찾는 맵핑
			@RequestMapping(value="gosearchpw", method= {RequestMethod.GET, RequestMethod.POST})
				public String srhpw(Model model, HttpServletRequest request, @RequestParam("id") String id,  @RequestParam("name") String name){
				model.addAttribute("request", request);	
					
					String finedname = mdao.findedname(id);
					 String findid = mdao.findid(id);
					
					System.out.println("===============");
					System.out.println("id : " + id);
					System.out.println("name :" + name);
					System.out.println("dbname : " + finedname);
					System.out.println("dbid : " + findid);
					
					if(!id.equals("") && !name.equals("")){
						
						if(id.equals(findid) && !name.equals(finedname)){ 
								model.addAttribute("loginmsg", "이름이 일치하지 않습니다.");
								return "Alert";
						}else if(!id.equals(findid) && !name.equals(finedname)){
								model.addAttribute("loginmsg", "아이디와 비밀번호를 확인해주세요.");
								return "Alert";
						}else{ 
								command = new SearchFindPw();
								command.execute(model);
								
								model.addAttribute("section", "login/ResultFindPw.jsp");
								return "Index";
						}
					}else{
						model.addAttribute("loginmsg", "아이디와 비밀번호를 확인해주세요.");
						return "Alert";
					}
			}
			
		//회원탈퇴
			@RequestMapping(value="goout", method= {RequestMethod.GET, RequestMethod.POST})
			public String deleteboard(Model model, HttpServletRequest request) {
				model.addAttribute("request", request);
							
				command = new JoinOut();
				command.execute(model);
				
				return "redirect:section";
			}
			

		//로그인 하는 맵핑
		@RequestMapping(value="login", method= {RequestMethod.GET, RequestMethod.POST})
		public String login(Model model,  HttpSession session, @RequestParam("id") String id,  @RequestParam("password") String password){
			
			String dbid = mdao.findid(id);
			String dbpw = mdao.findpw(id);
			
			if(!id.equals("") && !password.equals("")){
				if(!id.equals(dbid)){
					model.addAttribute("loginmsg", "아이디가 일치하지 않습니다.");
					return "Alert";
				}else{ 
					if(!password.equals(dbpw)){
						model.addAttribute("loginmsg", "비밀번호가 일치하지 않습니다.");
						return "Alert";
					}else{ 
						session.setAttribute("id", dbid);
						return "Index";
					}
				}
			}else{
				model.addAttribute("loginmsg", "아이디와 비밀번호를 확인해주세요.");
				return "Alert";
			}
		}
		
		
		
	}
		
	















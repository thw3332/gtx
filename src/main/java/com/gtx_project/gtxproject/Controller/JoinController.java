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
	
		//ȸ�� Ż�� ������ �̵��ϴ� ����
		@RequestMapping(value="memberoutForm", method= {RequestMethod.GET, RequestMethod.POST})
		public String memberout( Model model){

			model.addAttribute("section", "join/MemberOut.jsp");
			return "Index";
		}
		
		//ȸ������ ���� ������ �̵��ϴ�  ����
		@RequestMapping(value="userInfoUpdate")
		public String userinfoupdate(Model model, HttpServletRequest request){
			model.addAttribute("request", request);
				
			command = new UserOneinfo();
			command.execute(model);
			
			model.addAttribute("section", "mypage/UseIinfoUpdate.jsp");
			return "Index";
		}
		
		// ȸ������ ���� �ϴ� ��
		@RequestMapping(value="infoUp", method= {RequestMethod.GET, RequestMethod.POST})
		public String upPage( HttpServletRequest request, Model model){
			model.addAttribute("request", request);
			
			command = new UserinfoUpdate();
			command.execute(model);
			
			return "redirect:section";
			
		}
		
		//���̵� ã�� ������ �̵��ϴ� ����
		@RequestMapping(value="FindId", method= {RequestMethod.GET, RequestMethod.POST})
		public String goFindId( Model model){

			model.addAttribute("section", "login/FindId.jsp");
			return "Index";
		}
	
		//��й�ȣ ã�� ������ �̵��ϴ� ����
		@RequestMapping(value="FindPw", method= {RequestMethod.GET, RequestMethod.POST})
		public String goFindPw( Model model){
			model.addAttribute("section", "login/FindPw.jsp");
			return "Index";
		}
	
		//�α��� �� ���� ���� ����
		@RequestMapping(value="loginForm", method= {RequestMethod.GET, RequestMethod.POST})
		public String gologin( Model model){
			model.addAttribute("section", "login/LoginForm.jsp");
			return "Index";
		}
		
		// ȸ������ ���� �� ���� ���� ����
		@RequestMapping(value="joinForm", method= {RequestMethod.GET, RequestMethod.POST})
		public String gojoinagree( Model model){
			model.addAttribute("section", "join/JoinAgreeForm.jsp");
			return "Index";
		}
	
		// ȸ������  �� ���� ���� ����
		@RequestMapping(value="agree", method= {RequestMethod.GET, RequestMethod.POST})
		public String gojoinview( Model model, HttpServletRequest request){
			
			String terms_agreeyn = request.getParameter("terms_agreeyn");
			String personal_agreeyn = request.getParameter("personal_agreeyn");
			String email_agreeyn = request.getParameter("email_agreeyn");
			String third_agreeyn =  request.getParameter("third_agreeyn");
			
			if(terms_agreeyn == null || terms_agreeyn.equals("N")) {
				model.addAttribute("msg", "�ʼ� ���� ���θ� Ȯ�� ���ּ���.");
				return "Alert";
			}else if(personal_agreeyn == null || personal_agreeyn.equals("N")){
				model.addAttribute("msg", "�ʼ� ���� ���θ� Ȯ�� ���ּ���.");
				return "Alert";
			}else if(email_agreeyn == null){
				model.addAttribute("msg", "���� /�̵��Ǹ� �������ּ���.");
				return "Alert";
			}else if(third_agreeyn == null){
				model.addAttribute("msg", "���� /�̵��Ǹ� �������ּ���.");
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
	
		//ȸ������ �μ�Ʈ �ϴ� ����
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
				model.addAttribute("joinmsg", "���̵� �Է����ּ���.");
				return "Alert";
			}
			else if(name == ""){
				model.addAttribute("joinmsg", "�̸��� �Է����ּ���.");
				return "Alert";
			}
			else if(pw == ""){
				model.addAttribute("joinmsg", "��й�ȣ�� �Է����ּ���.");
				return "Alert";
			}
			else if(repw == ""){
				model.addAttribute("joinmsg", "��й�ȣ�� �ٽ� �Է����ּ���.");
				return "Alert";
			}
			else if(month == ""){
				model.addAttribute("joinmsg", "��������� ��Ȯ�� �Է����ּ���.");
				return "Alert";
			}
			else if(day == ""){
				model.addAttribute("joinmsg", "��������� ��Ȯ�� �Է����ּ���.");
				return "Alert";
			}
			else if(email == ""){
				model.addAttribute("joinmsg", "�̸����� �Է����ּ���.");
				return "Alert";
			}
			else if(phone == ""){
				model.addAttribute("joinmsg", "��ȭ��ȣ�� �Է����ּ���.");
				return "Alert";
			}
			else if(zipcode == ""){
				model.addAttribute("joinmsg", "�����ȣ�� �Է����ּ���.");
				return "Alert";
			}
			else if(detailaddress == ""){
				model.addAttribute("joinmsg", "���ּҸ� �Է����ּ���.");
				return "Alert";
			}
			else {
				command = new JoinInsert();
				command.execute(model);
				
				return "Index";
			}
			
			
		}
		// ���̵� ã�� ����
		@RequestMapping(value="gosearchid", method= {RequestMethod.GET, RequestMethod.POST})
			public String srhid(Model model, HttpServletRequest request, @RequestParam("name") String name,  @RequestParam("email") String email){
			model.addAttribute("request", request);
			 
				String findemail = mdao.findemail(email);
				String refindname = mdao.refindname(email);
				
				if(!email.equals("") && !name.equals("")){
					if(email.equals(findemail) && !name.equals(refindname) ){
						model.addAttribute("loginmsg", "�̸��� ��ġ���� �ʽ��ϴ�.");
						return "Alert";
					}else if(!email.equals(findemail) && !name.equals(refindname)){
						model.addAttribute("loginmsg", "�̸��ϰ� �̸��� Ȯ�����ּ���.");
						return "Alert";
					}else {
						command = new SearchFindId();
						command.execute(model);
						model.addAttribute("section", "login/ResultFindId.jsp");
						return "Index";
					}
				}else{
					model.addAttribute("loginmsg", "�̸��ϰ� �̸��� Ȯ�����ּ���.");
					return "Alert";
				}
		}
		
		// ��й�ȣ ã�� ����
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
								model.addAttribute("loginmsg", "�̸��� ��ġ���� �ʽ��ϴ�.");
								return "Alert";
						}else if(!id.equals(findid) && !name.equals(finedname)){
								model.addAttribute("loginmsg", "���̵�� ��й�ȣ�� Ȯ�����ּ���.");
								return "Alert";
						}else{ 
								command = new SearchFindPw();
								command.execute(model);
								
								model.addAttribute("section", "login/ResultFindPw.jsp");
								return "Index";
						}
					}else{
						model.addAttribute("loginmsg", "���̵�� ��й�ȣ�� Ȯ�����ּ���.");
						return "Alert";
					}
			}
			
		//ȸ��Ż��
			@RequestMapping(value="goout", method= {RequestMethod.GET, RequestMethod.POST})
			public String deleteboard(Model model, HttpServletRequest request) {
				model.addAttribute("request", request);
							
				command = new JoinOut();
				command.execute(model);
				
				return "redirect:section";
			}
			

		//�α��� �ϴ� ����
		@RequestMapping(value="login", method= {RequestMethod.GET, RequestMethod.POST})
		public String login(Model model,  HttpSession session, @RequestParam("id") String id,  @RequestParam("password") String password){
			
			String dbid = mdao.findid(id);
			String dbpw = mdao.findpw(id);
			
			if(!id.equals("") && !password.equals("")){
				if(!id.equals(dbid)){
					model.addAttribute("loginmsg", "���̵� ��ġ���� �ʽ��ϴ�.");
					return "Alert";
				}else{ 
					if(!password.equals(dbpw)){
						model.addAttribute("loginmsg", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
						return "Alert";
					}else{ 
						session.setAttribute("id", dbid);
						return "Index";
					}
				}
			}else{
				model.addAttribute("loginmsg", "���̵�� ��й�ȣ�� Ȯ�����ּ���.");
				return "Alert";
			}
		}
		
		
		
	}
		
	















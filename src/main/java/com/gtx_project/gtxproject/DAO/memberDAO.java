package com.gtx_project.gtxproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.gtx_project.gtxproject.DTO.boardDTO;
import com.gtx_project.gtxproject.DTO.memberDTO;

public class memberDAO {
	String url = "jdbc:mariadb://127.0.0.1:3306/GTXDB";
	String id = "root";
	String pw = "root";

	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	//==============================================
	public void getCon() {
		
		try {
			// 마리아DB 드라이버 로드 한다.
			Class.forName("org.mariadb.jdbc.Driver");
			// 마리아DB (프로토콜 :mariadb://마리아I host P주소 : 포트번호/DB 이름 ","아이디","패스워드") 지정
			con = DriverManager.getConnection(url, id, pw);
			/*con = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/DB","root","root");*/
			System.out.println("DB 연결 완료");
		}catch(Exception e) {
			System.out.println("JDBC 드라이버 로드 에러");
		}
	}
	
	//==============================================
	public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		try {
			if(rs != null){rs.close();}
			if(ps != null){ps.close();}
			if(conn != null){conn.close();}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//==============================================
    // 회원가입 시 회원 정보를 인서트 하는 메서드
	public void Joininsert(memberDTO mdto) {
		
		getCon();
		
		try{
			
			String sql = "insert into gtx_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),'N')";
			// 쿼리실행 객체
			pstm = con.prepareStatement(sql);
			
			//? 값 대입
			pstm.setString(1, mdto.getId());
			pstm.setString(2, mdto.getPassword());
			pstm.setString(3, mdto.getName());
			pstm.setString(4, mdto.getPhone());
			pstm.setString(5, mdto.getBirthday());
			pstm.setString(6, mdto.getEmail());
			pstm.setString(7, mdto.getZipcode());
			pstm.setString(8, mdto.getRoadaddress());
			pstm.setString(9, mdto.getDetailaddress());
			pstm.setString(10, mdto.getTerms_agreeyn());
			pstm.setString(11, mdto.getPersonal_agreeyn());
			pstm.setString(12, mdto.getChild_agreeyn());
			pstm.setString(13, mdto.getEmail_agreeyn());
			pstm.setString(14, mdto.getThird_agreeyn());
			
			//쿼리실행
			pstm.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
	}
	//==============================================
	// id 받아오는 메서드
	public String findid(String id){
		
		getCon();
		
		String findid = "";
		
		try{
			String sql = "select id from gtx_member where id='"+ id +"'";
			pstm = con.prepareStatement(sql);
			rs=pstm.executeQuery();
			if(rs.next()){
				findid = rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return findid;
	}
	//==============================================
	// email 받아오는 메서드
		public String findemail(String email){
			
			getCon();
			
			String findemail = "";
			
			try{
				String sql = "select email from gtx_member where email='"+ email +"'";
				pstm = con.prepareStatement(sql);
				rs=pstm.executeQuery();
				if(rs.next()){
					findemail = rs.getString(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			return findemail;
		}
		
		//==============================================
		// email을 이용해서 이름 받아오는 메서드
			public String refindname(String email){
				
				getCon();
				
				String refindname = "";
				
				try{
					String sql = "select name from gtx_member where email='"+ email +"'";
					pstm = con.prepareStatement(sql);
					rs=pstm.executeQuery();
					if(rs.next()){
						refindname = rs.getString(1);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					close(con, pstm, rs);
				}
				return refindname;
			}
		
	//==============================================
	// pw 받아오는 메서드
	public String findpw(String id){
		
		getCon();
		
		String findpw = "";
		
		try {
			String sql = "select password from gtx_member where id='"+ id +"'";
			pstm = con.prepareStatement(sql);
			rs=pstm.executeQuery();
			
			if(rs.next()){
				findpw=rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return findpw;
	}
	
	
	//==============================================
	// 디비 이름 가져오는 메서드
public String findedname(String id){
		
		getCon();
		
		String finedname = "";
		
		try {
			String sql = "select name from gtx_member where id='"+ id +"'";
			pstm = con.prepareStatement(sql);
			rs=pstm.executeQuery();
			
			if(rs.next()){
				finedname=rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return finedname;
	}
//==============================================
	
	
	
	//==============================================
	
	// 아이디 찾기
		public String findemail(String name, String email) {
			
			String findid = "";
			
			getCon();
			
			try {

				String sql = "select id from gtx_member where name ='"+ name +"' and email = '"+ email +"'";

				pstm = con.prepareStatement(sql);
				rs = pstm.executeQuery();

				if(rs.next()) {
					
					findid = rs.getString(1);
							
				}
			} catch (Exception e) {
				e.printStackTrace();

			}finally {
				close(con, pstm, rs);
			}
			return findid;
		
}
		
		//==============================================
		
		// 비밀번호 찾기
			public String findpw(String name, String id) {
				
				String findpw = "";
				
				getCon();
				
				try {

					String sql = "select password from gtx_member where name ='"+ name +"' and id = '"+ id +"'";

					pstm = con.prepareStatement(sql);
					rs = pstm.executeQuery();

					if(rs.next()) {
						
						findpw = rs.getString(1);
								
					}
				} catch (Exception e) {
					e.printStackTrace();

				}finally {
					close(con, pstm, rs);
				}
				return findpw;
			}
			
			//===========================================
			//회원 탙퇴 하는 메서드
			public void Deletemember(String name, String id, String password) {

				getCon();
				
				try {
					String sql = "delete from gtx_member where name ='"+ name +"' and id = '"+ id +"' and password = '"+ password +"'";
					pstm = con.prepareStatement(sql);
					/*pstm.setString(1, name);
					pstm.setString(2, id);*/
				
					pstm.executeUpdate();

					
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					close(con, pstm, rs);
				}
				
			}
			
		
				
			//==============================================
				//회원정보를 수정 하는 메서드
			public void UpdateuserInfo(memberDTO mdto) {
				getCon();
				
				try {
					String sql = "update gtx_member set password =?,  phone =?,   email =?, zipcode =?, roadaddress =?, detailaddress =?"
							+ " where id =? ";
					pstm = con.prepareStatement(sql);
					pstm.setString(1, mdto.getPassword());
					pstm.setString(2, mdto.getPhone());
					pstm.setString(3, mdto.getEmail());
					pstm.setString(4, mdto.getZipcode());
					pstm.setString(5, mdto.getRoadaddress());
					pstm.setString(6, mdto.getDetailaddress());
					pstm.setString(7, mdto.getId());

					pstm.executeUpdate();
					
				}catch (Exception e) {
					 e.printStackTrace();
				}finally {
					close(con, pstm, rs);
				}
				
			}
			//==============================================
				// 한 명의 회원 정보를 불러오는 메서드
			public memberDTO getOnemember(String id){
				
				getCon();
				
				memberDTO mdto = new memberDTO();
					
				try {
					// 하나의 게시글 조회
					String sql = "select * from gtx_member where id ='"+ id +"' ";
					pstm = con.prepareStatement(sql);
					rs = pstm.executeQuery();
					
					if(rs.next()){
						mdto.setId(rs.getString(1));
						mdto.setPassword(rs.getString(2));
						mdto.setName(rs.getString(3));
						mdto.setPhone(rs.getString(4));
						mdto.setBirthday(rs.getString(5));
						mdto.setEmail(rs.getString(6));
						mdto.setZipcode(rs.getString(7));
						mdto.setRoadaddress(rs.getString(8));
						mdto.setDetailaddress(rs.getString(9));
						mdto.setTerms_agreeyn(rs.getString(10));
						mdto.setPersonal_agreeyn(rs.getString(11));
						mdto.setChild_agreeyn(rs.getString(12));
						mdto.setEmail_agreeyn(rs.getString(13));
						mdto.setThird_agreeyn(rs.getString(14));
						mdto.setReg_date(rs.getString(15));
						mdto.setAdmin_yn(rs.getString(16));
						
					}
				}catch (Exception e) {
					e.printStackTrace();
				}finally{
					close(con, pstm, rs);
				}
				return mdto;
			}
			
}

package com.gtx_project.gtxproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.gtx_project.gtxproject.DTO.memberDTO;
import com.gtx_project.gtxproject.DTO.reserveDTO;


public class reserveDAO {
	String url = "jdbc:mariadb://127.0.0.1:3306/GTXDB";
	String id = "root";
	String pw = "root";

	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	//-----------------------------------------------------
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
	//--------------------------------------------------------
	public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		
		try {
			if(rs != null) { rs.close(); }
			if(ps != null) { ps.close(); }
			if(conn != null) { conn.close(); }
		}catch (Exception e) {
			e.printStackTrace();			
		}
	}
	//--------------------------------------------------------
	// 예약내역 조회
		public ArrayList<reserveDTO> ReserveAll() {
			
			getCon();
			
			ArrayList<reserveDTO> al = new ArrayList<>();
			
			try {
				String sql = "SELECT rs_code, rt_code, tr_code,"
						+ "(SELECT st_name FROM gtx_station z where z.st_code = a.st_scode) st_scode, "
						+ "(SELECT st_name FROM gtx_station z WHERE z.st_code = a.st_ecode) st_ecode, rs_date, rs_startdate, "
						+ "(SELECT rt_stime FROM gtx_route z WHERE z.st_scode = a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_code=a.tr_code) rt_stime, "
						+ "(SELECT rt_etime FROM gtx_route z WHERE z.st_scode = a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_code=a.tr_code) rt_etime, rs_totalprice, rs_count,rs_passenger, tr_areano , rs_seat , tr_room, rs_totalprice "
						+ "FROM gtx_reserve a ORDER BY rs_startdate ASC";
				
				pstm = con.prepareStatement(sql);
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					reserveDTO rsdto= new reserveDTO();
					
					rsdto.setRs_code(rs.getString(1));
					rsdto.setRt_code(rs.getString(2));
					rsdto.setRs_date(rs.getString(3));
					rsdto.setRs_startdate(rs.getString(4));
					rsdto.setTr_code(rs.getString(5));
					rsdto.setSt_scode(rs.getString(6));	
					rsdto.setSt_ecode(rs.getString(7));
					rsdto.setRt_stime(rs.getString(8));
					rsdto.setRt_etime(rs.getString(9));
					rsdto.setRs_count(rs.getInt(10));
					rsdto.setRs_passenger(rs.getString(11));
					rsdto.setTr_areano(rs.getString(12));
					rsdto.setRs_seat(rs.getString(13));
					rsdto.setTr_room(rs.getString(14));
					rsdto.setRs_totalprice(rs.getInt(15));
					
					
					al.add(rsdto);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			return al;
		}
		//--------------------------------------------------------------
		// 예약내역 조회(인원수, 금액 합쳐진 조회)
		public ArrayList<reserveDTO> selectListid(String id, String rs_startdate, String rt_code, String tr_code) {
			ArrayList<reserveDTO> a = new ArrayList<>();
			
			getCon();

			try {
				String sql =   "SELECT rs_code, rt_code, rs_date, rs_startdate, tr_code,"
						+ "(SELECT st_name FROM gtx_station z where z.st_code = a.st_scode) st_scode, "
						+ "(SELECT st_name FROM gtx_station z WHERE z.st_code = a.st_ecode) st_ecode, "
						+ "(SELECT rt_stime FROM gtx_route z WHERE z.st_scode = a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_code=a.tr_code) rt_stime, "
						+ "(SELECT rt_etime FROM gtx_route z WHERE z.st_scode = a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_code=a.tr_code) rt_etime, "
						+ "(SELECT pr_childprice FROM gtx_price z WHERE z.st_scode=a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_room=a.tr_room) pr_childprice, "
						+ "(SELECT pr_adultprice FROM gtx_price z WHERE z.st_scode=a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_room=a.tr_room) pr_adultprice, "
						+ "SUM(rs_totalprice) rs_totalprice, SUM(rs_count) rs_count, rs_passenger, tr_areano , rs_seat , tr_room "
						+ "FROM gtx_reserve a "
						+ "WHERE id='"+ id + "' AND rs_startdate='" + rs_startdate + "' AND rt_code='" + rt_code + "' AND tr_code='" + tr_code + "' ORDER BY rs_startdate ASC";
				System.out.println(sql);
				pstm = con.prepareStatement(sql);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					reserveDTO rsdto = new reserveDTO();
					rsdto.setRs_code(rs.getString(1));
					rsdto.setRt_code(rs.getString(2));
					rsdto.setRs_date(rs.getString(3));
					rsdto.setRs_startdate(rs.getString(4));
					rsdto.setTr_code(rs.getString(5));
					rsdto.setSt_scode(rs.getString(6));	
					rsdto.setSt_ecode(rs.getString(7));
					rsdto.setRt_stime(rs.getString(8));
					rsdto.setRt_etime(rs.getString(9));
					rsdto.setPr_childprice(rs.getString(10));
					rsdto.setPr_adultprice(rs.getString(11));
					rsdto.setRs_totalprice(rs.getInt(12));
					rsdto.setRs_count(rs.getInt(13));
					rsdto.setRs_passenger(rs.getString(14));
					rsdto.setTr_areano(rs.getString(15));
					rsdto.setRs_seat(rs.getString(16));
					rsdto.setTr_room(rs.getString(17));
					
					a.add(rsdto);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			return a;
		}
		//--------------------------------------------------------------
		// 예약내역 조회(인원수, 금액 따로 빠진 조회)
		public ArrayList<reserveDTO> selectListid2(String id, String rs_startdate, String rt_code, String tr_code) {
			ArrayList<reserveDTO> a = new ArrayList<>();
			
			getCon();

			try {
				String sql =   "SELECT rs_code, rt_code, rs_date, rs_startdate, tr_code, st_scode, st_ecode, "
						+ "(SELECT rt_stime FROM gtx_route z WHERE z.st_scode = a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_code=a.tr_code) rt_stime, "
						+ "(SELECT rt_etime FROM gtx_route z WHERE z.st_scode = a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_code=a.tr_code) rt_etime, "
						+ "(SELECT pr_childprice FROM gtx_price z WHERE z.st_scode=a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_room=a.tr_room) pr_childprice, "
						+ "(SELECT pr_adultprice FROM gtx_price z WHERE z.st_scode=a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_room=a.tr_room) pr_adultprice, "
						+ "rs_totalprice, rs_count, rs_passenger, tr_areano , rs_seat , tr_room "
						+ "FROM gtx_reserve a "
						+ "WHERE id='"+ id + "' AND rs_startdate='" + rs_startdate + "' AND rt_code='" + rt_code + "' AND tr_code='" + tr_code + "' ORDER BY rs_startdate ASC";
				
				pstm = con.prepareStatement(sql);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					reserveDTO rsdto = new reserveDTO();
					rsdto.setRs_code(rs.getString(1));
					rsdto.setRt_code(rs.getString(2));
					rsdto.setRs_date(rs.getString(3));
					rsdto.setRs_startdate(rs.getString(4));
					rsdto.setTr_code(rs.getString(5));
					rsdto.setSt_scode(rs.getString(6));	
					rsdto.setSt_ecode(rs.getString(7));
					rsdto.setRt_stime(rs.getString(8));
					rsdto.setRt_etime(rs.getString(9));
					rsdto.setPr_childprice(rs.getString(10));
					rsdto.setPr_adultprice(rs.getString(11));
					rsdto.setRs_totalprice(rs.getInt(12));
					rsdto.setRs_count(rs.getInt(13));
					rsdto.setRs_passenger(rs.getString(14));
					rsdto.setTr_areano(rs.getString(15));
					rsdto.setRs_seat(rs.getString(16));
					rsdto.setTr_room(rs.getString(17));
					
					a.add(rsdto);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			return a;
		}
		//--------------------------------------------------------------
		// 예약리스트 개수를 리턴하는 메서드
		public int reserveCount() {
			
			getCon();
			
			int count =0;
			
			try {
				String sql = "select count(*) from gtx_reserve";
				pstm = con.prepareStatement(sql);
				rs = pstm.executeQuery();
				
				if(rs.next()) {count = rs.getInt(1);}

			}catch (Exception e) {
				 e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			return count;
		}
		
		//--------------------------------------------------------------
		// 예약변경시 승객유형 업데이트하는 메서드	
		public void reserveChange(String rs_passenger, String rs_code, String id) {
			getCon();
			
			try{
				String sql = "update gtx_reserve set rs_passenger='"+rs_passenger+"' where rs_code='"+rs_code+"' and id='"+id+"'";
				System.out.println(sql);
				pstm = con.prepareStatement(sql);
				pstm.executeUpdate();

			}catch (Exception e) {
				 e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
		
		}
		
		//--------------------------------------------------------------
		// ID를 통해 회원이름을 출력해주는 메서드
		public String membername(String id) {
			getCon();
			
			String name="";
			
			try{
				String sql = "select name from gtx_member where id='"+ id + "'";
				pstm = con.prepareStatement(sql);
				rs=pstm.executeQuery();
				
				if(rs.next()) {
					name = rs.getString(1);
				}
				
			}catch (Exception e) {
				 e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			return name;
		}
		
		//===========================================
		// 예약 삭제 하는 메서드
		public void deleteReserve(String rt_code, String tr_code, String rs_startdate) {
			
			getCon();
			
			try {
				String sql = "delete from gtx_reserve where rt_code=? and tr_code=? and rs_startdate=?" ;
				System.out.println(sql);
				pstm = con.prepareStatement(sql);
				pstm.setString(1, rt_code);
				pstm.setString(2, tr_code);
				pstm.setString(3, rs_startdate);
				pstm.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
		}
		//===========================================
		// 예약테이블 결제전 개수 세어주는 메서드
		public int cntselect() {
			getCon();
			int cnt=0;
			
			try {
				String sql = "select COUNT(*) FROM (SELECT rs_code, rt_code, rs_date, rs_startdate, tr_code,(SELECT st_name FROM gtx_station z where z.st_code = a.st_scode) st_scode, (SELECT st_name FROM gtx_station z WHERE z.st_code = a.st_ecode) st_ecode, (SELECT rt_stime FROM gtx_route z WHERE z.st_scode = a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_code=a.tr_code) rt_stime, (SELECT rt_etime FROM gtx_route z WHERE z.st_scode = a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_code=a.tr_code) rt_etime, (SELECT pr_childprice FROM gtx_price z WHERE z.st_scode=a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_room=a.tr_room) pr_childprice, (SELECT pr_adultprice FROM gtx_price z WHERE z.st_scode=a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_room=a.tr_room) pr_adultprice, SUM(rs_totalprice) rs_totalprice, SUM(rs_count) rs_count, rs_passenger, tr_areano , rs_seat , tr_room FROM gtx_reserve a WHERE id='asdf' AND rs_startdate='2020-11-05' AND rt_code='route-02' AND tr_code='gtx-302' ORDER BY rs_startdate ASC) aaa";
				pstm = con.prepareStatement(sql);
			
				pstm.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			return cnt;
		}
		//--------------------------------------------------------------
		// 예약날짜 시간 받아오기위한 메서드
		public String nowtime(String rt_code, String tr_code, String rs_startdate) {
			getCon();
			
			String nowtime="";
			
			try{
				String sql = "select rs_date from gtx_reserve where rt_code=? and tr_code=? and rs_startdate=?";
				pstm = con.prepareStatement(sql);
				pstm.setString(1, rt_code);
				pstm.setString(2, tr_code);
				pstm.setString(3, rs_startdate);
				
				rs=pstm.executeQuery();
				
				if(rs.next()) {
					nowtime = rs.getString(1);
				}
				
			}catch (Exception e) {
				 e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			return nowtime;
		}
		
}
package com.gtx_project.gtxproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.gtx_project.gtxproject.DTO.paymentDTO;
import com.gtx_project.gtxproject.DTO.reserveDTO;

public class paymentDAO {

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
		// 결제내역 조회
		public ArrayList<paymentDTO> selectListid(String id) {
			ArrayList<paymentDTO> a = new ArrayList<>();
			
			getCon();
		
			try {
				String sql = "SELECT buy_code, rt_code, tr_code,"
								+ "(SELECT st_name FROM gtx_station z where z.st_code = a.st_scode) st_scode, "
								+ "(SELECT st_name FROM gtx_station z WHERE z.st_code = a.st_ecode) st_ecode, "
								+ "(SELECT rt_stime FROM gtx_route z WHERE z.st_scode = a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_code=a.tr_code) rt_stime, "
								+ "(SELECT rt_etime FROM gtx_route z WHERE z.st_scode = a.st_scode AND z.st_ecode=a.st_ecode AND z.tr_code=a.tr_code) rt_etime, buy_date, rs_startdate, buy_areano, buy_room, buy_seat, buy_passenger, buy_count, buy_totalprice, id, buy_refundyn, buy_refundprice "
								+ "FROM gtx_buy a where id= ? ORDER BY rs_startdate ASC";
								//+ "FROM gtx_buy a where id='"+ id + "' ORDER BY rs_startdate ASC";
				pstm = con.prepareStatement(sql);
				pstm.setString(1,  id);
				rs = pstm.executeQuery();
				
			while(rs.next()) {
				paymentDTO pdto = new paymentDTO();
				
				pdto.setBuy_code(rs.getString(1));
				pdto.setRt_code(rs.getString(2));
				pdto.setTr_code(rs.getString(3));
				pdto.setSt_scode(rs.getString(4));
				pdto.setSt_ecode(rs.getString(5));
				pdto.setRt_stime(rs.getString(6));
				pdto.setRt_etime(rs.getString(7));
				pdto.setBuy_date(rs.getString(8));
				pdto.setRs_startdate(rs.getString(9));
				pdto.setBuy_areano(rs.getString(10));
				pdto.setBuy_room(rs.getString(11));
				pdto.setBuy_seat(rs.getString(12));
				pdto.setBuy_passenger(rs.getString(13));
				pdto.setBuy_count(rs.getInt(14));
				pdto.setBuy_totalprice(rs.getInt(15));
				pdto.setId(rs.getString(16));
				pdto.setBuy_refundyn(rs.getString(17));
				pdto.setBuy_refundprice(rs.getInt(18));			
				
				a.add(pdto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
			return a;
		}
		
		
		//--------------------------------------------------------------
		// 구매 개수를 리턴하는 메서드
		public int paymentCount() {
			
		getCon();
		
		int count =0;
		
		try {
			String sql = "select count(*) from gtx_buy";
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
		// 예약테이블에 내용 삭제 하고 구매테이블에 내용 삽입하는 메서드
		public void insertdel(reserveDTO rsdto, String rt_code, String tr_code, String rs_startdate) {
			
			getCon();

			try {
				

				String insertsql = " INSERT INTO gtx_buy (buy_code, rt_code, tr_code, st_scode, st_ecode, buy_date, rs_startdate, buy_areano, buy_room, buy_seat, buy_passenger,buy_count, buy_totalprice, id, buy_refundyn, buy_refundprice )"
						+ "SELECT rs_code, rt_code, tr_code, st_scode, st_ecode, rs_date, rs_startdate, tr_areano, tr_room, rs_seat, rs_passenger, rs_count, rs_totalprice, id, rs_refundyn, rs_refundprice  FROM gtx_reserve WHERE rt_code='"+rt_code+"' AND tr_code='"+tr_code+"' AND rs_startdate='"+rs_startdate+"'";					
				System.out.println(insertsql);
				System.out.println(rsdto.getRs_code());
				
				pstm = con.prepareStatement(insertsql);
				int rsnu = pstm.executeUpdate();
				
				System.out.println("Test : " + rsnu);
				String delsql = "delete from gtx_reserve where rt_code='"+rt_code+"' AND tr_code='"+tr_code+"' AND rs_startdate='"+rs_startdate+"'";
				pstm = con.prepareStatement(delsql);
				pstm.executeUpdate();

			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
		}
		
}

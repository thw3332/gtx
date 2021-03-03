package com.gtx_project.gtxproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.gtx_project.gtxproject.DTO.seatDTO;
import com.gtx_project.gtxproject.DTO.ticketDTO;
import com.gtx_project.gtxproject.DTO.noticeDTO;

public class ticketDAO {

	String url = "jdbc:mariadb://127.0.0.1:3306/GTXDB";
	String id = "root";
	String pw = "root";

	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	//-----------------------------------------------------
	public void getCon() {

		try {
			// ������DB ����̹� �ε� �Ѵ�.
			Class.forName("org.mariadb.jdbc.Driver");
			// ������DB (�������� :mariadb://������I host P�ּ� : ��Ʈ��ȣ/DB �̸� ","���̵�","�н�����") ����
			con = DriverManager.getConnection(url, id, pw);
			/*con = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/DB","root","root");*/
			System.out.println("DB ���� �Ϸ�");	
		}catch(Exception e) {
			System.out.println("JDBC ����̹� �ε� ����");
			
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
	// �������� ��ȸ(section ȭ��)
	public ArrayList<noticeDTO> getAllNotice() {
		
		getCon();
		
		ArrayList<noticeDTO> al = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM gtx_notice ORDER BY nt_num DESC";
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				noticeDTO ndto = new noticeDTO();
				
				ndto.setNt_num(rs.getInt(1));
				ndto.setNt_title(rs.getString(2));
				ndto.setNt_content(rs.getString(3));
				ndto.setNt_date(rs.getString(4));
				ndto.setId(rs.getString(5));
				al.add(ndto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return al;
	}
	//----------------------------------------------------------
	// ������ ��ȸ(section ȭ��, ������ ���� ȭ��)
	public ArrayList<ticketDTO> getAllTicket(String startstation, String endstation, String starttime) {
		
		getCon();
		
		ArrayList<ticketDTO> al = new ArrayList<>();
		
		try {
			String sql = "SELECT rt_num, rt_code, st_scode, (SELECT st_name FROM gtx_station z WHERE z.st_code = a.st_scode) st_sname, "
					+ "st_ecode, (SELECT st_name FROM gtx_station z WHERE z.st_code = a.st_ecode) st_ename, rt_stime, rt_etime, rt_leadtime, tr_code "
					+ "FROM gtx_route a WHERE st_scode = ? AND st_ecode = ? AND substr(rt_stime, 1, 2) >= ? ORDER BY rt_num ASC";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, startstation);
			pstm.setString(2, endstation);
			pstm.setString(3, starttime);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				ticketDTO tdto = new ticketDTO();
				
				tdto.setRt_num(rs.getInt(1));
				tdto.setRt_code(rs.getString(2));
				tdto.setSt_scode(rs.getString(3));
				tdto.setSt_sname(rs.getString(4));
				tdto.setSt_ecode(rs.getString(5));
				tdto.setSt_ename(rs.getString(6));
				tdto.setRt_stime(rs.getString(7));
				tdto.setRt_etime(rs.getString(8));
				tdto.setRt_leadtime(rs.getString(9));
				tdto.setTr_code(rs.getString(10));
				al.add(tdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return al;
	}
	//--------------------------------------------------------------
	// ��� ���� ��ȸ
	public String getStartStation(String startstation) {
		
		getCon();
		
		String sname = "";
		
		try {
			String sql = "SELECT st_name FROM gtx_station WHERE st_code = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, startstation);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				sname = rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return sname;
	}
	//-----------------------------------------------------------
	// ��� ���� ��ȸ
	public String getEndStation(String endstation) {
		
		getCon();
		
		String ename = "";
		
		try {
			String sql = "SELECT st_name FROM gtx_station WHERE st_code = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, endstation);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				ename = rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return ename;
	}
	//----------------------------------------------------------
	// ���� ĭ �� ���� �¼� ��ȸ
	public ArrayList<String> getTrainReserveSeat(String trcode, String st_scode, String st_ecode, String startdate, String hocha) {
		
		getCon();
		
		ArrayList<String> al = new ArrayList<>();
		
		try {
			String sql = "SELECT aa.rs_seat FROM gtx_reserve aa INNER JOIN gtx_train bb ON (aa.tr_code = bb.tr_code "
					+ "AND aa.tr_areano = bb.tr_areano AND aa.tr_room = bb.tr_room AND aa.tr_code = ? AND aa.st_scode = ? "
					+ "AND aa.st_ecode = ? AND aa.rs_startdate = ? AND aa.tr_areano = ?)";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, trcode);
			pstm.setString(2, st_scode);
			pstm.setString(3, st_ecode);
			pstm.setString(4, startdate);
			pstm.setString(5, hocha);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				al.add(rs.getString(1));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return al;
	}
	//--------------------------------------------------------------------------------------
	// ���� ĭ �� ���ſϷ� �¼� ��ȸ
	public ArrayList<String> getTrainBuySeat(String trcode, String st_scode, String st_ecode, String startdate, String hocha) {
		
		getCon();
		
		ArrayList<String> al = new ArrayList<>();
		
		try {
			String sql = "SELECT aa.buy_seat FROM gtx_buy aa INNER JOIN gtx_train bb ON (aa.tr_code = bb.tr_code "
					+ "AND aa.buy_areano = bb.tr_areano AND aa.buy_room = bb.tr_room AND aa.tr_code = ? AND aa.st_scode = ? "
					+ "AND aa.st_ecode = ? AND aa.rs_startdate = ? AND aa.buy_areano = ?)";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, trcode);
			pstm.setString(2, st_scode);
			pstm.setString(3, st_ecode);
			pstm.setString(4, startdate);
			pstm.setString(5, hocha);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				al.add(rs.getString(1));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return al;
	}
	//---------------------------------------------------------------------------------------------
	// ���� ��� ��ȣ ��ȸ
	public String getRoute(String trcode, String st_scode, String st_ecode) {
		
		getCon();
		
		String rt = "";
		
		try {
			String sql = "SELECT rt_code FROM gtx_route WHERE tr_code= ? AND st_scode = ? AND st_ecode = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, trcode);
			pstm.setString(2, st_scode);
			pstm.setString(3, st_ecode);
			rs = pstm.executeQuery();
			if(rs.next()) {
				rt = rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return rt;
	}
	//------------------------------------------------------------------------------------------------
	// � ��� ��ȸ
	public int getAdultPrice(String st_scode, String st_ecode, String tr_room) {
		
		getCon();
		
		int price = 0;
		
		try {
			String sql = "SELECT REPLACE(pr_adultprice, ',', '') FROM gtx_price WHERE st_scode = ? AND st_ecode = ? AND tr_room = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, st_scode);
			pstm.setString(2, st_ecode);
			pstm.setString(3, tr_room);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				price = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return price;
	}
	//------------------------------------------------------------------------------------------------
	// ��� ��� ��ȸ
	public int getChildPrice(String st_scode, String st_ecode, String tr_room) {
		
		getCon();
		
		int price = 0;
		
		try {
			String sql = "SELECT REPLACE(pr_childprice, ',', '') FROM gtx_price WHERE st_scode = ? AND st_ecode = ? AND tr_room = ?";
			System.out.println(sql);
			pstm = con.prepareStatement(sql);
			pstm.setString(1, st_scode);
			pstm.setString(2, st_ecode);
			pstm.setString(3, tr_room);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				price = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return price;
	}
	//----------------------------------------------------------------------------------------
	// �����ȣ �� ���Ź�ȣ �� ������ ��ȣ ���ϱ�
	public String getLastNumber() {
		
		getCon();
		
		String last = "";
		
		try {
			String sql = "SELECT MAX(rs_code) FROM (SELECT rs_code FROM gtx_reserve UNION SELECT buy_code FROM gtx_buy) aaa ORDER BY rs_code ASC";
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				last = rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		return last;
	}
}

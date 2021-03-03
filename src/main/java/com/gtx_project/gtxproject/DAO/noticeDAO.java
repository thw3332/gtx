package com.gtx_project.gtxproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.gtx_project.gtxproject.DTO.boardDTO;
import com.gtx_project.gtxproject.DTO.noticeDTO;

public class noticeDAO {

	String url = "jdbc:mariadb://127.0.0.1:3306/GTXDB";
	String id = "root";
	String pw = "root";

	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	//==============================================
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
	//��ü �Խñ��� ������ ���ϴ� �޼���
		public int getAllCount(){
			
			getCon();
			
			int count = 0;
			
			try {
				
				String sql = "select count(*) from gtx_notice";
				pstm = con.prepareStatement(sql);
				rs = pstm.executeQuery();
				
				if(rs.next()){
					count = rs.getInt(1);
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				close(con, pstm, rs);
			}
			return count;
		}
		//==============================================
		//��� ȭ�鿡 ������ �ֽ� �� 5���� �����Ͽ� �����ϴ� �޼���
		public ArrayList<noticeDTO> noticeAllboard(int startRow){
			
			getCon();
			
			ArrayList<noticeDTO> a = new ArrayList<noticeDTO>();
			
			try{
				String sql = "select * from gtx_notice order by nt_num desc limit ?,5";
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, startRow -1); 
				
				rs = pstm.executeQuery();
				
				while(rs.next()){
					noticeDTO ndto = new noticeDTO();
					
					ndto.setNt_num(rs.getInt(1));
					ndto.setNt_title(rs.getString(2));
					ndto.setNt_content(rs.getString(3));
					ndto.setNt_date(rs.getString(4));
					ndto.setId(rs.getString(5));
				
					a.add(ndto);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				close(con, pstm, rs);
			}
			return a;
		}
		//==============================================
		// �Խñ� �μ�Ʈ �ϴ� �޼���
		public void  noticeinsert(noticeDTO ndto){
			
			getCon();
				
			int num = 0;
			
			try {

				//==================
				String numsql = "select max(nt_num) from gtx_notice";
				pstm = con.prepareStatement(numsql);
				rs = pstm.executeQuery();
				
				if(rs.next()){
					num = rs.getInt(1) + 1;
				}
				//===================
				
				String sql = "insert into gtx_notice(nt_num, nt_title, nt_content, nt_date, id) values(?,?,?,now(),?)";
				pstm = con.prepareStatement(sql);
					
				pstm.setInt(1, num);
				pstm.setString(2, ndto.getNt_title());
				pstm.setString(3, ndto.getNt_content());
				pstm.setString(4, ndto.getId());

				pstm.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				close(con, pstm, rs);
			
			}
		}
		
		//==============================================
		//�ϳ��� �Խñ��� ��ȸ�ϴ� �޼��� �ۼ�
		public noticeDTO getOnenotice(int nt_num){
			
			getCon();
			
		noticeDTO ndto = new noticeDTO();
				
			try {
				// �ϳ��� �Խñ� ��ȸ
				String sql = "select * from gtx_notice where nt_num = ?";
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, nt_num);
				rs = pstm.executeQuery();
				
				if(rs.next()){
					
					ndto.setNt_num(rs.getInt(1));
					ndto.setNt_title(rs.getString(2));
					ndto.setNt_content(rs.getString(3));
					ndto.setNt_date(rs.getString(4));
					ndto.setId(rs.getString(5));
					
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				close(con, pstm, rs);
			}
			return ndto;
		}
		//===========================================
		//���� �ϴ� �޼���
		public void noticeDelete(int nt_num) {
			
			getCon();
			
			try {
				String sql = "delete from gtx_notice where nt_num=?";
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, nt_num);
				
				pstm.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
		}
		//===========================================
		// �����ϴ� �޼���
		public void Updatenotice(noticeDTO ndto) {
			getCon();
			
			try {
				String sql = "update gtx_notice set nt_title = ?, nt_content =? where nt_num =? ";
				
				pstm = con.prepareStatement(sql);
				pstm.setString(1, ndto.getNt_title());
				pstm.setString(2, ndto.getNt_content());
				pstm.setInt(3, ndto.getNt_num());
					
				pstm.executeUpdate();
				
			}catch (Exception e) {
				 e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			
		}
		//===========================================
		//�˻��ϴ� �޼���
		public ArrayList<noticeDTO> search(String search, int startRow){
			ArrayList<noticeDTO> a = new ArrayList<noticeDTO>();
			
			getCon();
			
			try{
				String sql = "select * from gtx_notice where id like '%" + search + "%' or nt_title like '%" + search + "%' order by nt_num desc limit ?,5";
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, startRow-1);
				rs = pstm.executeQuery();
				
				while(rs.next()){
					
					noticeDTO ndto = new noticeDTO();
					ndto.setNt_num(rs.getInt(1));
					ndto.setNt_title(rs.getString(2));
					ndto.setNt_content(rs.getString(3));
					ndto.setNt_date(rs.getString(4));
					ndto.setId(rs.getString(5));
					a.add(ndto);
				}
				
			}catch (Exception e) {
				 e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			return a;
		}
	
}

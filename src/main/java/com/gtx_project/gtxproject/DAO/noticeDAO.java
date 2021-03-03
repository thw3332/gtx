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
	//전체 게시글의 개수를 구하는 메서드
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
		//모든 화면에 보여질 최신 글 5개씩 추출하여 리턴하는 메서드
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
		// 게시글 인서트 하는 메서드
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
		//하나의 게시글을 조회하는 메서드 작성
		public noticeDTO getOnenotice(int nt_num){
			
			getCon();
			
		noticeDTO ndto = new noticeDTO();
				
			try {
				// 하나의 게시글 조회
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
		//삭제 하는 메서드
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
		// 수정하는 메서드
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
		//검색하는 메서드
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

package com.gtx_project.gtxproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.gtx_project.gtxproject.DTO.boardDTO;
import com.gtx_project.gtxproject.DTO.memberDTO;

public class boardDAO {

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
			
			String sql = "select count(*) from gtx_qna";
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
	public ArrayList<boardDTO> getAllboard(int startRow){
		
		getCon();
		
		ArrayList<boardDTO> a = new ArrayList<boardDTO>();
		 
		try{
			String sql = "select * from gtx_qna order by ref desc, re_level asc limit ?,5";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, startRow-1);
			
			rs = pstm.executeQuery();
			
			while(rs.next()){
				boardDTO bdto = new boardDTO();
				bdto.setQna_num(rs.getInt(1));
				bdto.setQna_title(rs.getString(2));
				bdto.setQna_content(rs.getString(3));
				bdto.setQna_date(rs.getString(4));
				bdto.setId(rs.getString(5));
				bdto.setRef(rs.getInt(6));
				bdto.setRe_step(rs.getInt(7));
				bdto.setRe_level(rs.getInt(8));
				a.add(bdto);
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
	public void  insert(boardDTO bdto){
		
		getCon();
		
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		int num = 0;
		try{
				
			String refsql = "select max(ref) from gtx_qna";
			pstm = con.prepareStatement(refsql);
			rs = pstm.executeQuery();
			
			if(rs.next()){
				ref = rs.getInt(1) + 1;
			}
			
			String numsql = "select max(qna_num) from gtx_qna";
			pstm = con.prepareStatement(numsql);
			rs = pstm.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}
			
			String sql = "insert into gtx_qna(qna_num, qna_title, qna_content, id, qna_date, ref, re_step, re_level)"
					+ "values(?,?,?,?,now(),?,?,?)";
			pstm = con.prepareStatement(sql);
			
			pstm.setInt(1, num);
			pstm.setString(2, bdto.getQna_title());
			pstm.setString(3, bdto.getQna_content());
			pstm.setString(4, bdto.getId());
			pstm.setInt(5, ref);	
			pstm.setInt(6, re_step);	
			pstm.setInt(7, re_level);
			
			pstm.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(con, pstm, rs);
		}
		
	}
	//==============================================
	//하나의 게시글을 조회하는 메서드 작성
	//게시글 일어 들일 때 조회수를 증가 시키는 쿼리도 같이 작성
	public boardDTO getOneboard(int qna_num){
		
		getCon();
		
		boardDTO bdto = new boardDTO();
			
		try {
			// 하나의 게시글 조회
			String sql = "select * from gtx_qna where qna_num = ?";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, qna_num);
			rs = pstm.executeQuery();
			
			if(rs.next()){
				bdto.setQna_num(rs.getInt(1));
				bdto.setQna_title(rs.getString(2));
				bdto.setQna_content(rs.getString(3));
				bdto.setQna_date(rs.getString(4));
				bdto.setId(rs.getString(5));
				bdto.setRef(rs.getInt(6));
				bdto.setRe_step(rs.getInt(7));
				bdto.setRe_level(rs.getInt(8));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(con, pstm, rs);
		}
		return bdto;
	}
	//==============================================
	// 답변글을 저장하는 메서드
	public void reInsertBoard(boardDTO bdto) {
		
		getCon();
		
		int num = 0;
		
		try{
			String resql = "update gtx_qna set re_level = re_level + 1 where ref = ? and re_level > ?";
			System.out.println(resql);
			pstm = con.prepareStatement(resql);
			//? 대응 값
			pstm.setInt(1, bdto.getRef()); // 새로운 글이 아니라 답글이기에 기종의 값을 입력
			pstm.setInt(2, bdto.getRe_level());
			
			pstm.executeUpdate();
			
			
			//==================
			String numsql = "select max(qna_num) from gtx_qna";
			pstm = con.prepareStatement(numsql);
			rs = pstm.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}
			//===================
			
			
			
			String sql = "insert into gtx_qna(qna_num, qna_title, qna_content, id, qna_date, ref, re_step, re_level)"
					+ "values(?,?,?,?,now(),?,?,?)";
			System.out.println(sql);
			pstm = con.prepareStatement(sql);
			
			pstm.setInt(1, num);
			pstm.setString(2, bdto.getQna_title());
			pstm.setString(3, bdto.getQna_content());
			pstm.setString(4, bdto.getId());
			pstm.setInt(5, bdto.getRef());	
			pstm.setInt(6, bdto.getRe_step() + 1);
			pstm.setInt(7, bdto.getRe_level() + 1);	
			
			pstm.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(con, pstm, rs);
		}
	}
	//===========================================
	//삭제 하는 메서드
	public void Deleteqna(int qna_num) {
		
		getCon();
		
		try {
			String sql = "delete from gtx_qna where qna_num=?";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, qna_num);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
	}
	//===========================================
	//수정 하는 메서드
	public void Updateqna(boardDTO bdto) {
		getCon();
		
		try {
			String sql = "update gtx_qna set qna_title = ?, qna_content =? where qna_num =? ";
			
			pstm = con.prepareStatement(sql);
			pstm.setString(1, bdto.getQna_title());
			pstm.setString(2, bdto.getQna_content());
			pstm.setInt(3, bdto.getQna_num());
				
			pstm.executeUpdate();
			
		}catch (Exception e) {
			 e.printStackTrace();
		}finally {
			close(con, pstm, rs);
		}
		
	}
	//===========================================
		//검색하는 메서드
		public ArrayList<boardDTO> search(String search, int startRow){
			ArrayList<boardDTO> a = new ArrayList<boardDTO>();
			
			getCon();
			
			try{
				String sql = "select * from gtx_qna where id like '%" + search + "%' or qna_title like '%" + search + "%' order by qna_num desc limit ?,5";
				System.out.println(sql);
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, startRow-1);
				rs = pstm.executeQuery();
				
				while(rs.next()){ 
					boardDTO bdto = new boardDTO();
					bdto.setQna_num(rs.getInt(1));
					bdto.setQna_title(rs.getString(2));
					bdto.setQna_content(rs.getString(3));
					bdto.setQna_date(rs.getString(4));
					bdto.setId(rs.getString(5));
					bdto.setRef(rs.getInt(6));
					bdto.setRe_step(rs.getInt(7));
					bdto.setRe_level(rs.getShort(8));
					a.add(bdto);
				}
				
			}catch (Exception e) {
				 e.printStackTrace();
			}finally {
				close(con, pstm, rs);
			}
			return a;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
}

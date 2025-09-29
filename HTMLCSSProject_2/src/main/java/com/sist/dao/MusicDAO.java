package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.MusicVO;

public class MusicDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MusicDAO dao;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	public MusicDAO() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	public static MusicDAO newInstance() {
		
		if(dao==null)
			dao=new MusicDAO();
		
		return dao;
	}
	
	public void getConnection() {
		
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	public void disConnection() {
		
		try {
			if(ps!=null)
				ps.close();
			if(conn!=null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 클래스화 => 라이브러리 (Mybatis/JPA)
	/*
	 * public List<MusicVO> musicListData(int cno){
	 * 	
	 * 		return my.selectList(1);
	 * }
	 * => List<MusicVO> finsAll();
	 * 					---------
	 * 					findByCno
	 * 					
	 */
	public List<MusicVO> musicListData(int cno){
		List<MusicVO> list = new ArrayList<MusicVO>();
		
		try {
			getConnection();

			String sql = "SELECT no, cno, poster, title, singer "
					+ "FROM genie_music "
					+ "WHERE cno = ?";

			ps=conn.prepareStatement(URL);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				MusicVO vo = new MusicVO();

				vo.setNo(rs.getInt(1));
				vo.setCno(rs.getInt(2));
				vo.setPoster(rs.getString(3));
				vo.setTitle(rs.getString(4));
				vo.setSinger(rs.getString(5));
				list.add(vo);

			}
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		
		
		return list;
	}
	
	// public List<MusicVO> musicListData(int cno){
	// 	List<MusicVO> list = new ArrayList<MusicVO>();
		
	// 	try {
	// 		String sql = "";
			
	// 		ps=conn.prepareStatement(URL);
			
			
			
	// 	} catch (Exception e) {
	// 		e.printStackTrace();
	// 	} finally {
	// 		disConnection();
	// 	}
		
		
	// 	return list;
	// }
	
	
	
	
	
}

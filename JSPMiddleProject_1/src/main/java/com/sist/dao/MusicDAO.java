package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.MusicVO;

public class MusicDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			ssf = CreateSqlSessionFactory.getSsf();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	public static List<MusicVO> musicListData(Map map) {
		
		SqlSession session = ssf.openSession();
		List<MusicVO> list = session.selectList("musicListData",map);
		session.close();
		return list;
	}
	
	public static int musicTotalData() {
		
		SqlSession session = ssf.openSession();
		int total = session.selectOne("musicTotalData");
		
		session.close();
		
		return total;
	}
	
	public static MusicVO musicDetailData(int no) {
		
		SqlSession session = ssf.openSession();
		MusicVO vo = session.selectOne("musicDetailData",no);
		session.close();
		
		return vo;
	}
	
}

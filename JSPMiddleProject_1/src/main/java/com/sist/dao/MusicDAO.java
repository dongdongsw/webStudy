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
	/*
		 <select id="musicFindListData" resultType="MusicVO" parameterType="hashmap">
			SELECT no, cno, rank, idcrement, title, singer, poster, state
		</select>
		<select id="musicTypeListData" resultType="MusicVO" parameterType="hashmap">
			SELECT no, cno, rank, idcrement, title, singer, poster, state
			FROM genie_music
			WHERE cno IN(1,2,3,4,5,6,7)
			ORDER BY no ASC
			OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
		</select>
		<select id="musicTypeTotalPage" resultType="MusicVO" parameterType="int">
			SELECT CEIL(COUNT(*)/12.0)
			FROM genie_music
			WHERE cno IN(1,2,3,4,5,6,7)
		</select>
	 */
	public static List<MusicVO> musicTypeListData(Map map) {
		List<MusicVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("musicTypeListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public static int musicTypeTotalPage(int cno) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("musicTypeTotalPage",cno);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	public static List<MusicVO> musicFindListData(Map map){
		List<MusicVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("musicFindListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
}

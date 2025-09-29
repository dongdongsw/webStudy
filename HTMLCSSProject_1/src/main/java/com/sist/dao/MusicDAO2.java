package com.sist.dao;

import java.util.*;
import java.io.*;
import com.sist.vo.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MusicDAO2 {
	private static SqlSessionFactory ssf;
	
	//DAO
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	/*
	 * selectList() while(rs.next())
	 * selectOne() rs.next()	=> 상세보기 / count(*), pwd
	 * 	ㄴ selectList 로 받아도 되는데
	 * 		return => list.get(0) 이렇게 받아야함
	 * 		
	 * --------------- row 가 몇개
	 * insert()	
	 * update()
	 * delete() 
	 * 
	 */
	
	public static List<MusicVO> musicListData(int cno){
		return ssf.openSession().selectList("musicListData",cno);
	}
	
}

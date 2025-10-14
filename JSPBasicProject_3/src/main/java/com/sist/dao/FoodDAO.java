package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.FoodVO;

public class FoodDAO {
	private static SqlSessionFactory ssf;
	
	static{
		//XML 파싱
		try {
			//1. xml 읽어 오기
			Reader reader = Resources.getResourceAsReader("Config.xml");
			
			//src/main/java => classpath => 자동으로 인식
			//2. 파싱(등록된 데이터 읽기)
			ssf= new SqlSessionFactoryBuilder().build(reader);
			//map에 저장 => id SQL => 
			/*
			 <select id="foodTotalPage" resultType="int" parameterType="String"> 
				SELECT CEIL(count(*)/20.0)
				FROM menupan_food
				WHERE type LIKE '%||#{type}||%';
			 </select>
			 
			 map.put("foodTotalList")SELECT CEIL(count(*)/20.0)
			FROM menupan_food
			WHERE type LIKE '%||#{type}||%';
			 
			 */
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//기능 
	//1. 목록
	/*
	 <select id="foodListData" resultType="FoodVO" parameterType="hashmap"> 
		SELECT + INDEX_ASC(menupan_food mf_fno_pk)fno, poster, name, address , type
		FROM Menupan_food
		WHERE type LIKE '%||#{type}||%'
		OFFSET #{start} ROWS FETCH NEXT 20 ROWS ONLY;

	</select>
	 */
	
	public static List<FoodVO> foodListData(Map map){
		
		SqlSession session = ssf.openSession(); // getConnection
		List<FoodVO> list = session.selectList("foodListData",map);
		session.close();
		
		return list;
	}
	
	/*
	 <select id="foodTotalPage" resultType="int" parameterType="String"> 
			SELECT CEIL(count(*)/20.0)
			FROM menupan_food
			WHERE type LIKE '%||#{type}||%'
	 </select>
	 */
	public static int foodTotalPage(String type) {
		
		SqlSession session = ssf.openSession();
		int total=session.selectOne("foodTotalPage",type);
		session.close();
		
		return total;
	}
	
	/*
	  <select id="foodDetailData" resultType="FoodVO" parameterType="int">
	 	SELECT * FROM menupan_food
	 	WHERE fno=#{fno}
	  </select>
	 */
	public static FoodVO foodDetailData(int fno) {
		SqlSession session = ssf.openSession();
		FoodVO vo = session.selectOne("foodDetailData",fno);
		session.close();
		
		return vo;
	}
	
	
}

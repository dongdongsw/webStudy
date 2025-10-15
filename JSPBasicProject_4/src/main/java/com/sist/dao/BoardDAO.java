package com.sist.dao;
/*
 * 1. 목록	-----
 * 				 |	sendRedirect
 * 2. 글쓰기 	-----
 * 3. 상세보기-----
 * 				 | 
 * 4. 수정	-----
 * 5. 삭제	---------- 목록
 */

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.BoardVO;

import java.io.*;

public class BoardDAO {

	private static SqlSessionFactory ssf;
	static {
		//xml을 파싱 => 저장된 데이터 읽기
		try {
			//XML 파일 읽기
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
			//map에 저장 => key = id value = SQL
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	//목록 출력
	/*
		 SELECT no,subject, name, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday,
				hit, num
		 FROM (SELECT no, subject, name, regdate, hit, rownum as num
			FROM (SELECT no,subject, name, regdate, hit
				FROM jspBoard ORDER BY no DESC))
		 WHERE num BETWEEN #{start} AND #{end}
	 */
	public static List<BoardVO> boardListData(Map map){
		SqlSession session = ssf.openSession();
		List<BoardVO> list = session.selectList("boardListData",map);
		session.close();
		
		return list;
	}
	
	/*
	 	SELECT CEIL(COUNT(*)/10.0) FROM jspBoard
	 */
	public static int boardTotalPage(){
		SqlSession session = ssf.openSession();
		int total = session.selectOne("boardTotalPage");
		session.close();
		
		return total;
		
	}
	
	/*
	 	<insert id="boardInsert" parameterType="BoardVO">
			<selectKey keyProperty="no" resultType="int" order="BEFORE">
				SELECT NVL(MAX(no)+1,1) as no FROM jspBoard
			</selectKey>
			INSERT INTO jspBoard(no,name,subject,content,pwd)
				VALUES(#{no},#{name}.#{subject), .#{content}, #{pwd})	
		</insert>
	 */
	public static void boardInsert(BoardVO vo) {
		SqlSession session = ssf.openSession(true); //auto커밋을 할 수 도 있고 직접 쓸 수도 있다
		session.insert("boardInsert",vo);
//		session.commit();
		session.close();
		
	}
	
	/*
	 <update id="hitIncrement" parameterType="int">
		UPDATE jspBoard SET
		hit = hit + 1
		WHERE no = #{no}
	</update>
	<select id="boardDetailData" resultType="BoardVO" parameterType="int">
		SELECT no, name, subject, content, hit, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') AS dbday
		FROM jspBoard
		WHERE no=#{no}
	</select>
	 */
	public static BoardVO boardDetailData(int no) {
		SqlSession session = ssf.openSession();
		//조회수 증가
		session.update("hitIncrement",no);
		session.commit(); //update + select 이렇게 여러개가 나오면 지금의 session.commit를 사용한다 아니면 true해주면 된다
		BoardVO vo = session.selectOne("boardDetailData",no);
		session.close();
		return vo;
	}
	
	
	/*
		 <select id="boardGetPassword" resultType="String" parameterType="int">
			SELECT pwd FROM jspBoard
			WHERE no=#{no}
		</select>
		<select id="boardUpdateData" resultType="BoardVO" parameterType="int">
			SELECT no, name, subject, content
			FROM jspBard;
			WHERE no=#{no}
		</select>
	 */
	public static BoardVO boardUpdateData(int no) {
		SqlSession session = ssf.openSession();
		
		session.commit(); 
		BoardVO vo = session.selectOne("boardUpdateData",no);
		session.close();
		return vo;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

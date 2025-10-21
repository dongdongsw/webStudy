package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;

public class ReplyDAO {
	private static SqlSessionFactory ssf;
	
	static {
		
		ssf = CreateSqlSessionFactory.getSsf();
		
	}
	
	/*
		 <select id="replynsert" parameterType="com.sist.vo.ReplyVO">
			INSERT INTO reply(rno, fno, id, name, msg)
			VALUES(re_rno_seq.nextval,  #{fno}, #{id}, #{name}, #{msg})
			<!-- 
				#{start} map = map.get("start")
				========== map의 key
				#{id}
				========== vo = vo.getId() 
			 -->
		</select>
		<select id="replyListData" resultType="com.sist.vo.ReplyVO" parameterType="int">
			SELECT rno, fno, id, name, msg, 
				TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') as dbday
			FROM reply
			WHERE fno=#{fno}
		</select>
	 */
	public static void replyInsert(ReplyVO vo) {
		
		SqlSession session = ssf.openSession(true);
		session.insert("replyInsert",vo);
		session.close();
		
	}
	
	/*
	 * 		selectOne()
	 * 		ReplyVO vo = new ReplyVO();
	 * 		vo.setId(rs.getString(id))
	 * 		...
	 * 		
	 * 		selectList()
	 * 		while(rs.next()){
	 * 			ReplyVO vo = new ReplyVO();
	 * 			vo.setId(rs.getString(id))
	 * 		}
	 */
	
	public static List<ReplyVO> replyListData(int fno){
		
		SqlSession session = ssf.openSession();
		List<ReplyVO> list = session.selectList("replyListData",fno);
		session.close();
		
		return list;
		
	}
	
	/*
		<delete id="replyDelete" parameterType="int">
			DELECT FROM reply
			WHERE rno=#{rno}
		</delete>
		JSP => 링크
	 */
	public static void replyDelete(int rno) {
		SqlSession session = ssf.openSession();
		session.delete("replyDelete",rno);
		session.commit();
		session.close();
		
		
	}
	
}

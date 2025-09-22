package com.sist.dao;

import java.util.*;
import java.sql.*;

/*
 * JDBC 
 * 	1. 드라이버 등록
 * 	   ------
 * 		thin : 연결만 담당 (무료)
 * 		oci : 드라이버 안에 오라클의 모든 데이터를 추가한 다음에 사용
 * 				(유료) => 오라클보다 비싸다
 * 		Class.forName("oracle.jdbc.driver.OracleDriver")
 * 		=> 드라이버는 소프트웨어로 되어있다
 * 		=> 한번만 연결ㄹ : 생성자에서 주로 연결
 *	2. 오라클 연결
 *		Connection conn = DriverManager.getConnection(URL,username, password)
 *						  ------------- 해당 드라이버를 연결
 *			=> 오라클 : oracle.jdbc.driver.OracleDriver
 *			=> MySQL : com.mysql.cj.jdbc.Driver
 * 	3. 오라클로 SQL 문장 전송
 * 		Statement
 * 
 * 		PreparedStatement : SQL 문장 전송
 * 		----------- 대입하는 데이터를 나중 , 동시에 전송
 * 		String name, sex, address, phone;
 * 		int age;
 * 		sql = "INSERT INTO member VALUES('"+name+"','"+sex+"','"+address+"','"+phone+"','"+age+")"
 * 		sql = "INSERT INTO member VALUES(?,?,?,?,?)"
 * 
 * 		CallableStatement : Procedure 호출
 * 	
 * 	4. 결과 값
 * 		ResultSet rs = ps.executeQuery()
 * 					    -----------------SELECT 
 * 		int count = ps.executeUpdate()
 * 						------------------- INSERT / UPDATE / DELETE
 * 						=> COMMIT() 포함
 * 						=> 정상 수행 1, 비정상 수행 0
 * 		ResultSet 구조	
 * 		--------------------------------------------------------
 * 		id		name		sex			age			birthday
 * 		--------------------------------------------------------
 * 		aaa		홍길동		남자			20			20/01/01
 * 		--------------------------------------------------------
 * 		aaa		홍길동		남자			20			20/01/01
 * 		--------------------------------------------------------
 * 		aaa		홍길동		남자			20			20/01/01
 * 		--------------------------------------------------------
 * 		aaa		홍길동		남자			20			20/01/01
 * 		--------------------------------------------------------
 * 
 * 		rs.close()
 * 		ps.close()
 * 		conn.close()
 * 		
 * 		-----------------------------------------
 * 		SELECT => SQL / VO
 * 				  --------
 * 					while / no while
 * 					selectList selectOne
 * 
 * 		INSERT / UPDATE / DELETE
 * 				=> SQL / VO 
 * 					insert() / delete() / update()
 */

public class TestDAO {

	private Connection conn;
	private PreparedStatement ps;
	// 변경 사항이 없다ㅁ
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	/*
	 * 	jdbc:업체명:@IP:port:database이름
	 * 	jdbc:mysql:@localhost:3306:mydb
	 * 
	 * 
	 * 
	 */
	// 각 user 당 1개의 DAO를 사용이 가능 => 싱글턴
	public static TestDAO dao;
	
	// 드라이버  등록
	public TestDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// ojdbc11 => oracle.jdbc.OracleDriver
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 싱글톤 연결 => Spring : 등록한 모든 클래스(싱글턴)
	public static TestDAO newInstance() {
		if(dao == null) {
			dao = new TestDAO();
		}
		return dao;
	}
	
	// 연결 
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL,"hr","happy");
		} catch (Exception ex) {
			// TODO: handle exception
		}
	}
	
	//해제
	public void disConnection() {
		try {
			if(ps!=null) ps.close(); //송수신
			if(conn!=null) conn.close(); // 전화
		} catch (Exception ex) {
			// TODO: handle exception
		}
	}
	///////////////////// 모든 DAO 공통사항
	//기능별 처리
	/*
	 * 	인덱스를 이용해서 검색 => 가급적이면 페이지 처리 권장
	 * 								 ---------
	 * 								rownum : 가상 컬럼
	 * 								=> 경우에 따라 변경이 가능
	 * 
	 * 
	 * 
	 * 
	 */
	public List<String> foodFindData(String type, String fd){
		
		// 주소 / 음식 종류 / 업체명
		List<String> list = new ArrayList<String>();
		try {
			// 연결
			getConnection();
			
			//sql 문장 제작
			String sql  = "SELECT name "
					+ "FROM menupan_food "
					+ "WHERE " + type + " LIKE '%'||?||'%'";
//					+ "WHERE " + type + " LIKE '" +fd + "%'";
//					+ "WHERE REGEXP_LIKE( " + type + " ,?)";
										// LIKE CONCAT ('%',?,'%') MySQL/MariaDB
			// 오라클 전송		
			ps = conn.prepareStatement(sql);
			
			// 필요한 데이터 첨부
			ps.setString(1, fd);
			
			// 결과 값
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
				
				
			}
			
			// 오라클은 0(x) , 1번부터 시작함
			// List에 채운다
//			list.add(vo);
			
			// ResultSet 닫기
			rs.close();
		} 
		catch (Exception ex) {
			
			ex.printStackTrace();
			
		}
		finally {
			
			disConnection();
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}


























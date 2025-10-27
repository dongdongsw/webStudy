package com.sist.commons;

import java.util.*;
import java.io.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


// 모든 DAO에서 사용
public class CreateSqlSessionFactory {
/*
 * 반복 제거
 */
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	public static SqlSessionFactory getSsf() {
		return ssf;
	}
	
}

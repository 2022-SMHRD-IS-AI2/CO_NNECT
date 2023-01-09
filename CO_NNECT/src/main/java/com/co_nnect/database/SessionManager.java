package com.co_nnect.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SessionManager {
	
	public static SqlSessionFactory sqlSession;
	
	static {
		String resource = "com/co_nnect/database/mybatis-config.xml";
		Reader reader;
		
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlSession = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	public static SqlSessionFactory getSession() {
		return sqlSession;
	}

}

package com.co_nnect.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class SqlSessionManager {
// 그지같네
	
	public static SqlSessionFactory sqlSession;
// SqlSessionFactory : sqlSession(db연결, sql실행, 트랜잭션 관리) 생성
	static {
		// mybatis 설정파일 경로 -> db연결
	String resource = "com/co_nnect/database/mybatis-config.xml";
	Reader reader;

	try {
	reader = Resources.getResourceAsReader(resource);
	sqlSession = new SqlSessionFactoryBuilder().build(reader);
	} catch (IOException e) {
	e.printStackTrace();
	}
	}
	//dao(class) 에서 사용
	public static SqlSessionFactory getSqlSession() {
	return sqlSession;
	}
}

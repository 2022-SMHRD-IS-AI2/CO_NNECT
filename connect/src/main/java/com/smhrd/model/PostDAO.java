package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class PostDAO {
	
	// sql 세션을 생성해줄 factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSession();
	//SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// factory를 사용해서 sql(sql 실행, close(),연결(connection))세션 생성
	SqlSession sqlSession =sqlSessionFactory.openSession(true);
	
	public int upload(PostVO vo) {
		int cnt = sqlSession.insert("com.smhrd.model.PostDAO.uploadOnlyText", vo);
		
		return cnt;
	}
	
	
}

package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CommentDAO {
	
	
	// sql 세션을 생성해줄 factory 생성
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSession();
		//SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		// factory를 사용해서 sql(sql 실행, close(),연결(connection))세션 생성
		SqlSession sqlSession =sqlSessionFactory.openSession(true);

	public int insertCmt(CommentVO vo) {
		int cnt=0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.CommentDAO.insertCmt", vo);
			
			if(cnt >0) {
				// cnt에 값이 담겼을때 commit
				sqlSession.commit();
			}else {
				// 입력값이 들어오지 않았을때
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			
			sqlSession.close();
			// 연결끊기
		}
		
		
		return cnt;
	}

	public List<CommentVO> selectCmt(int num) {
		
		List<CommentVO> vo = sqlSession.selectList("com.smhrd.model.CommentDAO.selectCmt",num);
		sqlSession.close();
		
		return vo;
	}
	

	
	
}

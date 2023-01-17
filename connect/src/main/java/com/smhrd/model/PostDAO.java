package com.smhrd.model;

import java.util.List;

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
		int cnt=0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.PostDAO.uploadOnlyText", vo);
			
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
	
	public int uploadImg(PostVO vo) {
		int cnt=0;
		try {
		cnt = sqlSession.insert("com.smhrd.model.PostDAO.uploadImg", vo);
		
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
	
	
public Boolean fileIsOk(String inputE) {
		
		
		
		Boolean checkE=false;
		
		if(inputE!=null) {
			checkE=true;
		}
		
		return checkE;
		
	}

public List<PostVO> showTimeline() {
	
	List<PostVO> vo = sqlSession.selectList("com.smhrd.model.PostDAO.showTimeline");
	sqlSession.close();
	
	return vo;
}

public List<PostVO> showTimelineOnlyMe(String id) {
	
	List<PostVO> vo = sqlSession.selectList("com.smhrd.model.PostDAO.showTimelineOnlyMe",id);
	sqlSession.close();
	
	return vo;
}

public String getMyNick(String id) {
	
	String nick = sqlSession.selectOne("com.smhrd.model.PostDAO.getMyNick",id);
	sqlSession.close();
	
	return nick;
}
	
}

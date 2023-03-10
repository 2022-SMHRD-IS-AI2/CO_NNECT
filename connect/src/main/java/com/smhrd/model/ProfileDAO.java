package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ProfileDAO {
	
	// sql 세션을 생성해줄 factory 생성
	SqlSessionFactory session = SqlSessionManager.getSession();
	SqlSession sqlSession = session.openSession();
	
	// factory를 사용해서 sql(sql 실행, close(),연결(connection))세션 생성
	
	//회원가입시 기본으로 설정할 프로필값
	public int insertProfile(ProfileVO vo) {
		int cnt = 0;
		
	try {// 만약 sql문이 잘못됫다거나, url이 잘못되었다면 세션이 잘 생성되지 않을수 있음
				
				
				// insert(, 넘겨줄 값)
			 cnt = sqlSession.insert("com.smhrd.model.ProfileDAO.insertProfile", vo);
				// 네임 스페이스 = com.co_nnect.model.DAO 아이디값 = insert
				
				if(cnt >0) {
					// cnt에 값이 담겼을때 commit
					sqlSession.commit();
				}else {
					// 입력값이 들어오지 않았을때
					sqlSession.rollback();
				}
				
				
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				
				sqlSession.close();
				// 연결끊기
			}
			return cnt;
	
	}
	
	public ProfileVO selectProfileID(String id) {
		ProfileVO ProfileUser = null;
		
		try {

			ProfileUser = sqlSession.selectOne("com.smhrd.model.ProfileDAO.selectProfileID", id);
			System.out.println(ProfileUser.getId());	
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return ProfileUser;
	
	
}
	public ProfileVO selectProfileEMAIL(String email) {
		ProfileVO ProfileUser = null;
		
		try {
			
			ProfileUser = sqlSession.selectOne("com.smhrd.model.ProfileDAO.selectProfileEMAIL", email);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return ProfileUser;
		
		
	}
	
	
	public int updateProfilePic(ProfileVO vo) {
		int cnt=0;
		try {
		cnt = sqlSession.insert("com.smhrd.model.ProfileDAO.updateProfilePic", vo);
		
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
	
	
	public int updateProfile(ProfileVO vo) {
		int cnt=0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.ProfileDAO.updateProfile", vo);
			
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

public String getProfilePic(String id) {
	
	
	
	String pic=null;
	
	try {
		
		pic = sqlSession.selectOne("com.smhrd.model.ProfileDAO.selectProfilePic", id);
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return pic;
	
}
	
	
}

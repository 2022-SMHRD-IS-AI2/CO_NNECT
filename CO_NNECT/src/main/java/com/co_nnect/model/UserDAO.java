package com.co_nnect.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.co_nnect.database.SessionManager;

public class UserDAO {
	
	// sql 세션을 생성해줄 factory 생성
	SqlSessionFactory sf = SessionManager.getSession();
	
	// factory를 사용해서 sql(sql 실행, close(),연결(connection))세션 생성
	SqlSession sqlS =sf.openSession();
	
	// 회원가입 시 실행될 메서드 선언
	public int insertUser(UserVO vo) {
		int cnt = 0;
		
	try {// 만약 sql문이 잘못됫다거나, url이 잘못되었다면 세션이 잘 생성되지 않을수 있음
				
				
				// insert(, 넘겨줄 값)
			 cnt = sqlS.insert("com.co_nnect.model.UserDAO.insertUser", vo);
				// 네임 스페이스 = com.co_nnect.model.DAO 아이디값 = insert
				
				if(cnt >0) {
					// cnt에 값이 담겼을때 commit
					sqlS.commit();
				}else {
					// 입력값이 들어오지 않았을때
					sqlS.rollback();
				}
				
				
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				
				sqlS.close();
				// 연결끊기
			}
			return cnt;
	
	}
	// 이메일 중복확인
	public boolean emailDC(String inputE) {
		
		boolean checkE=false;
		try {
			checkE = sqlS.selectOne("com.co_nnect.model.UserDAO.emailCheck", inputE);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return checkE;
		
	}
	
	// 아이디 중복확인
	public boolean idDC(String inputE) {
		
		boolean checkE=false;
		try {
			checkE = sqlS.selectOne("com.co_nnect.model.UserDAO.idCheck", inputE);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return checkE;
		
	}
	
	
	
	
	
	
	
	

}

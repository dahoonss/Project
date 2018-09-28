package com.with.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//기사 회원가입
	public int DriverJoin(MemberVO memberVO) {
		return sqlSession.insert("With.DriverJoin", memberVO);
	}
	//유저 회원가입
	public int UserJoin(MemberVO memberVO) {
		return sqlSession.insert("With.UserJoin", memberVO);
	}
	//로그인
	public MemberVO Login(MemberVO memberVO) {
		return sqlSession.selectOne("With.Login", memberVO);
				
	}
	//로그인후 메인으로 갈때 기사인지 유저인이 확인하는 값 가져오기
	public MemberVO MemberMain(String id) {
		return sqlSession.selectOne("With.Main", id);
	}
	//비밀번호 확인후 값 가져오기
	public MemberVO UserAlterInfo(MemberVO memberVO) {
		
		return sqlSession.selectOne("With.Login",memberVO );
	}
	//유저정보 변경!
	public int UserInfoUpdate(MemberVO memberVO) {
		
		return sqlSession.update("With.UserUpdate", memberVO);
	}
	//운전자정보 변경!
	public int DriverInfoUpdate(MemberVO memberVO) {
		
		return sqlSession.update("With.DriverUpdate",memberVO);
	}
	//아이디 중복확인
	public MemberVO idOverlap(String id) {
		
		return sqlSession.selectOne("With.idOverlap", id);
	}

	
}

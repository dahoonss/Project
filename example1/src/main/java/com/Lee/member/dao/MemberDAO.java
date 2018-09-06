package com.Lee.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Lee.member.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원가입
	public int memberJoin(MemberVO memberVO) {
								//첫번째 <mapper namespace="Member"> mapper name
								//두번째 메소드
								//세번째 가져올 값
		return sqlSession.insert("Member.memberJoin", memberVO);
	}
	//암호화
	//첫번째 <mapper namespace="Member"> mapper name
	//두번째 메소드
	//세번째 가져올 값
	public MemberVO idOverlap(String id) {
		return sqlSession.selectOne("Member.idOverlap", id);
	}


	//로그인
	public MemberVO memberLogin(MemberVO memberVO) {

		return sqlSession.selectOne("Member.memberLogin",memberVO);
	}

	//회원목록
	public List<MemberVO> memberList() {
		
		return sqlSession.selectList("Member.memberList");
	}
	//회원정보 보기
	public MemberVO memberView(String id) {
		return sqlSession.selectOne("Member.memberView",id);
	}
	
	//회원삭제
	
	//첫번째 <mapper namespace="Member"> mapper name
	//두번째 메소드
	//세번째 가져올 값
	public int memberDelete(String id) {
		return sqlSession.delete("Member.memberDelete", id);
	}

}

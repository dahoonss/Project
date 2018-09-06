package com.with.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.CreateRoomVO;
import com.with.project.vo.MemberVO;

@Repository
public class WithDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//방만들기
	public int Room(CreateRoomVO createroomvo) {

		return sqlSession.insert("With.Room", createroomvo);
	}

	
	//유저 회원가입
	public int UserJoin(MemberVO memberVO) {
		return sqlSession.insert("With.UserJoin", memberVO);
	}

	//유저 로그인
	public MemberVO Login(MemberVO memberVO) {
		return sqlSession.selectOne("With.Login", memberVO);
	}

	//예약하기
	public int ReservationRoom(CreateRoomVO createroomvo) {
		
		return sqlSession.insert("With.ReservationRoom", createroomvo);
	}


	
	
	

}

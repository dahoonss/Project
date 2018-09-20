package com.with.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.MemberVO;

@Repository
public class GradeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
/*	//평점주기
	public MemberVO Gradeform(String DriverId, String userId, MemberVO memberVO) {
		return sqlSession.selectOne("With.Grade", DriverId);
	}
*/
	public MemberVO SelectDriverInfo(String id) {
		
		return sqlSession.selectOne("With.SelectDriverInfo", id);
	}


	public void UpdateDriverInfo(MemberVO memberVO) {
		sqlSession.update("With.UpdateDriverInfo", memberVO);
		
	}
}

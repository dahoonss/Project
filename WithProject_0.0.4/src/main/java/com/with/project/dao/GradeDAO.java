package com.with.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.MemberVO;
import com.with.project.vo.endRoomVO;

@Repository
public class GradeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//평점 주는 유저 Id
	public MemberVO SelectDriverInfo(String id2) {
		return sqlSession.selectOne("With.SelectDriverInfo", id2);
	}

	/*//평점받는 기사 ID
	public void selectdriver(String edirver) {
		sqlSession.selectOne("With.selectdriver", edirver);
	}*/

	//평점 업데이트하는 DAO
	public void UpdateDriverInfo(MemberVO grade) {
		sqlSession.update("With.UpdateDriverInfo", grade);
	}



	
	

	
	
}

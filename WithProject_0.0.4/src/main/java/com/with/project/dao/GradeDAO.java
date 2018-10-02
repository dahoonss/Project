package com.with.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.MemberVO;

@Repository
public class GradeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//평점 주는 유저 Id
	public MemberVO SelectDriverInfo(String id2) {
		// TODO Auto-generated method stub
		return null;
	}

	//평점받는 기사 ID
	public void selectdriver(String edirver) {
		// TODO Auto-generated method stub
		
	}

	//평점 업데이트하는 DAO
	public void UpdateDriverInfo(MemberVO grade) {
		// TODO Auto-generated method stub
		
	}



	
	

	
	
}

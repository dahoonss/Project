package com.with.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.endRoomVO;



@Repository
public class MyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


	public List<String> PayRoomId(String id) {
		
		return sqlSession.selectList("With.PayRoomId", id);
	}


	public List<endRoomVO> Endroomd(int mylist) {
	
		return sqlSession.selectList("With.Endroomd",mylist);
	}

	//endRoomVo
	public endRoomVO EndRoomSelect(int eRoomid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("With.EndRoomSelect", eRoomid);
	}

}

package com.with.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.endRoomVO;

@Repository
public class ReservationDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<String> PayList2(String id) {
		return sqlSession.selectList("With.PayList", id);
	}

	public endRoomVO rservationRoomList(int roomid) {
		return sqlSession.selectOne("With.rservationRoomList", roomid);
	}

}

package com.with.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.RoomVO;

@Repository
public class ReservationDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<RoomVO> roomList(RoomVO roomVO) {
		return sqlSession.selectList("With.roomList",roomVO);
	}

	
	

}

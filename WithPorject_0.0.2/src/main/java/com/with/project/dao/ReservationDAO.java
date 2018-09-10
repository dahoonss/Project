package com.with.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.CreateRoomVO;

@Repository
public class ReservationDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int ReservationRoom(CreateRoomVO createroomvo) {
		return sqlSession.insert("With.ReservationRoom", createroomvo);
	}

}

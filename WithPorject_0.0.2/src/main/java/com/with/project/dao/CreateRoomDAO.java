package com.with.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.CreateRoomVO;

@Repository
public class CreateRoomDAO {


	@Autowired
	private SqlSessionTemplate sqlSession;

	public int Room(CreateRoomVO createroomvo) {
		return sqlSession.insert("With.Room", createroomvo);
	}

}

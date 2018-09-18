package com.with.project.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.with.project.vo.RoomVO;

@Repository
public class CreateRoomDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//방만들기할때 RoomId max 값 가져오기
	public String MaxId() {
		
		return sqlSession.selectOne("With.RoomId");
	}
	//처음에 방만들기
	public int CreateRoom(RoomVO roomVO) {
		
		return sqlSession.insert("With.CreateRoom", roomVO);
	}
	//처음에 방만들고 값 불러오기
/*	public RoomVO RoomList(int insertRoomId) {
		
		return sqlSession.selectOne("With.RoomList", insertRoomId);
	}
*/
	public int CreateRealRoom(RoomVO roomVO) {
		
		return sqlSession.update("With.CreateRealRoom", roomVO);
	}
	//방 아이디 값으로 방찾기
	public RoomVO SelectRoom(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.SelectRoom", roomVO);
	}
	public int ReservationRoom(RoomVO roomVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("With.ReservationRoom", roomVO);
	}
}

package com.with.project.dao;


import java.util.List;

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
	//방만들기
	public int CreateRealRoom(RoomVO roomVO) {
		
		return sqlSession.update("With.CreateRealRoom", roomVO);
	}
	//방 아이디 값으로 방찾기
	public RoomVO SelectRoom(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.SelectRoom", roomVO);
	}
	//예약 방
	public int ReservationRoom(RoomVO roomVO) {
		
		return sqlSession.update("With.ReservationRoom", roomVO);
	}
	//계산한 FinalMoney 값 넣기
	public void CreateRealRoom2(RoomVO roomVO) {
		sqlSession.update("With.CreateRealRoom2", roomVO);
		
	}
	//방 목록
	public List<RoomVO> RoomList() {
		
		return sqlSession.selectList("With.RoomList");
	}
	//Id1 찾기
	public String SelectId1(RoomVO roomVO) {

		return sqlSession.selectOne("With.Id1", roomVO);
	}
	//Id1 업데이트 하기
	public void UpdateId1(RoomVO roomVO) {
		
		sqlSession.update("With.UpdateId1", roomVO);
	}
	//진짜 상세보기 페이지!
	public RoomVO RoomInfo(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.RoomInfo", roomVO);
	}
	//Id2 찾기
	public String SelectId2(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.Id2", roomVO);
	}
	//Id2 업데이트 하기
	public void UpdateId2(RoomVO roomVO) {
		sqlSession.update("With.UpdateId2", roomVO);
	}
	//Id3 찾기
	public String selectId3(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.Id3", roomVO);
	}
	//Id3 업데이트하기
	public void UpdateId3(RoomVO roomVO) {
		sqlSession.update("With.UpdateId3", roomVO);
		
	}
	//Id4 찾기
	public String selectId4(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.Id4", roomVO);
	}
	//Id4 업데이트하기
	public void UpdateId4(RoomVO roomVO) {
		sqlSession.update("With.UpdateId4", roomVO);
	}
	
	//방에 들어갈 최대인원 
	public String selectMax(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.SelectMax", roomVO);
	}
}

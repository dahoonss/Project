package com.with.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.CreateRoomDAO;
import com.with.project.dao.ReservationDAO;
import com.with.project.vo.RoomVO;

@Service
public class CreateRoomService {
	
	@Autowired
	private CreateRoomDAO CreateRoomDAO;
	private ModelAndView mav;
	private ReservationDAO rsvDAO;
	//private RoomVO roomVO;
	
	
	//방만들기 처음!
	public ModelAndView CreateRoom(RoomVO roomVO) {
		mav = new ModelAndView();
		String RoomId = CreateRoomDAO.MaxId();
		if(RoomId == null) {
			roomVO.setRoomId(1);
		}else {
			int Roomid = Integer.parseInt(RoomId);
			Roomid = Roomid+1;
			roomVO.setRoomId(Roomid);
		}
		//System.out.println(RoomId);
		
		//int InsertRoomId = roomVO.getRoomid(); 
		
		int result = CreateRoomDAO.CreateRoom(roomVO);
		//System.out.println(result);
		if (result == 0) {
			mav.setViewName("home");
		} else {
			//System.out.println(roomVO.getPreDistance());
			//RoomVO RoomV = CreateRoomDAO.RoomList(InsertRoomId);
			mav.addObject("Room", roomVO);
			mav.setViewName("CreateRoom");
		}
		return mav;
	}
	//방만들기 성별, 최대인원 추가하기
	public ModelAndView CreateRealRoom(RoomVO roomVO) {
		mav = new ModelAndView();
		int result = CreateRoomDAO.CreateRealRoom(roomVO);
		if(result==0) {
			mav.setViewName("home");
		}else {
			RoomVO roomVO2 = CreateRoomDAO.SelectRoom(roomVO);
			
			//예상 가격을 가져와서 원 의 인덱스 값을 가져온다.
			int idx = roomVO2.getPreMoney().indexOf("원");
			System.out.println("1:"+idx);
			//원 부터 뒤에 글자는 모두 자른다.
			String money = roomVO2.getPreMoney().substring(0, idx);
			System.out.println("2:"+money);
			//int로 형변환
			int money1 = Integer.parseInt(money);
			//int 값이기때문에 나눌수 있다.
			money1 /= Integer.parseInt(roomVO2.getMaximum());
			//다시 setPreMoney에 넣어야하기 때문에 String 으로 형변환
			String money2 = Integer.toString(money1);
			System.out.println("3:"+money2);
			//다시 값을 넣는다.
			roomVO2.setPreMoney(money2);
			
			mav.addObject("Room", roomVO2);
			mav.setViewName("room");
		}
		return mav;
	
	}
	public ModelAndView ReservationRoom(RoomVO roomVO) {
		mav = new ModelAndView();
		int result = CreateRoomDAO.ReservationRoom(roomVO);
		if(result==0) {
			mav.setViewName("home");
		}else {
			RoomVO roomVO2 = CreateRoomDAO.SelectRoom(roomVO);
			
			//예상 가격을 가져와서 원 의 인덱스 값을 가져온다.
			int idx = roomVO2.getPreMoney().indexOf("원");
			//System.out.println("1:"+idx);
			//원 부터 뒤에 글자는 모두 자른다.
			String money = roomVO2.getPreMoney().substring(0, idx);
			//System.out.println("2:"+money);
			//int로 형변환
			int money1 = Integer.parseInt(money);
			//int 값이기때문에 나눌수 있다.
			money1 /= Integer.parseInt(roomVO2.getMaximum());
			//다시 setPreMoney에 넣어야하기 때문에 String 으로 형변환
			String money2 = Integer.toString(money1);
			//System.out.println("3:"+money2);
			//다시 값을 넣는다.
			roomVO2.setPreMoney(money2);
			
			mav.addObject("Room", roomVO2);
			mav.setViewName("Reservation");
		}
		List<RoomVO> roomlist = rsvDAO.roomList(roomVO);
		mav.addObject("reservation", roomlist);
		mav.setViewName("MyReservation");
	
		
		return mav;
	}
	
	

	
}

package com.with.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.CreateRoomDAO;
import com.with.project.vo.RoomVO;

@Service
public class CreateRoomService {
	
	@Autowired
	private CreateRoomDAO CreateRoomDAO;
	private ModelAndView mav;
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
			//roomVO2.setPreMoney(money2);
			roomVO2.setFinalMoney(money2);
			
			//따로 한번 더 넣어주는 작업
			CreateRoomDAO.CreateRealRoom2(roomVO2);
			
			
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
		return mav;
	}
	public ModelAndView RoomList() {
		mav = new ModelAndView();
		List<RoomVO> RoomList = CreateRoomDAO.RoomList();
		
		mav.addObject("RoomList", RoomList);
		mav.setViewName("RoomList");
				
		return mav;
	}
	public ModelAndView RoomInfo(RoomVO roomVO,HttpSession session,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = (String) session.getAttribute("id");
		String max = CreateRoomDAO.selectMax(roomVO);
		if (max.equals("2")) {
			String rId1 = CreateRoomDAO.SelectId1(roomVO);
			if (rId1 == null) {
				roomVO.setrId1(id);
				CreateRoomDAO.UpdateId1(roomVO);
				RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
				mav.addObject("Room", roomVO2);
				mav.setViewName("room");
			} else {
				String rId2 = CreateRoomDAO.SelectId2(roomVO);
				if (rId2 == null) {
					roomVO.setrId2(id);
					CreateRoomDAO.UpdateId2(roomVO);
					RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
					mav.addObject("Room", roomVO2);
					mav.setViewName("room");
				} else {
					out.println("<script>");
					out.println("alert('인원이 꽉 찼습니다. 다른 방을 이용해주세용.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					mav.setViewName("redirect:RoomList");
				}
			}
		} else if (max.equals("3")) {
			String rId1 = CreateRoomDAO.SelectId1(roomVO);
			if (rId1 == null) {
				roomVO.setrId1(id);
				CreateRoomDAO.UpdateId1(roomVO);
				RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
				mav.addObject("Room", roomVO2);
				mav.setViewName("room");
			} else {
				String rId2 = CreateRoomDAO.SelectId2(roomVO);
				if (rId2 == null) {
					roomVO.setrId2(id);
					CreateRoomDAO.UpdateId2(roomVO);
					RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
					mav.addObject("Room", roomVO2);
					mav.setViewName("room");
				} else {
					String rId3 = CreateRoomDAO.selectId3(roomVO);
					if (rId3 == null) {
						roomVO.setrId3(id);
						CreateRoomDAO.UpdateId3(roomVO);
						RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
						mav.addObject("Room", roomVO2);
						mav.setViewName("room");
					} else {
						out.println("<script>");
						out.println("alert('인원이 꽉 찼습니다. 다른 방을 이용해주세용.');");
						out.println("history.go(-1);");
						out.println("</script>");
						out.close();
						mav.setViewName("redirect:RoomList");
					}
				}
			}
		} else if (max.equals("4")) {
			String rId1 = CreateRoomDAO.SelectId1(roomVO);
			if (rId1 == null) {
				roomVO.setrId1(id);
				CreateRoomDAO.UpdateId1(roomVO);
				RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
				mav.addObject("Room", roomVO2);
				mav.setViewName("room");
			} else {
				String rId2 = CreateRoomDAO.SelectId2(roomVO);
				if (rId2 == null) {
					roomVO.setrId2(id);
					CreateRoomDAO.UpdateId2(roomVO);
					RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
					mav.addObject("Room", roomVO2);
					mav.setViewName("room");
				} else {
					String rId3 = CreateRoomDAO.selectId3(roomVO);
					if (rId3 == null) {
						roomVO.setrId3(id);
						CreateRoomDAO.UpdateId3(roomVO);
						RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
						mav.addObject("Room", roomVO2);
						mav.setViewName("room");
					} else {
						String rId4 = CreateRoomDAO.selectId4(roomVO);
						if (rId4 == null) {
							roomVO.setrId4(id);
							CreateRoomDAO.UpdateId4(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							mav.addObject("Room", roomVO2);
							mav.setViewName("room");
						} else {
							out.println("<script>");
							out.println("alert('인원이 꽉 찼습니다. 다른 방을 이용해주세용.');");
							out.println("history.go(-1);");
							out.println("</script>");
							out.close();
							mav.setViewName("redirect:RoomList");
						}
					}
				}
			}
		}
		
		return mav;
	}

	
}

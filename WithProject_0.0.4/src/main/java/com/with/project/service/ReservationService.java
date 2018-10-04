package com.with.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.ReservationDAO;
import com.with.project.vo.endRoomVO;

@Service
public class ReservationService {

	@Autowired
	private ReservationDAO rvDAO;
	private ModelAndView mav;
	
	
	public ModelAndView rservationRoomList(HttpSession session, endRoomVO endRoom) {
		mav = new ModelAndView();
		
		String id = (String)session.getAttribute("id");
		//결제된 아이디를 찾는다.
		List<String> endroom = rvDAO.PayList2(id);
		ArrayList<endRoomVO> endlist = new ArrayList<endRoomVO>();
		
		for(int i=0; i<endroom.size(); i++) {
			int roomid = Integer.parseInt(endroom.get(i));
		
		//룸 번호를 찾는다
		endRoomVO EndRoom = rvDAO.rservationRoomList(roomid);
		endlist.add(i, EndRoom);
		}
		
		mav.addObject("reservationList", endlist);
		mav.setViewName("RservationRoomList");
		
		return mav;
	}

}

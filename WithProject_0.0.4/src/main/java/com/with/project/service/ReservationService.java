package com.with.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.ReservationDAO;
import com.with.project.vo.MemberVO;
import com.with.project.vo.endRoomVO;

@Service
public class ReservationService {

	@Autowired
	private ReservationDAO rvDAO;
	private ModelAndView mav;
	
	
	public ModelAndView rservationRoomList(HttpSession session, endRoomVO endRoom,HttpServletResponse response,MemberVO memvervo)throws IOException{
		mav = new ModelAndView();
		System.out.println("여기까지 온다 (서비스)");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = (String)session.getAttribute("id");
		//결제된 아이디를 찾는다.
		List<String> endroom = rvDAO.PayList2(id);
		ArrayList<endRoomVO> endlist = new ArrayList<endRoomVO>();
		
		
		
		List<endRoomVO> endRoomid=rvDAO.endroomid(id);
		if(endRoomid.size()==0) {
			out.println("<script>");
			out.println("alert('예약한 방이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {

			for(int i=0; i<endroom.size(); i++) {
				int roomid = Integer.parseInt(endroom.get(i));
			
			//룸 번호를 찾는다
			endRoomVO EndRoom = rvDAO.rservationRoomList(roomid);
			endlist.add(i, EndRoom);
			}
			System.out.println("서비스: "+endlist);
		}
		
		
		mav.addObject("reservationList", endlist);
		mav.setViewName("ReservationRoomList");
		
		return mav;
	}

}

package com.with.project.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.ReservationDAO;
import com.with.project.vo.CreateRoomVO;

@Service
public class ReservationService {

	@Autowired
	private ReservationDAO rdao;
	private ModelAndView mav;
	
	
	public ModelAndView ReservationRoom(CreateRoomVO createroomvo) {
		mav = new ModelAndView();
		/*PrintWriter out = response.getWriter();*/

		int result = rdao.ReservationRoom(createroomvo);
		
		if(result == 0) {
				//실패
			/*out.println("<script>");
			out.println("alert('예약 실패.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();*/
			mav.setViewName("home");
		}else {//성공
			mav.setViewName("UserMyPage");//유저페이지 간후 예약내역으로 가기??아니면 다이렉트로 예약내역가기??
		}
		
		return mav;

}}

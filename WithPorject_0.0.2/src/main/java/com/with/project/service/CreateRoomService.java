package com.with.project.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.CreateRoomDAO;
import com.with.project.vo.CreateRoomVO;

@Service
public class CreateRoomService {

	@Autowired
	private CreateRoomDAO crDAO;
	private ModelAndView mav;
	

	
	public ModelAndView Room(CreateRoomVO createroomvo) {
		System.out.println("서비스");
		mav = new ModelAndView();
		
		int result = crDAO.Room(createroomvo);
		
		if(result == 0) {
				//실패
			mav.setViewName("home");
		}else {//성공
			mav.setViewName("RoomList");
		}
		
		return mav;

	
}
}

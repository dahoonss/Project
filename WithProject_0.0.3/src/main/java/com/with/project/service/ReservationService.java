package com.with.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


import com.with.project.dao.ReservationDAO;
import com.with.project.vo.RoomVO;

@Service
public class ReservationService {

	
	@Autowired
	private ReservationDAO rsvDAO;
	private ModelAndView mav;
	
	
	
	
	

}

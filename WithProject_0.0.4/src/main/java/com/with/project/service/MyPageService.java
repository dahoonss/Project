package com.with.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.MyPageDAO;
import com.with.project.vo.RoomVO;
import com.with.project.vo.endRoomVO;



@Service
public class MyPageService {

	@Autowired
	private MyPageDAO mpDAO;
	private ModelAndView mav;

	

	
	public ModelAndView mypageList(HttpSession session,endRoomVO endRoom) {
		mav = new ModelAndView();
	
		String id = (String)session.getAttribute("id");

		//해당 아이디 결제된 룸 번호를 찾음
		List<String> roomid = mpDAO.PayRoomId(id);
		ArrayList<endRoomVO> list = new ArrayList<endRoomVO>();
		
		for(int i=0; i<roomid.size(); i++) {
			
			int roomIdReal = Integer.parseInt(roomid.get(i));
			
			
			endRoomVO endRoom1 = mpDAO.EndRoomSelect(roomIdReal);
			
			System.out.println(endRoom1.getEfinalMoney());
			list.add(i, endRoom1);
			
			
		//	System.out.println("리스트값 찍어보기"+list.get(i));
		
				}
		System.out.println("3");
		System.out.println("왜안되고 지랄이야 ㅅㅂ러마");
		System.out.println("리스트값 찍어보기"+list.get(0));
		System.out.println("리스트값 찍어보기"+list.get(1));
		
		
	
		
		
		/*for(int i=0;i<mypage.size();i++) {
			System.out.println(i+"번째:"+mypage.get(i));	
		}
		
		System.out.println(mypage);*/
		
		mav.addObject("mypagelist",list);
		
		mav.setViewName("MyPageList");
		
		
		
		return mav;
	}

}

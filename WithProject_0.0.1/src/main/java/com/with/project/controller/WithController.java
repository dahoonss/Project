package com.with.project.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.with.project.service.WithService;
import com.with.project.vo.CreateRoomVO;
import com.with.project.vo.MemberVO;

@Controller
public class WithController {

	
	
	@Autowired
	private WithService ws;
	private ModelAndView mav;
	@Autowired
	private HttpSession session;
	
	
	//프로젝트 시작했을 때 페이지 지정
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home() {
			
			return "home";
		}
		//유저페이지
		@RequestMapping(value = "/UserPage", method = RequestMethod.GET)
		public String userpage() {
			
			return "UserPage";
		}
		
	//방 만들기 페이지				//CreateRoom.jsp말고 다른 jsp에서 받음
		@RequestMapping(value = "/CreateRoom", method = RequestMethod.GET)
		public String Room() {
			return "CreateRoom"; //jsp로 이동
		}
		//예약페이지
		@RequestMapping(value = "/Reservation", method = RequestMethod.GET)
		public String Reservation() {
			
			return "Reservation";
		}
		//방 만들기 처리 페이지
		@RequestMapping(value = "/CreateRoom2", method = RequestMethod.POST)
		public ModelAndView Room2(@ModelAttribute CreateRoomVO createroomvo, @RequestParam("gender") String gender) {
			mav = new ModelAndView();
			String Id1 = (String)session.getAttribute("id");
			
			createroomvo.setSelectGender(gender);
			createroomvo.setId1(Id1);
			mav = ws.Room(createroomvo);
			return mav;
		}
		//로그인가는 페이지
		@RequestMapping(value = "/Login", method = RequestMethod.GET)
		public String Login() {
			return "LoginForm";
		}

		//회원가입가는 페이지
		@RequestMapping(value = "/UserJoin", method = RequestMethod.GET)
		public String UserJoin() {
			return "UserJoin";
		}
		//로그아웃
		@RequestMapping(value = "/Logout", method = RequestMethod.GET)
		public String Logout() {
			session.invalidate();
			return "home";
		}
		//유저로그인 처리
		@RequestMapping(value ="/Loginpro", method = RequestMethod.POST)
		public ModelAndView LoginForm(@ModelAttribute MemberVO memberVO ,HttpServletResponse response) throws IOException{
			mav = new ModelAndView();
			mav = ws.Login(memberVO,response);
			
			return mav;	
		}
		//유저 회원가입 처리
		@RequestMapping(value = "/UserJoinPro", method = RequestMethod.POST)
		public ModelAndView UserJoinPro(@ModelAttribute MemberVO memberVO) {
			mav = new ModelAndView();
			mav = ws.UserJoin(memberVO);
			return mav;
		}
		//예약한 페이지 처리  ,HttpServletResponse response throws IOException
		@RequestMapping(value = "/ReservationRoom", method = RequestMethod.POST)
		public ModelAndView ReservationRoom(@ModelAttribute CreateRoomVO createroomvo, @RequestParam("gender")String gender,
				@RequestParam("Dayday")String Dayday,@RequestParam("Times")String Times){
			mav = new ModelAndView();
			String Id1 = (String)session.getAttribute("id"); 
			System.out.println("gender :"+gender);
			System.out.println("Id1 :"+Id1);
			System.out.println("Day :"+Dayday);
			System.out.println("Time :"+Times);

			createroomvo.setSelectGender(gender);
			createroomvo.setId1(Id1);
			createroomvo.setDayday(Dayday);
			createroomvo.setTimes(Times);
			mav = ws.ReservationRoom(createroomvo);
			return mav;
		}
		
		//채팅방 
		@RequestMapping("/chatting")
	    public String viewChattingPage() {
	        return "chatting";
	    }
		
	
}

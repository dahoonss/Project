package com.with.project.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.WithDAO;
import com.with.project.vo.CreateRoomVO;
import com.with.project.vo.MemberVO;

@Service
public class WithService {

	@Autowired
	private WithDAO wdao;
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	//방 만들기
	public ModelAndView Room(CreateRoomVO createroomvo) {
		System.out.println("서비스");
		mav = new ModelAndView();
		
		int result = wdao.Room(createroomvo);
		
		if(result == 0) {
				//실패
			mav.setViewName("home");
		}else {//성공
			mav.setViewName("RoomList");
		}
		
		return mav;
	}
	//로그인 처리
	public ModelAndView Login(MemberVO memberVO,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		
		MemberVO loginMember = wdao.Login(memberVO);
		
		if(memberVO.getPassword().equals(loginMember.getPassword())) {
			session.setAttribute("id", memberVO.getId());
			mav.setViewName("home");
			
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			mav.setViewName("LoginForm");
		}
		return mav;
	}
	
	//회원가입 처리
	public ModelAndView UserJoin(MemberVO memberVO) {
mav = new ModelAndView();
		
		int result = wdao.UserJoin(memberVO);
		if(result==0) {
			mav.setViewName("home");
		}else {
			mav.setViewName("home");
		}
		
		return mav;
	}
	//예약방만들기HttpServletResponse response throws IOException
	public ModelAndView ReservationRoom(CreateRoomVO createroomvo) {
		mav = new ModelAndView();
		/*PrintWriter out = response.getWriter();*/

		int result = wdao.ReservationRoom(createroomvo);
		
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
	}

}

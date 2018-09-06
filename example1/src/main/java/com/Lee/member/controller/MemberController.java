package com.Lee.member.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.*;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import javax.xml.ws.Response;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Lee.member.service.MemberService;
import com.Lee.member.vo.MemberVO;


@Controller
public class MemberController {
	
	/*
	 * 별도의 객체를 생성하지 않고도 자동으로 객체를 주입하여 사용할 수 있도록 하는 어노테이션
	 * 스프링의 특징 중 하나인 의존성 주입(Dependency Injection)을 구현하는 개념
	 * @Autowired를 붙이면 스프링 컨테이너가 자동으로 관리 함.
	 */
	@Autowired
	private MemberService ms;
	private ModelAndView mav;
	private MemberVO memberVO;
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private HttpSession session;
	
	//프로젝트 시작했을 때 페이지 지정
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "loginForm";
	}
	
	//회원가입 페이지로 이동 요청 처리
	@RequestMapping(value = "/joinForm" , method = RequestMethod.GET)
	public String joinForm() {
		//joinForm.jsp 페이지로 이동
		return "joinForm";
	}
	//회원가입 처리
	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public ModelAndView memberJoin(@ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		//암호화 작업
		String encPassword = passEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encPassword);
		System.out.println("암호화 비번 확인"+memberVO.getPassword());
		
		mav = ms.memberJoin(memberVO);
		return mav;
	}	
		//아이디 중복확인
		@RequestMapping(value = "idOverlap",method=RequestMethod.POST)
		public void idOverlap(HttpServletResponse response, @RequestParam("id") String id) throws IOException {
			ms.idOverlap(id,response);
		}
		
		//로그인
		@RequestMapping(value = "/login",method=RequestMethod.POST)
		public ModelAndView memberLogin(@ModelAttribute MemberVO memberVO,HttpServletResponse response) throws IOException{
			mav = new ModelAndView();
			
			mav = ms.memberLogin(memberVO,response);
			return mav;
		}	
		
		//로그아웃 처리
		@RequestMapping(value="/logout",method=RequestMethod.GET)
		public String memberLogout() {
			session.invalidate();
			return "loginForm";
		}
		
		//회원목록보기 (관리자 모드)
		@RequestMapping(value="/memberList",method=RequestMethod.GET)
		public ModelAndView memberList(HttpSession session) {
			mav = new ModelAndView();
					//loginMember에 String 강제형변환 session아이디를 담는다
			String  loginMember = (String)session.getAttribute("session_id");
				//loginMember null이고 or 
			if(loginMember ==null || !loginMember.equals("admin")) {
				mav.setViewName("loginForm");
			}else {
				mav = ms.memberList();
						
			}
			return mav;
		}
		//회원정보 보기
		@RequestMapping(value="/memberView",method=RequestMethod.GET)
		public ModelAndView memberView(@RequestParam("id") String id) {
			mav = new ModelAndView();
			mav = ms.memberView(id);
			return mav;
		}
		//회원 삭제하기
		@RequestMapping(value="/memberDelete",method=RequestMethod.GET)
		public String memberDelete(@RequestParam("id") String id) {
			ms.memberDelete(id);
			
			return "redirect:/memberList";
		}
	

}
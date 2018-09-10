package com.with.project.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.service.CreateRoomService;
import com.with.project.service.MemberService;
import com.with.project.service.ReservationService;
import com.with.project.vo.CreateRoomVO;
import com.with.project.vo.MemberVO;

@Controller
public class HomeController {

	@Autowired
	private MemberService ms;
	private ModelAndView mav;
	@Autowired
	private CreateRoomService cs;
	@Autowired
	private ReservationService rs;

	@Autowired
	private HttpSession session;

	// 서버 실행 시켰을때
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	// 메인 페이지로 이동
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home2(HttpSession ssesion) {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		mav = ms.LoginMemberMain(id);

		return mav;
	}

	// 유저 마이페이지 JSP로 이동
	@RequestMapping(value = "/UserMyPage", method = RequestMethod.GET)
	public String UserMyPage() {
		return "UserMyPage";

	}

	// 기사 마이페이지 JSP로 이동
	@RequestMapping(value = "/DriverMyPage", method = RequestMethod.GET)
	public String DriverMyPage() {
		return "DriverMyPage";

	}

	// 유저 회원가입 JSP로 이동
	@RequestMapping(value = "/UserJoin", method = RequestMethod.GET)
	public String UserJoin() {
		return "UserJoin";
	}

	// 기사 회원가입 JSP로 이동
	@RequestMapping(value = "/DriverJoin", method = RequestMethod.GET)
	public String DriverJoin() {
		return "DriverJoin";
	}

	// 기사 회원가입
	@RequestMapping(value = "/DriverJoinPro", method = RequestMethod.POST)
	public ModelAndView DriverJoinPro(@ModelAttribute MemberVO memberVO) throws IOException {
		mav = new ModelAndView();

		MultipartFile file = memberVO.getFile();
		if (!file.isEmpty()) {
			String FileName = file.getOriginalFilename();
			file.transferTo(new File("D:\\Spring\\WithProject_0.0.2\\src\\main\\webapp\\resources\\" + FileName));
		}

		memberVO.setCertificate(file.getOriginalFilename());
		mav = ms.DriverJoin(memberVO);

		return mav;
	}

	// 회원가입 id 중복확인
	@RequestMapping(value = "idOverlap", method = RequestMethod.POST)
	public void idOverlap(HttpServletResponse response, @RequestParam("id") String id) throws IOException {
		ms.idOverlap(id, response);
	}

	// 유저 회원가입
	@RequestMapping(value = "/UserJoinPro", method = RequestMethod.POST)
	public ModelAndView UserJoinPro(@ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		mav = ms.UserJoin(memberVO);
		return mav;
	}

	// 로그인 jsp로 이동
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String Login() {
		return "LoginForm";
	}

	// 로그인
	@RequestMapping(value = "/Loginpro", method = RequestMethod.POST)
	public ModelAndView LoginForm(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		mav = ms.Login(memberVO, response);

		return mav;
	}

	// 로그아웃
	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String Logout() {
		session.removeAttribute("id");
		return "home";
	}

	// 유저 정보 변경 하기 전 비밀번호 확인 JSP
	@RequestMapping(value = "/PasswordForm", method = RequestMethod.GET)
	public String PasswordForm() {
		return "PasswordForm";
	}

	// 유저 정보 변경 하기 전 비밀번호 확인 후 유저정보 가져오기!
	@RequestMapping(value = "/PasswordFormPro", method = RequestMethod.GET)
	public ModelAndView PasswordFormPro(@ModelAttribute MemberVO memberVO, HttpSession session,
			HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		memberVO.setId(id);
		mav = ms.PasswordFormPro(memberVO, response);
		return mav;
	}

	// 유저정보 변경(실질적인 변경임)
	@RequestMapping(value = "/UserInfoAlter", method = RequestMethod.POST)
	public ModelAndView UserInfoAlter(HttpSession session, @ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		memberVO.setId(id);
		mav = ms.UserInfoAlter(memberVO);

		return mav;
	}

	// 운전자 정보 변경(실질적변경)
	@RequestMapping(value = "/DriverInfoAlter", method = RequestMethod.POST)
	public ModelAndView DriverInfoAlter(HttpSession session, @ModelAttribute MemberVO memberVO) throws IOException {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		memberVO.setId(id);

		MultipartFile file = memberVO.getFile();
		if (!file.isEmpty()) {
			String FileName = file.getOriginalFilename();
			file.transferTo(new File("D:\\Spring\\WithProject_0.0.2\\src\\main\\webapp\\resources\\" + FileName));
		}
		memberVO.setCertificate(file.getOriginalFilename());

		mav = ms.DriverInfoAlter(memberVO);
		return mav;
	}

	// 유저페이지
	@RequestMapping(value = "/UserPage", method = RequestMethod.GET)
	public String userpage() {

		return "UserPage";
	}

	// 방 만들기 페이지 //CreateRoom.jsp말고 다른 jsp에서 받음
	@RequestMapping(value = "/CreateRoom", method = RequestMethod.GET)
	public String Room() {
		return "CreateRoom"; // jsp로 이동
	}

	// 예약페이지
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
				mav = cs.Room(createroomvo);
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
				mav = rs.ReservationRoom(createroomvo);
				return mav;
			}
}

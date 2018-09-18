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
import com.with.project.vo.MemberVO;
import com.with.project.vo.RoomVO;

@Controller
public class HomeController {

	@Autowired
	private MemberService ms;
	private ModelAndView mav;

	@Autowired
	private CreateRoomService crs;

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

	// 지도가기
	@RequestMapping(value = "/maps", method = RequestMethod.GET)
	public String maps() {
		return "Maps";

	}

	// SearchMap
	@RequestMapping(value = "/SearchMap", method = RequestMethod.GET)
	public String SearchMap() {
		return "SearchMap";

	}

	// Search2Map test!!
	@RequestMapping(value = "/Search2Map", method = RequestMethod.GET)
	public String Search2Map() {
		return "Search2Map";

	}

	// 맵다시띄우기ReStart
	@RequestMapping(value = "/ReStart", method = RequestMethod.GET)
	public String ReStart() {
		return "Maps";

	}

	// UserStart 유저 시작 눌렀을때
	@RequestMapping(value = "/UserStart", method = RequestMethod.GET)
	public String UserStart() {
		return "Maps";
	}

	// CreateRoom 방 만들기
	@RequestMapping(value = "/CreateRoom", method = RequestMethod.GET)
	public ModelAndView CreateRoom(@ModelAttribute RoomVO roomVO, HttpSession session) {
		mav = new ModelAndView();

		// 전부 찍힘
		/*
		 * System.out.println(roomVO.getRStart()); System.out.println(roomVO.getREnd());
		 * System.out.println(roomVO.getPreDistance());
		 * System.out.println(roomVO.getPreMoney());
		 * System.out.println(roomVO.getPreTime());
		 */
		// 테이블에 있는거 가져와서 max(넘버값) +1 시켜서

		String id = (String) session.getAttribute("id");
		// 방 초기에 만들때는 Rid1에 방장의 아이디 값이 들어간다.
		roomVO.setrId1(id);
		mav = crs.CreateRoom(roomVO);

		// 만들기니까 무조건 id1번에 세션값 넣으면 됨!
		return mav;

	}

	@RequestMapping(value = "/CreateRealRoom", method = RequestMethod.POST)
	public ModelAndView CreateRealRoom(@ModelAttribute RoomVO roomVO, HttpSession session,@RequestParam("gender") String gender,HttpServletResponse response) {
		mav = new ModelAndView();
		//opGender
		//maximum
		response.setContentType("text/html;charset=UTF-8");
		/*System.out.println(gender);
		System.out.println(roomVO.getRoomId());
		System.out.println(roomVO.getMaximum());
		*/
		roomVO.setOpGender(gender);
		mav = crs.CreateRealRoom(roomVO);
		return mav;
	}
	
	@RequestMapping(value = "/ReservationRoom", method = RequestMethod.POST)
	public ModelAndView ReservationRoom(@ModelAttribute RoomVO roomVO, @RequestParam("gender") String gender,@RequestParam("dayDay") String dayDay, @RequestParam("times") String times) {
		mav = new ModelAndView();
		/*System.out.println(gender);
		System.out.println(dayDay);
		System.out.println(times);
		*/
		roomVO.setOpGender(gender);
		roomVO.setDayDay(dayDay);
		roomVO.setTimes(times);
		mav = crs.ReservationRoom(roomVO);
		
		return mav;
		
	}

}
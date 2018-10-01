package com.with.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

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
import com.with.project.service.PayService;
import com.with.project.vo.MemberVO;
import com.with.project.vo.PayVO;
import com.with.project.vo.RoomVO;
import com.with.project.vo.endRoomVO;

@Controller
public class HomeController {

	@Autowired
	private MemberService ms;
	private ModelAndView mav;

	@Autowired
	private CreateRoomService crs;
	
	@Autowired
	private PayService ps;

	@Autowired
	private HttpSession session;

	// 서버 실행 시켰을때
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	@RequestMapping(value = "/homes", method = RequestMethod.GET)
	public String homes() {
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
	public ModelAndView CreateRoom(@ModelAttribute RoomVO roomVO, HttpSession session,HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 전부 찍힘
		/*
		 * System.out.println(roomVO.getRStart()); System.out.println(roomVO.getREnd());
		 * System.out.println(roomVO.getPreDistance());
		 * System.out.println(roomVO.getPreMoney());
		 * System.out.println(roomVO.getPreTime());
		 */
		// 테이블에 있는거 가져와서 max(넘버값) +1 시켜서

		String id = (String) session.getAttribute("id");
		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인을 해주세용!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		if(roomVO.getPreDistance().equals("undefined")) {
			out.println("<script>");
			out.println("alert('경로를 먼저 검색해주세요!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		// 방 초기에 만들때는 Rid1에 방장의 아이디 값이 들어간다.
		roomVO.setrId1(id);
		mav = crs.CreateRoom(roomVO);

		// 만들기니까 무조건 id1번에 세션값 넣으면 됨!
		return mav;

	}
	//방 진짜로 만들기
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
	//방 예약하기
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
	//예약룸 RoomList1 가즈아!
	@RequestMapping(value = "/RoomList1", method = RequestMethod.GET)
	public ModelAndView RoomList1() {
		mav = new ModelAndView();
		
		mav = crs.RoomList2();
		
		return mav;
		
	}
	
	//RoomList 방목록 불러오기
	@RequestMapping(value = "/RoomList", method = RequestMethod.GET)
	public ModelAndView RoomList() {
		mav = new ModelAndView();
		
		mav = crs.RoomList();
		
		return mav;
		
	}
	//RoomInfo 방 세부정보
	@RequestMapping(value = "/RoomInfo", method = RequestMethod.GET)
	public ModelAndView RoomInfo(@ModelAttribute RoomVO roomVO, HttpSession session,HttpServletResponse response,PayVO payVO) throws IOException {
		mav = new ModelAndView();
		mav = crs.RoomInfo(roomVO, session,response,payVO);
		
		return mav;
		
	}
	//RoomOut 방나가기
	@RequestMapping(value = "/RoomOut", method = RequestMethod.GET)
	public ModelAndView RoomOut(@ModelAttribute RoomVO roomVO,HttpSession session, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		
		mav = crs.RoomOut(roomVO, session,response);
		
		return mav;
	}
	//DriverInfo 방에서 기사의 상세정보 보기 
	@RequestMapping(value = "/DriverInfo", method = RequestMethod.GET)
	public ModelAndView DriverInfo(@RequestParam("Id") String Id, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		
		mav = crs.RoomDriverInfo(Id);
		
		return mav;
	}
	//pay 결제페이지로
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public ModelAndView pay(@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId, HttpServletResponse response,HttpSession session) throws IOException {
		mav = new ModelAndView();
		
		mav = ps.PayClick(finalMoney,roomId,response,session);
		
		return mav;
	}
	//AddPoint 충전패이지로
	@RequestMapping(value = "/AddPoint", method = RequestMethod.POST)
	public ModelAndView AddPoint(@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId){
	
		mav = new ModelAndView();
		
		mav = ps.AddPoint(finalMoney,roomId);
		
		return mav;
	}
	//AddPointPro 진짜 충전
	@RequestMapping(value = "/AddPointPro", method = RequestMethod.POST)
	public ModelAndView AddPointPro(@RequestParam("Point") String Point,HttpSession session,@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId)  {
		mav = new ModelAndView();
		//System.out.println(Point);
		mav = ps.AddPointPro(Point,session,roomId,finalMoney);
		
		return mav;
	}
	//PayPro 진짜결제
	@RequestMapping(value = "/PayPro", method = RequestMethod.POST)
	public ModelAndView PayPro(@ModelAttribute MemberVO memberVO,HttpSession session,@RequestParam("finalMoney") String finalMoney,@ModelAttribute PayVO payVO,HttpServletResponse response) throws IOException  {
		mav = new ModelAndView();
		/*System.out.println(memberVO.getPoint());
		System.out.println(payVO.getRoomId());
		System.out.println(finalMoney);*/
		mav = ps.PayPro(session,payVO,finalMoney,response,memberVO);
		
		return mav;
	}
	
	//payCancel 결제취소
	@RequestMapping(value = "/payCancel", method = RequestMethod.GET)
	public ModelAndView payCancel(HttpSession session, @ModelAttribute PayVO payVO) {
		mav = new ModelAndView();
		mav = ps.payCancel(session,payVO);
		return mav;
	}
	
	//예약 및 결제 Rpay
	@RequestMapping(value = "/Rpay", method = RequestMethod.GET)
	public ModelAndView Rpay(@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId, HttpServletResponse response,HttpSession session) throws IOException {
		mav = new ModelAndView();
		
		mav = ps.PayClick2(finalMoney,roomId,response,session);
		
		return mav;
	}
	//PayPro2
	@RequestMapping(value = "/PayPro2", method = RequestMethod.POST)
	public ModelAndView PayPro2(@ModelAttribute MemberVO memberVO,HttpSession session,@RequestParam("finalMoney") String finalMoney,@ModelAttribute PayVO payVO,HttpServletResponse response) throws IOException  {
		mav = new ModelAndView();
		/*System.out.println(memberVO.getPoint());
		System.out.println(payVO.getRoomId());
		System.out.println(finalMoney);*/
		mav = ps.PayPro2(session,payVO,finalMoney,response,memberVO);
		
		return mav;
	}
	
	//AddPoint2
	@RequestMapping(value = "/AddPoint2", method = RequestMethod.POST)
	public ModelAndView AddPoint2(@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId){
	
		mav = new ModelAndView();
		
		mav = ps.AddPoint2(finalMoney,roomId);
		
		return mav;
	}
	
	//payCancel2
	@RequestMapping(value = "/payCancel2", method = RequestMethod.GET)
	public ModelAndView payCancel2(HttpSession session, @ModelAttribute PayVO payVO) {
		mav = new ModelAndView();
		mav = ps.payCancel2(session,payVO);
		return mav;
	}
	
	//RoomOut2
	@RequestMapping(value = "/RoomOut2", method = RequestMethod.GET)
	public ModelAndView RoomOut2(@ModelAttribute RoomVO roomVO,HttpSession session, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		
		mav = crs.RoomOut2(roomVO, session,response);
		
		return mav;
	}
	
	//예약룸 리스트 불러오기
	@RequestMapping(value = "/RoomList2", method = RequestMethod.GET)
	public ModelAndView RoomList2() {
		mav = new ModelAndView();
		
		mav = crs.RoomList2();
		
		return mav;
		
	}
	
    //AddPointPro2
	@RequestMapping(value = "/AddPointPro2", method = RequestMethod.POST)
	public ModelAndView AddPointPro2(@RequestParam("Point") String Point,HttpSession session,@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId)  {
		mav = new ModelAndView();
		//System.out.println(Point);
		mav = ps.AddPointPro2(Point,session,roomId,finalMoney);
		
		return mav;
	}
	
	//예약방 세부정보 
	@RequestMapping(value = "/RoomInfo2", method = RequestMethod.GET)
	public ModelAndView RoomInfo2(@ModelAttribute RoomVO roomVO, HttpSession session,HttpServletResponse response,PayVO payVO) throws IOException {
		mav = new ModelAndView();
		mav = crs.RoomInfo2(roomVO, session,response,payVO);
		
		return mav;
		
	}
	//EndDriver
	@RequestMapping(value = "/EndDriver", method = RequestMethod.GET)
	public ModelAndView EndDriver(@ModelAttribute RoomVO roomVO,HttpSession session, HttpServletResponse response, PayVO payVO, endRoomVO endRoom) throws IOException {
		mav = new ModelAndView();
		
		mav = crs.EndDriver(roomVO, session,response,payVO,endRoom);
		
		return mav;
	}
	
	
}

package com.Lee.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.Lee.member.dao.MemberDAO;
import com.Lee.member.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	private ModelAndView mav;
	private MemberVO memberVO;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private HttpSession session;
	
	//회원가입 메소드
	public ModelAndView memberJoin(MemberVO memberVO) {
		mav = new ModelAndView();
		
		int result = memberDAO.memberJoin(memberVO);
		
		if(result ==0) {
			//회원가입 실패하면 다시 joinForm으로
			mav.setViewName("joinForm");
		}else {
			//회원가입 성공하면 loginForm으로 이동
			mav.setViewName("loginForm");
		}
		return mav;
	}

	//아이디 중복체크
	public void idOverlap(String id, HttpServletResponse response) throws IOException {
		memberVO = new MemberVO();
		memberVO = memberDAO.idOverlap(id);
		if(memberVO==null) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
		
	}
	
	

	//로그인
	public ModelAndView memberLogin(MemberVO memberVO2, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html;charset=UTF-8"); //한글깨짐 방지
		
		mav = new ModelAndView();
		MemberVO loginMember = memberDAO.memberLogin(memberVO2);
		PrintWriter out = response.getWriter();
		
		//spring - security를 활용한 비밀번호 확인
		//matches(boolean 타입) = 1.로그인할때 입력한 비밀번호 2.DB에 저장된  비밀번호
		System.out.println("사용자 입력 비밀번호" + memberVO2.getPassword());
		System.out.println("DB에 저장된 비밀번호"+ loginMember.getPassword());
		
		if(passEncoder.matches(memberVO2.getPassword(), loginMember.getPassword())) {
			session.setAttribute("session_id",memberVO2.getId());
			//set역할을 하는 addObject  첫번째 속성
			mav.addObject("loginMember", loginMember);
			mav.setViewName("home");//성공시 main.jsp 이동
		}else {//로그인 실패시
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
			mav.setViewName("loginForm");//loginForm.jsp 이동
		}
		return mav;
	}


	//회원목록 (관리자 모드)
	public ModelAndView memberList() {
		mav = new ModelAndView();
		List<MemberVO> memberList = memberDAO.memberList();
						//(뷰에서쓰는)파라미터
		mav.addObject("memberList" , memberList);// jsp에서 쓰는 값들
		mav.setViewName("memberList");//jsp 이동
		return mav;
	}

	//회원정보 보기
	public ModelAndView memberView(String id) {
		mav = new ModelAndView();
		MemberVO viewMember = memberDAO.memberView(id);
		mav.addObject("viewMember",viewMember);
		mav.setViewName("memberView");
		return mav;
	}

	//회원 삭제
	public void memberDelete(String id) {
		memberDAO.memberDelete(id);
		
	}

	
}

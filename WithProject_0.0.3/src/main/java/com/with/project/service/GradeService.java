package com.with.project.service;


import java.text.DecimalFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.GradeDAO;
import com.with.project.vo.MemberVO;


@Service
public class GradeService {

	@Autowired
	private GradeDAO gradeDAO;
	private ModelAndView mav;
	
	
	
	
/*	public ModelAndView Gradeform(String DriverId, String userId, MemberVO memberVO2,HttpServletResponse response)throws IOException {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		
		//member drvier id <= select 
		
		
		PrintWriter out = response.getWriter();
		int finalgrade= memberVO2.getFinalgrade(); //평점
		int gradeCount = memberVO2.getGradeCount(); //사람수 올리기
		int Grade = memberVO2.getGrade();  //한명이주는 평점
		System.out.println("=============================");
		System.out.println("1");
		System.out.println("=============================");
		MemberVO membervo=gradeDAO.Gradeform(DriverId, userId, memberVO2);
		
		if(membervo != null || Grade != 0) {
			finalgrade+=Grade;
			gradeCount +=1;
			finalgrade=Grade/gradeCount;
			System.out.println("=============================");
			System.out.println("2");
			System.out.println("=============================");	
			mav.addObject("gogo",membervo);
			mav.setViewName("Grade2");
		}else {
			out.println("<script>");
			out.println("alert('평점주기 실패.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			mav.setViewName("home");
			
		}
		return mav;
	}
*/



	public ModelAndView AddGrade(String grade, HttpSession session,String DriverId) {
		mav = new ModelAndView();
		
		System.out.println("gradeDAO전");
		MemberVO Driver = gradeDAO.SelectDriverInfo(DriverId);
		System.out.println(Driver);
		
		double sum = Driver.getGrade();
		double count = Driver.getGradeCount();
		double ffinal = Driver.getFinalgrade();
		double ffinal2 = Double.parseDouble(String.format("%.1f", ffinal));
		
		
	

			//1.
		//내가 결제한 목록 페이지에서 RoomId링크걸기(상세보기)
		//상세보기는 endRoom에 값들이다.
		//이값들중 DrviverId 에 링크를 걸어서 평점을 준다.
		
			
		
		//2.
			// endroom에 있는 driverId를 꺼내온다.
			// 기사 아이디 member table
		// select * from member where id = driverId;
			// driverId를 가지고 member table에 객체를 가져온다.
		//평점
			// 연산을하고 결과를 넣는다 (다시 인설트)
		
	
		
		
		/*double ble =Double.parseDouble(String.format("%.1f", ffinal));*/
		sum = sum+Integer.parseInt(grade);
		count+=1;
		ffinal2 = sum/count;
		
		Driver.setId(DriverId);
		Driver.setGrade(sum);
		Driver.setGradeCount(count);
		Driver.setFinalgrade(ffinal2);
		
		gradeDAO.UpdateDriverInfo(Driver);
		mav.addObject("gogo",Driver);
		mav.setViewName("Grade2");
		
		
		
		return mav;
	}
}

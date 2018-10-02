package com.with.project.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.GradeDAO;
import com.with.project.vo.MemberVO;
import com.with.project.vo.endRoomVO;


@Service
public class GradeService {

	@Autowired
	private GradeDAO gradeDAO;
	private ModelAndView mav;
	
	public ModelAndView AddGrade(String grade, HttpSession session,String edirver) {
	
		mav = new ModelAndView();
		
		System.out.println("gradeDAO전");
		//평점주는 유저 ID
		String id2 = (String)session.getAttribute("id");
		MemberVO Grade = gradeDAO.SelectDriverInfo(id2);
		
		
		double sum = Grade.getGrade();
		double count = Grade.getGradeCount();
		double ffinal = Grade.getFinalgrade();
		double ffinal2 = Double.parseDouble(String.format("%.1f", ffinal));
		
		
		//평점받는 기사
		gradeDAO.selectdriver(edirver);
		
		sum = sum+Integer.parseInt(grade);
		count+=1;
		ffinal2 = sum/count;
		
		
		Grade.setGrade(sum);
		Grade.setGradeCount(count);
		Grade.setFinalgrade(ffinal2);
		
		//해당 기사 받은평점 업데이트
		gradeDAO.UpdateDriverInfo(Grade);
		mav.addObject("gogo",Grade);
		mav.setViewName("Grade");
		
		return mav;
	}

}

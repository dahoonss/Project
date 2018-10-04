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
	
	public ModelAndView AddGrade(String grade, HttpSession session,String edriverId) {
	
		mav = new ModelAndView();
		
		System.out.println("gradeDAO전");
		//평점주는 유저 ID
		String id2 = (String)session.getAttribute("id");
		MemberVO Grade = gradeDAO.SelectDriverInfo(id2);
		
		
		double sum = Grade.getGrade();
		double count = Grade.getGradeCount();
		double ffinal = Grade.getFinalgrade();
		/*double ffinal2 = Double.parseDouble(String.format("%.1f", ffinal));*/
	
		//계산
		sum = sum+Integer.parseInt(grade);
		count+=1;
		ffinal = sum/count;
		//값 저장    드라이버 아뒤를....
		Grade.setId(edriverId);
		Grade.setGrade(sum);
		Grade.setGradeCount(count);
		Grade.setFinalgrade(ffinal);
		//평점 업데이트
		System.out.println("드라이버 아뒤 "+edriverId);
		gradeDAO.UpdateDriverInfo(Grade);
		mav.addObject("gogo",Grade);
		mav.setViewName("Grade");
		
		return mav;
	}

}

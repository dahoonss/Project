package com.with.project.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String Id;
	private String Password;
	private String Gender;
	private String Email;
	private String Tel;
	private String Address;
	private int Point;
	private int Passuser;
	private String Certificate; //파일 이름 -> 자격증
	private double Grade;
	private String Name;
	private double GradeCount;//여러사람 인원수 
	private double Finalgrade; //평점구해는 컬럼
	
	
	
	public double getGradeCount() {
		return GradeCount;
	}

	public void setGradeCount(double gradeCount) {
		GradeCount = gradeCount;
	}

	public double getFinalgrade() {
		return Finalgrade;
	}

	public void setFinalgrade(double finalgrade) {
		Finalgrade = finalgrade;
	}

	private MultipartFile File;

	
	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getTel() {
		return Tel;
	}

	public void setTel(String tel) {
		Tel = tel;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public int getPoint() {
		return Point;
	}

	public void setPoint(int point) {
		Point = point;
	}

	public int getPassuser() {
		return Passuser;
	}

	public void setPassuser(int passuser) {
		Passuser = passuser;
	}

	public String getCertificate() {
		return Certificate;
	}

	public void setCertificate(String certificate) {
		Certificate = certificate;
	}

	public double getGrade() {
		return Grade;
	}

	public void setGrade(double grade) {
		Grade = grade;
	}

	public MultipartFile getFile() {
		return File;
	}

	public void setFile(MultipartFile file) {
		File = file;
	}

	
}

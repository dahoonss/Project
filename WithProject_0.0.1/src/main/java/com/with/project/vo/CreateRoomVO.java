package com.with.project.vo;

public class CreateRoomVO {

	private String Id1; //아이디1
	private String Id2;//아이디2
	private String Id3;//아이디3
	private String Id4;//아이디4
	private int RoomId; //방 번호
	private String Starts; //출발지
	private String Arrive; //도착지
	private String Street;//예상거리
	private int Price; //예상금액
	private String SelectGender; //성별 선택
	private String Dayday; //예약날짜
	private String Times; //예약시간
	

	public int getRoomId() {
		return RoomId;
	}
	public void setRoomId(int roomid) {
		RoomId = roomid;
	}
	public String getStarts() {
		return Starts;
	}
	public void setStarts(String starts) {
		Starts = starts;
	}
	public String getArrive() {
		return Arrive;
	}
	public void setArrive(String arrive) {
		Arrive = arrive;
	}
	public String getStreet() {
		return Street;
	}
	public void setStreet(String street) {
		Street = street;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public String getSelectGender() {
		return SelectGender;
	}
	public void setSelectGender(String selectGender) {
		SelectGender = selectGender;
	}
	public String getId1() {
		return Id1;
	}
	public void setId1(String id1) {
		Id1 = id1;
	}
	public String getId2() {
		return Id2;
	}
	public void setId2(String id2) {
		Id2 = id2;
	}
	public String getId3() {
		return Id3;
	}
	public void setId3(String id3) {
		Id3 = id3;
	}
	public String getId4() {
		return Id4;
	}
	public void setId4(String id4) {
		Id4 = id4;
	}
	public String getDayday() {
		return Dayday;
	}
	public void setDayday(String dayday) {
		Dayday = dayday;
	}
	public String getTimes() {
		return Times;
	}
	public void setTimes(String times) {
		Times = times;
	}
	
	

	
	
	
}

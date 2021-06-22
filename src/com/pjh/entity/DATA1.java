package com.pjh.entity;

public class DATA1 {
	private String ip;
	private String time;
	private String day;
	private int traffic;
	private String type;
	private String Id;	
	private String dizhi;	
	private String riqi;
	public DATA1(String ip, String time, String day, int traffic, String type, String id, String dizhi, String riqi) {
		super();
		this.ip = ip;
		this.time = time;
		this.day = day;
		this.traffic = traffic;
		this.type = type;
		Id = id;
		this.dizhi = dizhi;
		this.riqi = riqi;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getTraffic() {
		return traffic;
	}
	public void setTraffic(int traffic) {
		this.traffic = traffic;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getDizhi() {
		return dizhi;
	}
	public void setDizhi(String dizhi) {
		this.dizhi = dizhi;
	}
	public String getRiqi() {
		return riqi;
	}
	public void setRiqi(String riqi) {
		this.riqi = riqi;
	}	
}

package com.pjh.entity;

import java.util.ArrayList;

public class CHARTS {
	private ArrayList<String> names;
	private ArrayList<Integer> datas;
	public CHARTS(ArrayList<String> names, ArrayList<Integer> datas) {
		super();
		this.names = names;
		this.datas = datas;
	}
	public ArrayList<String> getNames() {
		return names;
	}
	public void setNames(ArrayList<String> names) {
		this.names = names;
	}
	public ArrayList<Integer> getDatas() {
		return datas;
	}
	public void setDatas(ArrayList<Integer> datas) {
		this.datas = datas;
	}
}

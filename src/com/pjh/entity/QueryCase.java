package com.pjh.entity;

import java.util.ArrayList;

public class QueryCase {
	String cs;
	String cls;
	String cont;
	String how;

	public QueryCase(String cs, String cls, String cont, String how) {
		super();
		this.cs = cs;
		this.cls = cls;
		this.cont = cont;
		this.how = how;
	}

	public String getCs() {
		return cs;
	}

	public void setCs(String cs) {
		this.cs = cs;
	}

	public String getCls() {
		return cls;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public String getHow() {
		return how;
	}

	public void setHow(String how) {
		this.how = how;
	}

	public static String toSqL(ArrayList<QueryCase> list, String state) {
		StringBuilder stringBuilder = new StringBuilder();
		int i=0;
		for (QueryCase queryCase : list) {
			String str = " ";
			if (i>0) {
				str = queryCase.getCs().equals("0")?" and ":" or ";
			}
			if(queryCase.getHow().equals("0")) {
				stringBuilder.append(str + queryCase.getCls() + " = '" + queryCase.getCont() + "'");
			} else {
				stringBuilder.append(str + queryCase.getCls() + " like '%" + queryCase.getCont() + "%'");
			}
			i=1;
		}
		String[] strs = state.split(" ");
		for (String string : strs) {
			if (string.equals("0")) {
				stringBuilder.append(" and status=1");
			} else if (string.equals("1")) {
				stringBuilder.append(" and status<1");
			} else if (string.equals("2")) {
				stringBuilder.append(" and status2=1");
			} else if (string.equals("3")) {
				stringBuilder.append(" and status2<1");
				
			}
		}
		return stringBuilder.toString();
	}
}

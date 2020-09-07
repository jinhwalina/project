package kr.green.project.Vo;

import org.apache.ibatis.javassist.expr.Instanceof;

public class DateVo {
	private String st_date;
	private String end_date;
	
	
	public String getSt_date() {
		return st_date;
	}
	public void setSt_date(String st_date) {
		this.st_date = st_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	@Override
	public String toString() {
		return "DateVo [st_date=" + st_date + ", end_date=" + end_date + "]";
	}
	

	
	
	
}

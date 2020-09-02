package kr.green.project.Vo;

public class InnVo {
	private String inn_num;
	private String inn_total_price;
	private String inn_st_date;
	private String inn_isRe;
	private String inn_service;
	private String inn_user_mail;
	private String pname;
	private String name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private String inn_time;
	
	public String getInn_num() {
		return inn_num;
	}
	public void setInn_num(String inn_num) {
		this.inn_num = inn_num;
	}
	public String getInn_total_price() {
		return inn_total_price;
	}
	public void setInn_total_price(String inn_total_price) {
		this.inn_total_price = inn_total_price;
	}
	public String getInn_st_date() {
		return inn_st_date;
	}
	public void setInn_st_date(String inn_st_date) {
		this.inn_st_date = inn_st_date;
	}
	public String getInn_isRe() {
		return inn_isRe;
	}
	public void setInn_isRe(String inn_isRe) {
		this.inn_isRe = inn_isRe;
	}
	public String getInn_service() {
		return inn_service;
	}
	public void setInn_service(String inn_service) {
		this.inn_service = inn_service;
	}
	public String getInn_user_mail() {
		return inn_user_mail;
	}
	public void setInn_user_mail(String inn_user_mail) {
		this.inn_user_mail = inn_user_mail;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getInn_time() {
		return inn_time;
	}
	public void setInn_time(String inn_time) {
		this.inn_time = inn_time;
	}
	@Override
	public String toString() {
		return "InnVo [inn_num=" + inn_num + ", inn_total_price=" + inn_total_price + ", inn_st_date=" + inn_st_date
				+ ", inn_isRe=" + inn_isRe + ", inn_service=" + inn_service + ", inn_user_mail=" + inn_user_mail
				+ ", pname=" + pname + ", name=" + name + ", inn_time=" + inn_time + "]";
	}
	
	
}

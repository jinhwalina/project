package kr.green.project.Vo;

public class InnVo {
	private String inn_num;
	private String inn_total_price;
	private String inn_st_date;
	private String inn_isRe;
	private String inn_time;
	
	private String inn_service;
	private String inn_user_mail;
	private String inn_add_name;
	private String inn_add_num;
	private int inn_petnum;
	private String inn_pay;
	private String inn_pay_type;
	private String inn_reIsRe;
	
	public String getInn_reIsRe() {
		return inn_reIsRe;
	}
	public void setInn_reIsRe(String inn_reIsRe) {
		this.inn_reIsRe = inn_reIsRe;
	}
	public String getInn_pay_type() {
		return inn_pay_type;
	}
	public void setInn_pay_type(String inn_pay_type) {
		this.inn_pay_type = inn_pay_type;
	}
	public String getInn_pay() {
		return inn_pay;
	}
	public void setInn_pay(String inn_pay) {
		this.inn_pay = inn_pay;
	}
	public String getInn_time() {
		return inn_time;
	}
	public void setInn_time(String inn_time) {
		this.inn_time = inn_time;
	}
	public int getInn_petnum() {
		return inn_petnum;
	}
	public void setInn_petnum(int inn_petnum) {
		this.inn_petnum = inn_petnum;
	}
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
	public String getInn_add_name() {
		return inn_add_name;
	}
	public void setInn_add_name(String inn_add_name) {
		this.inn_add_name = inn_add_name;
	}
	public String getInn_add_num() {
		return inn_add_num;
	}
	public void setInn_add_num(String inn_add_num) {
		this.inn_add_num = inn_add_num;
	}
	@Override
	public String toString() {
		return "InnVo [inn_num=" + inn_num + ", inn_total_price=" + inn_total_price + ", inn_st_date=" + inn_st_date
				+ ", inn_isRe=" + inn_isRe + ", inn_time=" + inn_time + ", inn_service=" + inn_service
				+ ", inn_user_mail=" + inn_user_mail + ", inn_add_name=" + inn_add_name + ", inn_add_num=" + inn_add_num
				+ ", inn_petnum=" + inn_petnum + ", inn_pay=" + inn_pay + ", inn_pay_type=" + inn_pay_type
				+ ", inn_reIsRe=" + inn_reIsRe + "]";
	}
	
	
	
}

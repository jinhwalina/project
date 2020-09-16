package kr.green.project.Vo;

import java.util.Date;

public class QnaBoardVo {
	private String qna_num;
	private String qna_title;
	private String qna_content;
	private int qna_view;
	private String qna_regi;
	private Date qna_del;
	private String qna_u_mail;
	private char qna_isDel;
	private String qna_select;
	private int qna_recnt;
	
	public int getQna_recnt() {
		return qna_recnt;
	}
	public void setQna_recnt(int qna_recnt) {
		this.qna_recnt = qna_recnt;
	}
	private int qna_ori;
	
	
	public int getQna_ori() {
		return qna_ori;
	}
	public void setQna_ori(int qna_ori) {
		this.qna_ori = qna_ori;
	}
	public String getQna_num() {
		return qna_num;
	}
	public void setQna_num(String qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getQna_view() {
		return qna_view;
	}
	public void setQna_view(int qna_view) {
		this.qna_view = qna_view;
	}
	public String getQna_regi() {
		return qna_regi;
	}
	public void setQna_regi(String qna_regi) {
		this.qna_regi = qna_regi;
	}
	public Date getQna_del() {
		return qna_del;
	}
	public void setQna_del(Date qna_del) {
		this.qna_del = qna_del;
	}
	public String getQna_u_mail() {
		return qna_u_mail;
	}
	public void setQna_u_mail(String qna_u_mail) {
		this.qna_u_mail = qna_u_mail;
	}
	public char getQna_isDel() {
		return qna_isDel;
	}
	public void setQna_isDel(char qna_isDel) {
		this.qna_isDel = qna_isDel;
	}
	public String getQna_select() {
		return qna_select;
	}
	public void setQna_select(String qna_select) {
		this.qna_select = qna_select;
	}
	@Override
	public String toString() {
		return "QnaBoardVo [qna_num=" + qna_num + ", qna_title=" + qna_title + ", qna_content=" + qna_content
				+ ", qna_view=" + qna_view + ", qna_regi=" + qna_regi + ", qna_del=" + qna_del + ", qna_u_mail="
				+ qna_u_mail + ", qna_isDel=" + qna_isDel + ", qna_select=" + qna_select + ", qna_recnt=" + qna_recnt
				+ ", qna_ori=" + qna_ori + "]";
	}
	
	
	

}

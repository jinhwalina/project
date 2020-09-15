package kr.green.project.dto;

public class qnaDto {
	private String qna_num;
	private String qna_title;
	private String qna_content;
	private int qna_view;
	private String qna_regi;
	private String qna_del;
	private char qna_isDel;
	private String nickname;
	private String qna_u_mail;
	private String qna_select;
	
	
	
	public String getQna_select() {
		return qna_select;
	}
	public void setQna_select(String qna_select) {
		this.qna_select = qna_select;
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
	public String getQna_del() {
		return qna_del;
	}
	public void setQna_del(String qna_del) {
		this.qna_del = qna_del;
	}
	public char getQna_isDel() {
		return qna_isDel;
	}
	public void setQna_isDel(char qna_isDel) {
		this.qna_isDel = qna_isDel;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getQna_u_mail() {
		return qna_u_mail;
	}
	public void setQna_u_mail(String qna_u_mail) {
		this.qna_u_mail = qna_u_mail;
	}
	@Override
	public String toString() {
		return "qnaDto [qna_num=" + qna_num + ", qna_title=" + qna_title + ", qna_content=" + qna_content
				+ ", qna_view=" + qna_view + ", qna_regi=" + qna_regi + ", qna_del=" + qna_del + ", qna_isDel="
				+ qna_isDel + ", nickname=" + nickname + ", qna_u_mail=" + qna_u_mail + "]";
	}
	
	
}

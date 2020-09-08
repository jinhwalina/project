package kr.green.project.Vo;

public class ReviewBoardVo {
	private String review_num;
	private String review_star;
	private String review_title;
	private String review_content;
	private String review_view;
	private String review_regi;
	private String review_del;
	private String review_file_num;
	private String review_u_mail;
	
	
	public String getReview_num() {
		return review_num;
	}
	public void setReview_num(String review_num) {
		this.review_num = review_num;
	}
	public String getReview_star() {
		return review_star;
	}
	public void setReview_star(String review_star) {
		this.review_star = review_star;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_view() {
		return review_view;
	}
	public void setReview_view(String review_view) {
		this.review_view = review_view;
	}
	public String getReview_regi() {
		return review_regi;
	}
	public void setReview_regi(String review_regi) {
		this.review_regi = review_regi;
	}
	public String getReview_del() {
		return review_del;
	}
	public void setReview_del(String review_del) {
		this.review_del = review_del;
	}
	public String getReview_file_num() {
		return review_file_num;
	}
	public void setReview_file_num(String review_file_num) {
		this.review_file_num = review_file_num;
	}
	public String getReview_u_mail() {
		return review_u_mail;
	}
	public void setReview_u_mail(String review_u_mail) {
		this.review_u_mail = review_u_mail;
	}
	public String getReview_isDel() {
		return review_isDel;
	}
	public void setReview_isDel(String review_isDel) {
		this.review_isDel = review_isDel;
	}
	private String review_isDel;


	@Override
	public String toString() {
		return "ReviewBoardVo [review_num=" + review_num + ", review_star=" + review_star + ", review_title="
				+ review_title + ", review_content=" + review_content + ", review_view=" + review_view
				+ ", review_regi=" + review_regi + ", review_del=" + review_del + ", review_file_num=" + review_file_num
				+ ", review_u_mail=" + review_u_mail + ", review_isDel=" + review_isDel + "]";
	}
	
	
}

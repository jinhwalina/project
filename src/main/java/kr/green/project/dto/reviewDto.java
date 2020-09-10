package kr.green.project.dto;

public class reviewDto {
	private String review_num;
	private String review_star;
	private String review_title;
	private String review_content;
	private int review_view;
	private String review_regi;
	private String review_del;
	private char review_isDel;
	private String review_file_num;
	private String review_u_mail;
	private String review_file;
	private int review_up;
	private int review_like;
	private String nickname;
	
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
	public int getReview_view() {
		return review_view;
	}
	public void setReview_view(int review_view) {
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
	public char getReview_isDel() {
		return review_isDel;
	}
	public void setReview_isDel(char review_isDel) {
		this.review_isDel = review_isDel;
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
	public String getReview_file() {
		return review_file;
	}
	public void setReview_file(String review_file) {
		this.review_file = review_file;
	}
	public int getReview_up() {
		return review_up;
	}
	public void setReview_up(int review_up) {
		this.review_up = review_up;
	}
	public int getReview_like() {
		return review_like;
	}
	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "reviewDto [review_num=" + review_num + ", review_star=" + review_star + ", review_title=" + review_title
				+ ", review_content=" + review_content + ", review_view=" + review_view + ", review_regi=" + review_regi
				+ ", review_del=" + review_del + ", review_isDel=" + review_isDel + ", review_file_num="
				+ review_file_num + ", review_u_mail=" + review_u_mail + ", review_file=" + review_file + ", review_up="
				+ review_up + ", review_like=" + review_like + ", nickname=" + nickname + "]";
	}
	
	public String getOriFile() {
		// 파일 이름보면 /월/일/ 이런식으로 표현되는데 , 뒤에 파일명만 보여야하는데 이 본래 파일명만 보여주게함
		// DB에 저장된 file이름은 /년도/월/일/uuid_파일명.확장자 로 되어있는데, 사용자는 파일명.확장자 만 보여줘야하기 때문에 getOriFile을 통해 원본 파일명을 알려준다.
		if(review_file == null)
			return ""; // 여기서 조건을 붙여준 이유는, 첨부파일이 안들어가있을수도 있는데 그렇다면 null값으로 지정된다. 하지만 널값인 경우 처리해주는 코드가 없기때문에 리턴으로 ""을 주면 수정할때 첨부파일은 공백으로 처리된다 !
		int index = review_file.indexOf("_");
		return review_file.substring(index+1); 
	}
	
	
}

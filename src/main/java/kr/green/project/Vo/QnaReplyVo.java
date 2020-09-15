package kr.green.project.Vo;


public class QnaReplyVo {
	private int reply_qna_num;
	private int reply_num;
	private String reply_content;
	private String reply_writer;
	private String reply_regi;
	@Override
	public String toString() {
		return "QnaReplyVo [reply_qna_num=" + reply_qna_num + ", reply_num=" + reply_num + ", reply_content="
				+ reply_content + ", reply_writer=" + reply_writer + ", reply_regi=" + reply_regi + "]";
	}
	public int getReply_qna_num() {
		return reply_qna_num;
	}
	public void setReply_qna_num(int reply_qna_num) {
		this.reply_qna_num = reply_qna_num;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public String getReply_regi() {
		return reply_regi;
	}
	public void setReply_regi(String reply_regi) {
		this.reply_regi = reply_regi;
	}

	
	
}

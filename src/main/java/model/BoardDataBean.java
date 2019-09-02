package model;

import java.io.Serializable;
import java.util.Date;

public class BoardDataBean implements Serializable {

	private int num;
	private boolean important;
	private String nickname;
	private String title;
	private String content;
	private Date reg_date;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public boolean isImportant() {
		return important;
	}
	public void setImportant(boolean important) {
		this.important = important;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "BoardDataBean [num=" + num + ", important=" + important + ", nickname=" + nickname + ", title=" + title
				+ ", content=" + content + ", reg_date=" + reg_date + "]";
	}
}

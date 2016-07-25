
package app.blank.entity;

public class Msg {
	
	private int msgid;
	private String username;
	private String title;
	private String msgcontent;
	private int state;
	private String sendto;
	private String create_date;
	
	public int getMsgid() {
		return msgid;
	}
	
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getMsgcontent() {
		return msgcontent;
	}
	
	public void setMsgcontent(String msgcontent) {
		this.msgcontent = msgcontent;
	}
	
	public int getState() {
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
	public String getSendto() {
		return sendto;
	}
	
	public void setSendto(String sendto) {
		this.sendto = sendto;
	}
	
	public String getCreate_date() {
		return create_date;
	}
	
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	
	
}

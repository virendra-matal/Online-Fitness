package com.fitness.helper;

public class MyResponse {
	
	private String content;
	private String type;
	public MyResponse(String content, String type) {
		super();
		this.content = content;
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "MyResponse [content=" + content + ", type=" + type + "]";
	}
	
	

}

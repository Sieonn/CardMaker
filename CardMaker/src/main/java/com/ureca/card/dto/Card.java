package com.ureca.card.dto;

public class Card {
	private Long id;
    private String title;
    private String content;
    private String imagePath;
    private String writer;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "Card [id=" + id + ", title=" + title + ", content=" + content + ", imagePath=" + imagePath + ", writer="
				+ writer + "]";
	}
	
}

package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class R_Music {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false) // NOT NULL
	private Long rmuSeq; // 노래순번

	@Column(length = 600, nullable = false, columnDefinition = "TEXT") 
	private String rmuLyrics; // 가사

	@Column(length = 50, nullable = false) 
	private String rmuSinger; // 가수

	@Column(length = 600, nullable = false)  
	private String rmuTitle; // 노래제목

	@Column(length = 20, nullable = false)  
	private String rmuGenre; // 노래장르

	@Column(length = 600, nullable = false)  
	private String rmuAlbumImg; // 앨범이미지

	@Column(length = 30, nullable = false)  
	private String rmuEmo; // 음악 감정
}